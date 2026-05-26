# Security Policy

## 支持范围

本项目只维护公开仓库中的补丁脚本，不分发 Cursor 官方文件，也不提供修改后的 Cursor 安装包。

## 安全说明

补丁会修改你本机安装的 Cursor 应用资源。运行前请自行阅读脚本内容，并确认来源是你信任的仓库。

推荐第一次使用：

```bash
git clone https://github.com/ztx888/cursor-zh-localizer.git
cd cursor-zh-localizer
node patch-cursor-zh.js
```

不建议在不了解内容的情况下直接运行来自陌生来源的一行安装命令。

## 报告问题

请通过 GitHub Issues 提交安全或异常行为报告，并附上：

- Cursor 版本
- macOS 版本
- 运行命令
- 终端输出
- 相关截图
