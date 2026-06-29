# Arzopa Skills Core Plan

## Goal
整理一个 Arzopa 工作人员专属核心技能包，放在 `arzopa-skills-core`，并上传到 GitHub。

## Success Criteria
- 核心技能目录已复制到 `arzopa-skills-core/skills/`。
- 顶层 README、技能清单、安装说明清楚说明适用人群与使用方式。
- 本地目录可以作为独立 Git 仓库发布。
- GitHub 仓库创建或推送完成；若认证阻塞，记录具体原因和下一步。

## Phases

| Phase | Status | Notes |
| --- | --- | --- |
| 1. Inspect | complete | 已确认目标目录为空，GitHub CLI 存在但 `GH_TOKEN` 无效。 |
| 2. Package | complete | 已复制核心技能并补 README、AGENTS、manifest。 |
| 3. Verify | complete | 16 个入口、约 35 MB、敏感词命中为示例/安全说明。 |
| 4. Publish | in_progress | 初始化 Git 仓库并上传 GitHub。 |

## Core Skill Set
- `planning-with-files`
- `karpathy-guidelines`
- `find-docs`
- `exa-search`
- `opencli/smart-search` -> `smart-search`
- `agent-browser`
- `huashu-design`
- `minimax-docx`
- `minimax-pdf`
- `minimax-xlsx`
- `pptx-generator`
- `better-icons`
- `domain-modeling`
- `xquik-twitter`
- `opencli/opencli-browser` -> `opencli-browser`
- `opencli/opencli-browser-sitemap` -> `opencli-browser-sitemap`

## Errors Encountered
| Error | Attempt | Resolution |
| --- | --- | --- |
| `GH_TOKEN` invalid | `gh auth status` | 先整理本地包；上传阶段尝试 SSH 或提示重新登录。 |
