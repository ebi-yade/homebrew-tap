class WhyGoOver < Formula
  desc 'Identifies dependent modules that have raised the Go version'
  version '0.0.1'
  homepage 'https://github.com/ebi-yade/why-go-over'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/ebi-yade/why-go-over/releases/download/v0.0.1/why-go-over_0.0.1_darwin_arm64.tar.gz'
      sha256 '7bf9afba9b83903405e566ba50e5701e6e8ec9d57a668094a503a294b6f90524'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/why-go-over/releases/download/v0.0.1/why-go-over_0.0.1_darwin_amd64.tar.gz'
      sha256 '438c7f2b01bf79b11d3ffce931e020d56deeb0a87f33a4909946d765f2a129ec'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/ebi-yade/why-go-over/releases/download/v0.0.1/why-go-over_0.0.1_linux_arm64.tar.gz'
      sha256 'b53623454fc6221748f2533c0fadb010aba4b3548e0a8ba11b166cd4ccc8c2b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/why-go-over/releases/download/v0.0.1/why-go-over_0.0.1_linux_amd64.tar.gz'
      sha256 '9054536521a36bc6ce5e521dbdda7899323b1330bf59422c3b211fbb1becc3b7'
    end
  end

  head do
    url 'https://github.com/ebi-yade/why-go-over.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'why-go-over'
  end
end
