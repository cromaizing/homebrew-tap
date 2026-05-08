class Cromaiping < Formula
  desc "AI 코딩 도구용 한국형 사운드 알림 시스템 (CESP v1.0 호환)"
  homepage "https://cromaizing.com/cromaiping"
  url "https://github.com/cromaizing/cromaiping/releases/download/v0.1.1/cromaiping-0.1.1.tar.gz"
  sha256 "08cb904cfe608fcc11b7f7f2d699232190946c29e9c45687a6719c4d2108cd1a"
  version "0.1.1"
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
      🎵 크로마이핑이 설치되었습니다.

      Claude Code 훅 + 슬래시 명령어를 등록하려면 다음을 한 번 실행해주세요:
        bash #{opt_libexec}/install.sh

      그 후 Claude Code(터미널/데스크톱 앱)를 재시작하면 동작합니다.

      슬래시 명령어 (Claude 앱):
        /cromaiping-status, /cromaiping-toggle, /cromaiping-volume,
        /cromaiping-use <팩>, /cromaiping-list, /cromaiping-help
        (한국어: /크로마이핑-상태, /크로마이핑-음소거 등)

      터미널 명령어:
        cromaiping help

      홈페이지: https://cromaizing.com/cromaiping
    EOS
  end

  test do
    assert_match "크로마이핑", shell_output("#{bin}/cromaiping version")
  end
end
