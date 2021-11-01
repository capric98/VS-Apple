class VapoursynthHqdn3d < Formula
    desc "Avisynth port of hqdn3d from avisynth/mplayer"
    homepage "https://github.com/dubhater/vapoursynth-fluxsmooth"
    head "https://github.com/Hinterwaeldlers/vapoursynth-hqdn3d.git"
    # sha256 "975bdf16ec52c9d3ebfd487db10799c0ccb8f8c5e0e70d48df0f8067c5f24fcb"
    license "No License"
  
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "zimg" => :build
    depends_on "vapoursynth" => :build
  
    def install
      system "./autogen.sh"
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test HomeOfVapourSynthEvolution/BM3D`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  