class Fmtconv < Formula
  desc "Format conversion tools for Vapoursynth"
  homepage "https://github.com/EleonoreMizo/fmtconv/"
  url "https://github.com/EleonoreMizo/fmtconv/archive/refs/tags/r26.tar.gz"
  sha256 "26748423bb10523c81cf13eea6006dad39cba9b69376ec035fc4a7e5c5fb24c1"
  license "WTFPL"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  # depends_on "vapoursynth" => :build

  def install
    # Patch to r26
    system "/bin/bash", "-c", 'sed -i "" "261s/.*/#if \(defined \(__APPLE__\) \&\& conc_ARCHI == conc_ARCHI_X86\) \|\| \(defined \(__CYGWIN__\) \&\& conc_WORD_SIZE == 64\)/" src/conc/Interlocked.hpp'
    system "/bin/bash", "-c", 'sed -i "" "312s/.*/\told = comp;\n\t__atomic_compare_exchange_n \(\n\t\t\&dest, \&old, excg,\n\t\tfalse, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST\n\t\);/g" src/conc/Interlocked.hpp'

    Dir.chdir("build/unix")
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test HomeOfVapourSynthEvolution/fmtconv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
