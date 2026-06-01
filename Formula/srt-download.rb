class SrtDownload < Formula
  desc "Download subtitles for local video files recursively"
  homepage "https://github.com/GioPalusa/SRT-downloader"
  version "0.1.0"

  # Prebuilt binaries are published for Apple Silicon only. Intel Mac
  # users should install via pipx (see the project README).
  depends_on arch: :arm64

  on_macos do
    url "https://github.com/GioPalusa/SRT-downloader/releases/download/v0.1.0/srt-download-macos-arm64"
    sha256 "4ecddace909447acd2d524e2138365bd0fe33466bbbd3eeeee07309641afe60f"
  end

  def install
    bin.install "srt-download-macos-arm64" => "srt-download"
  end

  def caveats
    <<~EOS
      Quick start:
        srt-download                  scan current folder
        srt-download -l sv            primary language (English added as fallback)
        srt-download --list-providers show provider order
        srt-download --help           full help

      Drop a srt-downloader.yaml next to your videos for defaults and provider creds.
      Docs: https://github.com/GioPalusa/SRT-downloader#readme
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srt-download --version")
  end
end
