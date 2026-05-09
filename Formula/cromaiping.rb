class Cromaiping < Formula
  desc "AI 코딩 도구용 한국형 사운드 알림 시스템 (CESP v1.0 호환)"
  homepage "https://cromaizing.com/cromaiping"
  url "https://github.com/cromaizing/cromaiping/releases/download/v0.1.5/cromaiping-0.1.5.tar.gz"
  sha256 "06d5cc1477c25851cba0a4c8238cd41798decbff78bb11284e1e61aabeae2645"
  version "0.1.5"
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
      🎬 크로마이핑 v0.1.5 — task.acknowledge 기본 ON

      훅 등록:
        bash #{opt_libexec}/install.sh

      Claude Code 재시작하면 카리나가 매 메시지마다 응답합니다.
      너무 자주면: cromaiping pause

      홈페이지: https://cromaizing.com/cromaiping
    EOS
  end

  test do
    assert_match "크로마이핑", shell_output("#{bin}/cromaiping version")
  end
end
