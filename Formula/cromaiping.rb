class Cromaiping < Formula
  desc "AI 코딩 도구용 한국형 사운드 알림 시스템 (CESP v1.0 호환)"
  homepage "https://cromaizing.com/cromaiping"
  url "https://github.com/cromaizing/cromaiping/releases/download/v0.1.4/cromaiping-0.1.4.tar.gz"
  sha256 "25ad51c4ec5e56b68aa29d20bb01dcf4f37592da591eabb432608f0263abb481"
  version "0.1.4"
  license "MIT"

  depends_on "python@3.11" => :recommended

  def install
    libexec.install Dir["*"]
    (bin/"cromaiping").write <<~SH
      #!/bin/bash
      exec bash "#{libexec}/cromaiping.sh" "$@"
    SH
    (bin/"cromaiping").chmod 0755
  end

  def caveats
    <<~EOS
      🎬 크로마이핑 v0.1.4 — 카리나 GIF 오버레이

      훅 등록:
        bash #{opt_libexec}/install.sh

      Claude Code 재시작 → 카리나 음성 + 투명 GIF 오버레이 동작.

      홈페이지: https://cromaizing.com/cromaiping
    EOS
  end

  test do
    assert_match "크로마이핑", shell_output("#{bin}/cromaiping version")
  end
end
