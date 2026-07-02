# Arzopa Skills Core Plan

## 2026-07-02 Goal
更新 SkillHub 轻量安装器，使一次运行脚本即可把技能组安装到 Codex 全局，并把技能仓库 `AGENTS.md` 安装到 Codex 全局 `AGENTS.md`。

## 2026-07-02 Status
- Inspect: complete，已确认旧脚本默认写入 SkillHub 包父级目录，未处理 `AGENTS.md`。
- Implement: complete，已改为默认写入 `$CODEX_HOME` 或 `~/.codex`。
- Verify: partial，PowerShell 语法通过；Bash 因本机 `bash.exe` 登录会话不可用未执行。
- Improve trigger: complete，将 SkillHub 发布页安装命令改为一条 PowerShell 命令，下载入口包后立即执行完整安装器；描述中使用用户指定的 `npx @astron-team/skillhub@latest ... --registry https://skillhub.arzopa.com` 命令。

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
| 4. Publish | blocked | 本地 Git 仓库已初始化并提交；GitHub 上传需要有效登录。 |

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
| GitHub CLI not logged in | `gh auth status` after clearing `GH_TOKEN` | 启动 `gh auth login --web`，但设备授权未完成，已中止等待。 |
| SSH unavailable | `ssh -T git@github.com` | `~/.ssh/config` 权限阻塞；`ssh -F none` 连接被关闭。 |
| GitHub plugin cannot create repo | GitHub plugin discovery | 插件身份为 `fuyin`，安装范围只有个人账号；当前工具只有已有仓库读写，没有新建仓库能力。 |
