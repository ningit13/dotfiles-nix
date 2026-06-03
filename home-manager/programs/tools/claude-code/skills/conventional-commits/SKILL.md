---
name: conventional-commits
description: 'Analyze git changes and create well-structured commits following Conventional Commits specification. Use when: committing code changes, writing commit messages in English, deciding whether to split a large diff into multiple logical commits, choosing the right commit type (feat/fix/chore/refactor/docs/test/style/perf/ci/build).'
argument-hint: 'Optional: describe the change or list specific files to commit'
---

# Conventional Commits Workflow

## When to Use
- Committing any code change (staged or unstaged)
- Writing commit messages in English following a consistent convention
- Deciding whether to split a large diff into multiple logical commits

## Procedure

### 1. Inspect Changes

```bash
git status
git diff
git diff --staged
```

Review both unstaged and staged changes to understand the full scope.

### 2. Analyze and Group Changes

Identify logical units of change. Each commit should represent one coherent intent that can be independently reviewed and reverted.

**Split commits when changes include:**
- Different functional areas (e.g., authentication + UI + infrastructure)
- Mixed commit types within one diff (e.g., a new feature alongside a bug fix)
- Unrelated files that happened to be edited together
- Changes that serve different reviewers or release notes

**Keep as one commit when:**
- Changes are coupled and meaningless alone
- A single feature touches multiple files as a natural unit

### 3. Write Commit Messages

Format ([Conventional Commits v1.0.0](https://www.conventionalcommits.org/)):

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

**Type reference:**

| Type | Use for |
|------|---------|
| `feat` | New feature visible to users |
| `fix` | Bug fix |
| `refactor` | Code restructuring, no behavior change |
| `docs` | Documentation only |
| `test` | Adding or correcting tests |
| `chore` | Build, deps, tooling, config, maintenance |
| `style` | Formatting, whitespace (no logic change) |
| `perf` | Performance improvement |
| `ci` | CI/CD pipeline changes |
| `build` | Build system or external dependency changes |

**Rules:**
- **Language**: English only
- **Description**: imperative mood, lowercase, no trailing period, ≤72 characters
- **Scope**: optional lowercase noun identifying the module or area (e.g., `auth`, `api`, `nixvim`)
- **Breaking change**: append `!` after type/scope (`feat!:`) or add `BREAKING CHANGE:` in the footer
- **Body**: use to explain *why*, not *what* — wrap at 72 characters

### 4. Stage and Commit Each Group

> **No confirmation needed**: Proceed with `git add` and `git commit` autonomously — do not ask the user for permission before committing.
> **Never push**: Do not run `git push` or any variant. Pushing is outside the scope of this skill.

For each logical group of files:

```bash
git add <files>
git commit -m "<type>(<scope>): <description>"
```

Multi-line commit (body):

```bash
git commit -m "<type>(<scope>): <description>" \
           -m "<body paragraph>"
```

### 5. Verify

```bash
git log --oneline -10
```

Confirm the history reads as a clean, reviewable sequence.

## Examples

```
feat(auth): add OAuth2 login support
fix(api): handle null response from upstream service
refactor(db): extract query builder into separate module
docs: update README with installation steps
chore(deps): update nixpkgs flake inputs
test(auth): add unit tests for token validation
feat!: drop support for legacy config format

BREAKING CHANGE: old config files must be migrated using `migrate-config`
```
