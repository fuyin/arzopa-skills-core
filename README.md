# Arzopa Skills Core

Arzopa 工作人员专属 AI Agent 核心技能包。

这个仓库面向 Arzopa 日常流程：产品事实核验、市场与渠道研究、竞品监控、内容与视觉生产、Office/PDF 交付、网页自动化和复杂任务规划。

## 概览

核心技能放在 `skills/` 下，共 16 个：

| 技能 | 作用 |
| --- | --- |
| `planning-with-files` | 用文件保存计划、发现和进度，适合复杂任务、长期调研、跨轮对话工作。 |
| `karpathy-guidelines` | 约束 agent 少假设、少过度设计、少乱改，适合编码、审查和流程变更。 |
| `find-docs` | 查询最新技术文档、SDK、CLI、平台 API，避免依赖过期记忆。 |
| `exa-search` | 做当前网页、公司、人物、竞品、市场和资料研究。 |
| `smart-search` | 按任务自动选择搜索来源，适合指定网站、购物、社交、技术资料等搜索。 |
| `agent-browser` | 浏览器自动化，用于打开网页、截图、填写表单、抓取页面、测试网页流程。 |
| `huashu-design` | 用 HTML 交付高保真原型、视觉稿、广告演示、幻灯片、动效和设计评审。 |
| `minimax-docx` | 创建、编辑和格式化 Word 文档，适合报告、合同、提案、客服/法务文档。 |
| `minimax-pdf` | 创建、填写和重排 PDF，适合对外报告、品牌化资料、产品说明和表单。 |
| `minimax-xlsx` | 读取、创建、编辑和校验表格，适合 SKU 表、价格表、竞品表、渠道表。 |
| `pptx-generator` | 生成和编辑 PowerPoint，适合汇报、销售提案、渠道方案、产品演示。 |
| `better-icons` | 搜索和获取 SVG 图标，辅助页面、PPT、原型和视觉设计。 |
| `domain-modeling` | 沉淀 Arzopa 产品、渠道、客服、法务等领域术语和决策记录。 |
| `xquik-twitter` | 使用 Xquik 处理 X/Twitter 搜索、账号查询、KOL/竞品监控和受控发布流程。 |
| `opencli-browser` | 通过 OpenCLI 操作真实浏览器和登录态页面，适合后台、平台和复杂站点任务。 |
| `opencli-browser-sitemap` | 使用站点地图指导复杂网页流程，减少盲点点击和错误路径。 |

## 适用对象

- 产品、市场、渠道增长、客服、法务/运营、内容团队。
- 需要处理 Arzopa portable monitors、digital photo frames、smart display solutions 相关任务的 AI agent。
- 需要稳定复用技能，而不是每次临时写 prompt 的团队。

## 核心原则

- 内部资料优先，其次是官网政策页/产品页、官方 LinkedIn、电商平台、新闻/评测、第三方数据库。
- 价格、库存、促销、保修年限、物流时效、员工数、成立年份都不是长期稳定事实，执行前必须复核。
- 产品规格、渠道状态、售后政策和法律主体信息必须区分“已核实事实”“官网表述”“第三方资料”“待内部核验”。
- 默认把 Arzopa 视为 DTC + marketplace + affiliate + distributor 混合渠道品牌。

## 通过 SkillHub 安装

SkillHub 发布包在 `skillhub-dist/`。它是轻量安装器，不直接内嵌全部 16 个技能。

```powershell
skillhub install arzopa-skills-core --namespace arzopa --dir C:\Users\Administrator\.agents\skills --force
cd C:\Users\Administrator\.agents\skills\arzopa-skills-core
.\scripts\install.ps1
```

脚本会从 GitHub 拉取本仓库，并把 `skills/` 下的 16 个技能安装到父级技能目录。已有技能默认跳过；需要覆盖时加 `-Overwrite`。

## 通过 GitHub 安装

也可以直接克隆仓库：

```powershell
cd C:\Users\Administrator\.agents\skills
git clone https://github.com/fuyin/arzopa-skills-core.git arzopa-skills-core
```

如果你的 agent 只扫描一层技能目录，可以把 `skills/` 下的目录复制到实际扫描目录：

```powershell
Copy-Item -Path .\arzopa-skills-core\skills\* -Destination C:\Users\Administrator\.agents\skills -Recurse
```

## 推荐默认启用

在公司级 `AGENTS.md` 或项目指令中默认启用：

```md
默认使用 planning-with-files、karpathy-guidelines。
涉及当前网页/市场/渠道/产品事实时，必须查阅最新资料或源码。
涉及 Arzopa 对外信息时，必须区分已核实事实、官网表述、第三方资料、待内部核验。
```

## 维护规则

- 新增技能前先判断它是否服务 Arzopa 高频流程。
- 不把极窄工程迁移类技能放进 core 包。
- 不在 core 包里保存密钥、cookie、客户隐私数据或内部敏感资料。
- 大文件和素材类能力只保留必要资产；能通过脚本或外部来源拉取的内容，不重复塞入 core。
