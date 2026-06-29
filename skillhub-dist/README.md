# Arzopa Skills Core SkillHub 安装包

这是 `arzopa-skills-core` 的 SkillHub 发布包。

## 作用

这个包不是完整技能合集本体，而是一个轻量安装器。它解决 SkillHub 单包文件数限制问题：先通过 SkillHub 安装入口技能，再由脚本从 GitHub 拉取完整仓库，并把 16 个核心技能安装到本地技能目录。

## 安装命令

```powershell
skillhub install arzopa-skills-core --namespace arzopa --dir C:\Users\Administrator\.agents\skills --force
```

安装后目录为：

```text
C:\Users\Administrator\.agents\skills\arzopa-skills-core
```

然后运行：

```powershell
cd C:\Users\Administrator\.agents\skills\arzopa-skills-core
.\scripts\install.ps1
```

## 技能概览

| 技能 | 作用 |
| --- | --- |
| `planning-with-files` | 复杂任务、长期任务、调研任务的文件化计划与进度记录。 |
| `karpathy-guidelines` | 降低 agent 过度设计、乱改代码、隐藏假设的风险。 |
| `find-docs` | 查询最新技术文档、SDK、CLI、平台 API。 |
| `exa-search` | 做当前网页、公司、竞品、市场与资料调研。 |
| `smart-search` | 针对具体网站/平台做智能搜索路由。 |
| `agent-browser` | 官网、电商平台、后台页面、竞品页面的浏览器自动化。 |
| `huashu-design` | HTML 原型、视觉素材、广告演示、幻灯片和动效。 |
| `minimax-docx` | Word 报告、合同、提案、客服/法务文档。 |
| `minimax-pdf` | 对外 PDF、品牌化报告、产品资料和表单。 |
| `minimax-xlsx` | SKU 表、价格表、竞品表、渠道表、运营数据表。 |
| `pptx-generator` | 汇报、销售提案、渠道方案、产品演示文稿。 |
| `better-icons` | 图标搜索与 SVG 获取。 |
| `domain-modeling` | 梳理 Arzopa 产品、渠道、客服、法务等领域术语。 |
| `xquik-twitter` | X/Twitter 舆情、KOL、竞品监控和受控发布流程。 |
| `opencli-browser` | 通过 OpenCLI 操作真实浏览器和登录态页面。 |
| `opencli-browser-sitemap` | 使用站点地图指导复杂网页流程。 |

## 注意

- 已有技能目录默认跳过。
- PowerShell 加 `-Overwrite` 可覆盖已有技能。
- Bash 加 `--overwrite` 可覆盖已有技能。
- 安装脚本不会删除已有技能目录。
