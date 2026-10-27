# Open Playbook Studio

**开源美式橄榄球战术板编辑器** — 模仿 Tackle Football Playmaker X 的独立实现。

中文界面 · 纯前端单文件 · 双击即可运行 · 无需联网 · 无需安装依赖。

---

## 一分钟上手

```
双击 index.html
```

就这些。浏览器打开后立刻可以画战术。

Windows 用户也可以双击 `run.bat`（会以正确编码启动默认浏览器）。

## 功能

| 模块 | 说明 |
|---|---|
| **球场** | 完整 100 码场、端区、码线、哈希标记、开球线(LOS)、首攻线 |
| **人制** | **11 人制 / 8 人制 / 5 人制（腰旗）** 一键切换 |
| **进攻阵型** | I Formation、Shotgun Trips、Pro Set、Goal Line、T Formation、Single Wing、Trips、Bunch 等 |
| **防守阵型** | 4-3、3-4、Nickel、Goal Line D、3-2-2、4-2-1、Man Press、Zone 2-1-2 |
| **绘图** | 跑动路线（虚线箭头）、传球路线（实线+接球点）、阻挡（点线） |
| **编辑** | 拖动球员、双击删除、左右镜像、撤销/重做（60 步） |
| **输出** | **导出 SVG**（矢量，可打印）、**导出 PNG**（2000×1120）、JSON 备份 |
| **信息** | 战术名称、阵型口令、教练笔记，随导出一起输出 |

## 快捷键

| 键 | 作用 |
|---|---|
| `V` | 选择 / 移动球员 |
| `R` | 画跑动路线 |
| `P` | 画传球路线 |
| `B` | 画阻挡 |
| `X` | 删除工具 |
| `Ctrl+Z` | 撤销 |
| `Ctrl+Y` / `Ctrl+Shift+Z` | 重做 |
| `Esc` | 取消当前绘制 / 取消选中 |

**画路线的操作**：选中路线工具 → 点击球员作为起点 → 沿途点击添加折点 → **双击**完成。

## 打印腕带卡

1. 画好战术 → 点「导出 SVG」
2. 用浏览器打开 SVG，或导入 Word / Google Docs
3. 排成 3×3 九宫格，按腕带卡尺寸打印

建议打印尺寸：每格 **62 × 44 mm**（对应常见腕带卡槽）。SVG 是矢量，缩放不糊。

## 项目结构

```
open-playbook-studio/
├── index.html      # 全部程序（HTML + CSS + JS 单文件）
├── run.bat         # Windows 一键启动
├── README.md
└── LICENSE         # MIT
```

没有构建步骤，没有 `node_modules`，没有依赖。`index.html` 就是整个产品。

## 技术说明

- **画布**：SVG（矢量，导出天然清晰）
- **渲染**：原生 DOM + `createElementNS`，无框架
- **交互**：Pointer Events（鼠标/触屏/笔统一处理）
- **状态**：JSON 快照撤销栈，60 步
- **存储**：localStorage + JSON 文件导出
- **兼容**：现代浏览器（Chrome / Edge / Safari / Firefox），手机与 iPad 可用

## 与 Playmaker X 的关系

本项目是**独立实现**的开源替代品，代码全部从零编写，**不包含 Tackle Football Playmaker X 的任何源码、图片或专有数据**。

Playmaker X 是商业产品名，其权利归原厂商所有。本项目仅为战术板需求提供一个免费、开源、可自托管的选择。

## 范围与限制

- 路线播放动画尚未实现（当前为静态战术图）
- 不含球员名单管理、赛季归档、多人协作（可自行扩展）
- 腕带打印尺寸需按你的设备校准一次
- 阵型模板可直接在 `index.html` 的 `FORMATIONS` 对象里增删改

## 如何自定义阵型

打开 `index.html`，搜索 `const FORMATIONS`，按格式添加即可：

```js
{
  name: "My Formation",
  note: "说明文字",
  pts: [[.30,.50], [.30,.40], ...],   // 相对坐标 0-1
  nums: ["QB","RB","WR", ...]          // 位置标签
}
```

改完刷新浏览器立即生效。

## License

[MIT](LICENSE) — 可自由使用、修改、商用、分发，保留版权署名即可。

## 致谢

灵感来自对战术板工具的共同需求。感谢开源社区。
