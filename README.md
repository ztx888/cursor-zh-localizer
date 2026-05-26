<div align="center">

# Cursor 中文汉化增强补丁

把 Cursor 语言包覆盖不到的英文界面，全部汉化为更自然、更适合日常使用的中文。


**设置页、Agent 面板、模型设置、审查页、悬浮提示、工具调用状态，一次补齐。**


<br />

<p align="center">
  <img width="640" alt="Cursor 中文汉化增强补丁概览" src="https://github.com/user-attachments/assets/a16c2e0f-619b-401d-a0ec-9459c4ca1386" />
</p>

<table>
  <tr>
    <td width="66%" align="center" valign="top">
      <img width="560" alt="Cursor 设置与智能体界面汉化效果" src="https://github.com/user-attachments/assets/89078888-a4f3-4fbd-ad32-4833d11b4b61" />
      <br />
      <sub>设置页、模型参数与智能体界面</sub>
    </td>
    <td width="34%" align="center" valign="top">
      <img width="250" alt="Cursor 菜单与细节汉化效果" src="https://github.com/user-attachments/assets/48c9cefa-f708-44a6-a8ba-1b70835bf71d" />
      <br />
      <sub>菜单、悬浮提示与细节文案</sub>
    </td>
  </tr>
</table>

</div>

---

## 这是什么

这是一个面向 macOS Cursor 的中文增强补丁：安装官方 Cursor 后运行一次，就能把官方语言包没有覆盖到的所有核心界面补成中文，甚至包括模型对话和调用过程

## 它解决什么

Cursor 官方语言包能翻译一部分 VS Code 基础界面，但 Cursor 自己新增的功能里仍有大量英文，尤其是：

| 区域 | 补丁覆盖 |
| --- | --- |
| Cursor 设置页 | 通用、布局、智能体、模型、索引、MCP、自动运行、通知等 |
| Agent / Plan / Ask / Debug | 模式名称、说明、状态、切换提示 |
| 模型设置 | Reasoning、模型参数、编辑选项、重置/继承/禁用等菜单 |
| Agent Review | 审查页、PR、合并、提交、差异、保留/撤销等操作 |
| 工具调用状态 | 读取、搜索、等待、终端、电脑操作、MCP 等状态文案 |
| 时间与细节 | 分钟、小时、天、周、按钮 tooltip、空状态和错误提示 |

这不是普通 VS Code 插件，而是一个安装后补丁脚本。它会修改你本机已安装的 Cursor 应用资源，让 Cursor 自己的核心界面也能显示中文。

## 快速开始

运行前请先完全退出 Cursor。

```bash
git clone https://github.com/ztx888/cursor-zh-localizer.git
cd cursor-zh-localizer
node patch-cursor-zh.js
```

也可以用 npm 脚本：

```bash
npm run patch
```

如果希望写入前保留备份：

```bash
npm run patch:backup
```

## 一行安装

已经了解脚本内容、只是想快速重打补丁时，可以使用：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ztx888/cursor-zh-localizer/main/install.sh)"
```

更推荐第一次使用时采用 `git clone`，先看清楚脚本做了什么，再运行。

## 更新 Cursor 后怎么办

Cursor 更新或重装会覆盖安装包里的文件，所以补丁会消失。处理方式很简单：

```bash
cd cursor-zh-localizer
git pull
node patch-cursor-zh.js
```

如果换电脑或重装系统，重新安装官方 Cursor 后，再克隆本仓库运行一次即可。

## 命令参数

```bash
node patch-cursor-zh.js --help
```

常用参数：

| 参数 | 用途 |
| --- | --- |
| `--backup` | 写入前生成备份 |
| `--app /Applications/Cursor.app` | 指定 Cursor.app 路径 |
| `--app-root <path>` | 指定 Cursor 资源目录 |
| `--no-user-storage` | 跳过用户配置数据库中的模式名称修正 |
| `--version` | 显示补丁版本 |

## 设计原则

- **不分发 Cursor 官方文件**：仓库只包含补丁脚本和说明，不包含修改后的安装包。
- **尽量贴近真实语义**：不是机械直译，而是按 Cursor 的实际操作场景翻译。
- **可重复运行**：补丁脚本可以在更新后再次运行。
- **保留必要英文**：例如部分模型档位、固定工具名和特定调试词不会强行翻译。
- **尽量小范围修改**：只处理本机 Cursor 的界面资源、扩展描述和少量用户界面配置。

## 兼容性

当前主要面向：

- macOS
- Cursor 安装在 `/Applications/Cursor.app`
- Node.js 18 或更高版本

其他安装路径可以用：

```bash
node patch-cursor-zh.js --app "/path/to/Cursor.app"
```

## 常见问题

### 这是官方语言包吗？

不是。这是非官方增强补丁，用来补官方中文语言包覆盖不到的 Cursor 自研界面。

### 能做成插件吗？

普通插件通常改不了 Cursor 自己的设置页、Agent 面板和内部菜单。这个项目采用补丁脚本，是因为这些文案在 Cursor 安装包的前端资源里。

### 会影响账号、聊天记录或项目代码吗？

脚本不会修改你的项目代码，也不修改账号信息。它主要修改 Cursor 应用资源，并会对 Cursor 的用户界面配置做少量中文化修正。

### 打完补丁后 Cursor 提示损坏怎么办？

先确认 Cursor 完全退出，再重新运行补丁。macOS 如果因为下载隔离标记导致异常，可以先查看本仓库 issue，或提交你的系统版本、Cursor 版本和报错截图。

### Cursor 更新后汉化没了？

这是正常现象。更新会覆盖安装包资源，重新运行补丁即可。

## 贡献

欢迎提交漏翻截图、具体英文原文和 Cursor 版本。越具体，越容易准确补齐。

推荐 issue 格式：

```text
Cursor 版本：
系统版本：
英文原文：
出现位置：
截图：
建议翻译：
```

## 免责声明

本项目是非官方社区补丁，与 Cursor 官方无关。使用前请自行确认脚本内容。补丁会修改本机已安装的 Cursor 应用资源，Cursor 更新后可能需要重新适配。

## License

[MIT](LICENSE)
