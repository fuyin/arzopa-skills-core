# Arzopa Skills Core Progress

## 2026-07-02 SkillHub 安装器全局化
- 已将 `skillhub-dist/scripts/install.ps1` 默认目标改为 Codex 全局目录：`$CODEX_HOME` 或 `~/.codex`。
- 已将 17 个核心技能安装目标改为 Codex 全局 `skills` 目录，并新增仓库根 `AGENTS.md` 到 Codex 全局 `AGENTS.md` 的安装逻辑。
- 已给已有全局 `AGENTS.md` 增加带时间戳的备份逻辑，避免静默覆盖。
- 已同步更新 `README.md`、`skillhub-dist/README.md`、`skillhub-dist/SKILL.md` 中的安装说明。
- PowerShell 脚本语法校验通过；Bash 校验因本机 `bash.exe` 登录会话不可用未执行。
- 已提交并推送 GitHub：`4d81909 fix: install core skills into codex global`。
- 已发布 SkillHub 新版本：`arzopa/arzopa-skills-core@20260702.024306`，详情页 `https://skillhub.arzopa.com/space/arzopa/arzopa-skills-core`。
- SkillHub resolve API 已确认最新版本可解析，versionId 为 `49`，并已通过临时目录安装验证新版 `SKILL.md` 与 `skill-pack.json` 内容。
- 已确认 SkillHub CLI 安装流程只执行 resolve、download、extractZip，不支持包内 post-install hook；发布页提供一条 PowerShell 命令，在入口包下载成功后立即触发 `scripts/install.ps1`。
- 根据用户指定，SkillHub 描述写入入口安装命令：`npx @astron-team/skillhub@latest install arzopa-skills-core --namespace arzopa --registry https://skillhub.arzopa.com`。

## 2026-06-29 AGENTS.md 更新
- 已根据用户反馈，不做整段替换；从用户提供内容中提取对 agent 有用的原则，并与原有 Arzopa 定位、事实校验、编辑安全规则重新整合。
- 默认技能规则保留为 `planning-with-files` 与 `karpathy-guidelines`。
- 保持修改范围集中，未改动技能包源码与发布配置。
- 根据“多数员工不写代码”的反馈，已将重工程化的代码规范简化为面向员工场景的脚本与自动化规则。
- GitHub 仓库经插件确认已为 `public`：`https://github.com/fuyin/arzopa-skills-core`。
- 已发布 SkillHub 包：`arzopa/arzopa-skills-core@20260629.075912`，详情页 `https://skillhub.arzopa.com/space/arzopa/arzopa-skills-core`。
- SkillHub resolve API 已确认最新版本可解析，版本 ID 为 `42`。
- 已将仓库 README、SkillHub README、SkillHub `SKILL.md` 和两个 `skill-pack.json` 的描述改为中文；README 概览中补充了 16 个技能的作用说明。
- 已提交并推送中文文档更新：`888c8ed docs: localize skillhub package docs`；已发布 SkillHub 新版本 `arzopa/arzopa-skills-core@20260629.080929`，resolve API 确认为 versionId `43`。
- 已将 `find-skills` 整合进核心包，核心技能数从 16 个增至 17 个；已更新 README、SkillHub README、SkillHub `SKILL.md`、两个 `skill-pack.json`。

## 2026-06-29
- 已创建计划文件。
- 已复制 16 个核心技能目录到 `skills/`。
- 已补充 `README.md`、`AGENTS.md`、`skill-pack.json`。
- 已补充 `.gitignore` 和 Apache-2.0 `LICENSE`。
- 已完成结构和敏感词验证。
- 已初始化独立 Git 仓库，首个提交为 `850bf1b chore: create arzopa core skills pack`。
- 已将分支改为 `main`。
- GitHub 上传阻塞：`GH_TOKEN` 无效，`gh` 未登录；网页设备授权等待超时后已中止。SSH 也因本机配置/连接问题不可用。
- 用户已开启 GitHub 插件；插件身份为 `fuyin`，安装范围只有个人账号，没有组织。
- 插件可操作已有仓库，但当前暴露工具没有创建新仓库能力，且未找到 `fuyin/arzopa-skills-core` 或 `arzopa/arzopa-skills-core` 现成仓库。
- 下一步：用户在 GitHub 上创建空仓库 `fuyin/arzopa-skills-core`，或完成 `gh auth login` 后再由 CLI 创建并推送。
- 已创建 `skillhub-dist/` 轻量安装器，准备发布到 SkillHub。
