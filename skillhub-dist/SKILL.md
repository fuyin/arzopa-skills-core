---
name: arzopa-skills-core
description: Arzopa 核心技能包安装器。入口安装命令：npx @astron-team/skillhub@latest install arzopa-skills-core --namespace arzopa --registry https://skillhub.arzopa.com。安装入口后运行脚本可把 17 个核心技能和 AGENTS.md 安装到 Codex 全局目录。
---

# Arzopa Skills Core 安装器

这是 Arzopa 工作人员专属核心技能包的 SkillHub 入口。

SkillHub 只安装一个轻量入口技能。推荐复制下面这一条 PowerShell 命令：先下载入口安装器，下载成功后立即运行随包脚本。脚本会从 GitHub 拉取完整 `arzopa-skills-core` 仓库，把 17 个核心技能安装到 Codex 全局 `skills` 目录，并把仓库根目录 `AGENTS.md` 安装到 Codex 全局 `AGENTS.md`。

PowerShell 推荐：

```powershell
$dir = Join-Path $env:USERPROFILE ".agents\skills"; npx @astron-team/skillhub@latest install arzopa-skills-core --namespace arzopa --registry https://skillhub.arzopa.com --dir $dir --force; if ($LASTEXITCODE -eq 0) { & (Join-Path $dir "arzopa-skills-core\scripts\install.ps1") }
```

PowerShell 分步：

```powershell
npx @astron-team/skillhub@latest install arzopa-skills-core --namespace arzopa --registry https://skillhub.arzopa.com
```

如果要分步运行完整安装，建议显式指定入口安装目录：

```powershell
npx @astron-team/skillhub@latest install arzopa-skills-core --namespace arzopa --registry https://skillhub.arzopa.com --dir C:\Users\Administrator\.agents\skills --force
cd C:\Users\Administrator\.agents\skills\arzopa-skills-core
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

说明：当前 SkillHub CLI 只下载并解压包，不支持下载后自动执行包内脚本；自动触发由上面的外层一条命令完成。
