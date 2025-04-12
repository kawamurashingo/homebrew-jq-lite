class JqLite < Formula
  desc "A lightweight jq-like JSON query tool written in pure Perl"
  homepage "https://github.com/kawamurashingo/JQ-Lite"
  license "Artistic-1.0-Perl"
  head "https://github.com/kawamurashingo/JQ-Lite.git", branch: "main"

  depends_on "perl"

  def install
    system "find", ".", "-exec", "touch", "{}", "+"

    system "perl", "Makefile.PL", "PREFIX=#{prefix}"
    system "make"
    system "make", "test"
    system "make", "install"
  end

  test do
    (testpath/"test.json").write('{"foo": "bar"}')
    output = shell_output("#{bin}/jq-lite .foo test.json").strip
    assert_equal '"bar"', output
  end
end
