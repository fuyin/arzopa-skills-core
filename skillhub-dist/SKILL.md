---
name: arzopa-skills-core
description: Arzopa 工作人员专属核心技能包安装器。通过 SkillHub 安装后，运行脚本即可从 GitHub 拉取完整技能包，并把 17 个核心技能和仓库 AGENTS.md 安装到 Codex 全局目录。
---

# Arzopa Skills Core 安装器

这是 Arzopa 工作人员专属核心技能包的 SkillHub 入口。

SkillHub 只安装一个轻量入口技能。安装后运行随包脚本，脚本会从 GitHub 拉取完整 `arzopa-skills-core` 仓库，把 17 个核心技能安装到 Codex 全局 `skills` 目录，并把仓库根目录 `AGENTS.md` 安装到 Codex 全局 `AGENTS.md`。

PowerShell:

```powershell
.\scripts\install.ps1
```

Bash:

```bash
bash scripts/install.sh
```

默认来源：

```text
https://github.com/fuyin/arzopa-skills-core.git
```

默认目标：

```text
$CODEX_HOME/skills 或 ~/.codex/skills
$CODEX_HOME/AGENTS.md 或 ~/.codex/AGENTS.md
```
