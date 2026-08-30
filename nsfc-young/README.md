# 青年科学基金项目（C类，2026）LaTeX 模板

该目录是一套完整、独立、可单独复制的青年科学基金项目正文模板，不依赖 Git submodule、符号链接、上级目录文件或另一个模板。

## 目录

```text
nsfc-young/
├── main.tex
├── nsfc.cls
├── references.bib
├── README.md
├── sections/
├── figures/
├── fonts/
├── scripts/
└── preview/
```

`main.tex` 只负责文档配置和装配；申请书正文按基金委提纲拆分在 `sections/`。图片统一放入 `figures/`，参考文献统一写入 `references.bib`。

## 固定字体与版式

模板保持基金委版式所用的宋体、楷体、仿宋和 Arial，以及青年项目 A4 页面左右边距 3.2 cm。模板不使用仓库其他文档的 XCharter 字体与彩色标题体系，也不设置替代中文字体。

本模板自己的 `fonts/` 目录已包含并固定以下字体文件：

```text
Arial-Regular.ttf
Arial-Bold.ttf
Arial-Italic.ttf
Arial-BoldItalic.ttf
SimSun.ttf
KaiTi.ttf
FangSong.ttf
```

构建脚本只校验这些模板内字体，不搜索系统字体，也不进行字体替换。

## 编译

macOS / Linux：

```bash
./scripts/build.sh
```

Windows：

```powershell
./scripts/build.ps1
```

BibTeX 仅在文档实际产生 `\citation` 时运行，避免无引用示例因 BibTeX 返回码中止构建。

## 预览

CI 直接使用本目录内字体编译 `nsfc-young/main.tex`，检查生成 PDF 后，从第 1、2 页生成 150-DPI PNG。

| 首页 | 正文页 |
| --- | --- |
| ![2026 青年科学基金项目首页](preview/application.png) | ![2026 青年科学基金项目正文页](preview/content.png) |

## 来源

2026 年青年科学基金项目（C类）提纲、字体和页面几何参数参考 `andy123t/nsfc-latex`，固定参考提交为 `11a02726f6190fcb89859dfaed18e3d1d68af0b8`，对应上游入口 `main-YF.tex`。通用 NSFC 排版与写作组织同时参考 `MCG-NKU/NSFC-LaTex`，固定参考提交为 `3f69bc50dc6d44ef8330a21e585e043addb5cf8d`。

## 约束

- XeLaTeX 编译。
- 字体由本模板 `fonts/` 独立提供。
- 不允许以 Fandol、Noto、LXGW 或其他字体替换宋体、楷体、仿宋或 Arial。
- 预览图必须由当前源码生成的 PDF 直接以 150 DPI 渲染，不裁剪、不缩放、不锐化。
