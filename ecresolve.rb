class Ecresolve < Formula
  desc 'Resolves AWS ECR images with prioritized tag-based lookup'
  version '0.0.5'
  homepage 'https://github.com/ebi-yade/ecresolve'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.5/ecresolve_0.0.5_darwin_arm64.tar.gz'
      sha256 'd994b8f4e148875a61460b775597bba3e262f476bc4a81cb546d521e2a645732'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.5/ecresolve_0.0.5_darwin_amd64.tar.gz'
      sha256 '7ebde2c34215c63a88b0772226e4985ae05c1afbc00a445dfb4875e339492842'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.5/ecresolve_0.0.5_linux_arm64.tar.gz'
      sha256 '623ebb80e97f2a39ca75a1b12d3f116045333a195e4c7dca8510bbf39b44012b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.5/ecresolve_0.0.5_linux_amd64.tar.gz'
      sha256 '65cf19f1c4be8b5ec5e59ab6ff31f1cc987748281c5ad55c608ff1dd6622ccc6'
    end
  end

  head do
    url 'https://github.com/ebi-yade/ecresolve.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecresolve'
  end
end
