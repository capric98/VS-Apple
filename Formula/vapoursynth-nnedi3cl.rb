class VapoursynthNnedi3cl < Formula
    desc "NNEDI3CL filter for VapourSynth"
    homepage "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL"
    url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL/archive/refs/tags/r8.tar.gz"
    sha256 "85ba921c9f714d6ad73a69d808dbb7e1cb4c29ae60d19b27e49b5096b79474c6"
    license "GPL-2.0 License"
  
    depends_on "meson" => :build
    depends_on "ninja" => :build
    depends_on "cmake" => :build
    depends_on "zimg" => :build
    depends_on "vapoursynth" => :build

    resource "nnedi3_weights" do
      url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL/blob/master/NNEDI3CL/nnedi3_weights.bin"
      sha256 "82c80642fbdea9f03c6b24ce9cdfce8e10338572f18b02b21c9fc4f0dc5f8280"
    end
  
    def install
      system "meson", "build/"
      system "ninja", "-C", "build/"
      system "meson", "install", "-C", "build/", "--destdir", "#{prefix}/lib"
      system "/bin/bash", "-c", "cp -r $(find -L . -name *.dylib) #{prefix}/lib"
      system "rm", "-rf", "#{prefix}/lib/opt"

      resource("nnedi3_weights").stage do
        system "mv", "nnedi3_weights.bin", "#{prefix}/lib/"
      end
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
  