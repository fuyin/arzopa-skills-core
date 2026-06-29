# Arzopa Skills Core

Arzopa 工作人员专属 AI Agent 核心技能包。

这个包面向 Arzopa 的日常流程：产品事实核验、市场与渠道研究、竞品监控、内容与视觉生产、Office/PDF 交付、网页自动化和复杂任务规划。

## 适用对象

- 产品、市场、渠道增长、客服、法务/运营、内容团队。
- 需要处理 Arzopa portable monitors、digital photo frames、smart display solutions 相关任务的 AI agent。
- 需要稳定复用技能，而不是每次临时写 prompt 的团队。

## 核心原则

- 内部资料优先，其次是官网政策页/产品页、官方 LinkedIn、电商平台、新闻/评测、第三方数据库。
- 价格、库存、促销、保修年限、物流时效、员工数、成立年份都不是长期稳定事实，执行前必须复核。
- 产品规格、渠道状态、售后政策和法律主体信息必须区分“已核实事实”“官网表述”“第三方资料”“待内部核验”。
- 默认把 Arzopa 视为 DTC + marketplace + affiliate + distributor 混合渠道品牌。

## 技能目录

核心技能放在 `skills/` 下：

| 技能 | 用途 |
| --- | --- |
| `planning-with-files` | 复杂任务、长期任务、调研任务的文件化计划与进度记录。 |
| `karpathy-guidelines` | 降低 agent 过度设计、乱改代码、隐藏假设的风险。 |
| `find-docs` | 查询最新技术文档、SDK、平台 API。 |
| `exa-search` | 当前网页、公司、竞品、市场与资料调研。 |
| `smart-search` | 针对具体网站/平台做智能搜索路由。 |
| `agent-browser` | 官网、电商平台、后台页面、竞品页面的浏览器自动化。 |
| `huashu-design` | 高保真 HTML 原型、视觉素材、广告演示、幻灯片和动效。 |
| `minimax-docx` | Word 报告、合同、提案、客服/法务文档。 |
| `minimax-pdf` | 对外 PDF、品牌化报告、产品资料。 |
| `minimax-xlsx` | SKU 表、价格表、竞品表、渠道表、运营数据表。 |
| `pptx-generator` | 汇报、销售提案、渠道方案、产品演示文稿。 |
| `better-icons` | 图标搜索与 SVG 获取。 |
| `domain-modeling` | 梳理 Arzopa 产品、渠道、客服、法务等领域术语。 |
| `xquik-twitter` | X/Twitter 舆情、KOL、竞品监控和受控发布流程。 |
| `opencli-browser` | 通过 OpenCLI 操作真实浏览器和登录态页面。 |
| `opencli-browser-sitemap` | 使用站点地图指导复杂网页流程。 |

## 安装

把仓库克隆到本地技能目录：

```powershell
cd C:\Users\Administrator\.agents\skills
git clone https://github.com/arzopa/arzopa-skills-core.git arzopa-skills-core
```

如果你的 agent 只扫描一层技能目录，可以把 `skills/` 下的目录复制到实际扫描目录。

PowerShell 示例：

```powershell
Copy-Item -Path .\arzopa-skills-core\skills\* -Destination C:\Users\Administrator\.agents\skills -Recurse
```

## 通过 SkillHub 安装

SkillHub 发布包在 `skillhub-dist/`，它是轻量安装器，不直接内嵌全部 16 个技能。

```powershell
skillhub install arzopa-skills-core --namespace arzopa --dir C:\Users\Administrator\.agents\skills --force
cd C:\Users\Administrator\.agents\skills\arzopa-skills-core
.\scripts\install.ps1
```

脚本会从 GitHub 拉取本仓库，并把 `skills/` 下的 16 个技能安装到父级技能目录。GitHub 仓库必须是 public，或员工本机 Git 凭据有访问权限。已有技能默认跳过；需要覆盖时加 `-Overwrite`。

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
