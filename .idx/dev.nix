{ pkgs, ... }: {
  channel = "unstable";
  packages = [
    pkgs.nodejs_latest
    pkgs.curl
    pkgs.git
    pkgs.ffmpeg
    pkgs.uv
  ];
  idx = {
    extensions = [ "google.gemini-cli-vscode-ide-companion" ];
    workspace = {
      # 重点：每次创建新工作区，自动跑我们的脚本
      onCreate = {
        setup-openclaw = "bash setup.sh";
      };
    };
  };
}