---
name: arzopa-skills-core
description: Arzopa 工作人员专属核心技能包安装器。通过 SkillHub 安装后，运行脚本即可从 GitHub 拉取完整技能包，并把 17 个核心技能安装到本地 agent 技能目录。
---

# Arzopa Skills Core 安装器

这是 Arzopa 工作人员专属核心技能包的 SkillHub 入口。

SkillHub 只安装一个轻量入口技能。安装后运行随包脚本，脚本会从 GitHub 拉取完整 `arzopa-skills-core` 仓库，并把 17 个核心技能安装到本地 agent 技能目录。

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
