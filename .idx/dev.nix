{ pkgs, ... }: {
  channel = "unstable";
  packages = [
    pkgs.nodejs_latest
    pkgs.curl
    pkgs.git
    pkgs.himalaya       # 邮件技能
    pkgs.ffmpeg         # 视频帧处理
    pkgs.uv             # Python 插件环境
    pkgs.go             # 辅助工具编译
  ];

  idx = {
    extensions = [ "google.gemini-cli-vscode-ide-companion" ];
    workspace = {
      onCreate = {
        # 自动执行下方的安装脚本
        setup-openclaw = "bash setup.sh";
      };
    };
  };
}
