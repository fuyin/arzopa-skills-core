# Arzopa Skills Core Findings

## 2026-06-29
- `arzopa-skills-core` 目录为空，可以直接作为新包根目录。
- 当前 OK Skills 包含大量工程专用技能；Arzopa 核心包应围绕产品事实核验、市场/渠道研究、内容视觉生产、Office 交付、浏览器自动化。
- SkillHub/GitHub 上传不应依赖完整 `ok-skills` 历史；核心包应是独立 Git 仓库。
- `opencli` 里的核心技能是嵌套目录，为了普通技能加载器更容易识别，核心包中采用扁平化目录名：`smart-search`、`opencli-browser`、`opencli-browser-sitemap`。
- GitHub CLI 存在，但 `GH_TOKEN` 无效，上传可能需要 SSH remote 或重新登录。
- 验证结果：`skills/` 下有 16 个 `SKILL.md` 入口；包体约 35 MB；敏感词扫描命中均为示例、占位符或安全说明，没有发现真实凭证。
