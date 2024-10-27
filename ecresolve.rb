class Ecresolve < Formula
  desc 'Resolves AWS ECR images with prioritized tag-based lookup'
  version '0.0.4'
  homepage 'https://github.com/ebi-yade/ecresolve'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.4/ecresolve_0.0.4_darwin_arm64.tar.gz'
      sha256 '8927be44e6ed261c2177b8965984eab4438315f660d6f439deb1d91710cb46bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.4/ecresolve_0.0.4_darwin_amd64.tar.gz'
      sha256 '22e33023a7d3e163707ca1a6f7d7d8ed3c6789b5e7f3ef16fdee424860474a60'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.4/ecresolve_0.0.4_linux_arm64.tar.gz'
      sha256 '07e95840097ee0498fd98c0940d403add08b4e1450d433ce570bd98cf8e4f280'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.4/ecresolve_0.0.4_linux_amd64.tar.gz'
      sha256 '20dad90ff17671f7c1075b4e223709526912a9f9848618e1597092d495f7a8e5'
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
