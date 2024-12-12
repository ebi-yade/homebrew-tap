class Ecresolve < Formula
  desc 'Resolves AWS ECR images with prioritized tag-based lookup'
  version '0.0.6'
  homepage 'https://github.com/ebi-yade/ecresolve'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.6/ecresolve_0.0.6_darwin_arm64.tar.gz'
      sha256 '40b6d6f68e866d3c2677664759ecb1e7c49653649947171441a59e1c1b892304'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.6/ecresolve_0.0.6_darwin_amd64.tar.gz'
      sha256 'b90ead4988391eaa76bdafb997ec8170a341472bdfd69f6b4e27e0181e994f72'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.6/ecresolve_0.0.6_linux_arm64.tar.gz'
      sha256 '57cfb32c4731d4db3b76e9cc4b9b8912ff47fd5dd9642eb885495075dd8defde'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/ebi-yade/ecresolve/releases/download/v0.0.6/ecresolve_0.0.6_linux_amd64.tar.gz'
      sha256 '09dd5bf3ca7e0c253ffff0eb200a4ccedd9f6affea482ff2b00dfbf48674146a'
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
