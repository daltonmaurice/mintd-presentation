# Changes in mintd and mint-registry Since Presentation Creation

**Last Updated:** January 8, 2026
**Review Date:** Based on git history since November 2024

---

## 🔴 CRITICAL CHANGES - Must Update Presentation

### 1. Project Renamed: `mint` → `mintd`

**Status:** BREAKING CHANGE - Affects all commands and documentation

**What Changed:**
- The CLI tool has been renamed from `mint` to `mintd`
- All command invocations must use `mintd` instead of `mint`
- Package name changed from `mint` to `mintd`

**Impact on Presentation:**
- ❌ Session 2, Slide "Creating Your First Data Project" shows `mint create data --name medicare_claims`
- ✅ Should now be: `mintd create data --name medicare_claims`
- ❌ All code examples throughout sessions use `mint`
- ❌ Installation instructions show `pip install mint`
- ✅ Should now be: `pip install mintd` or install from source

**Files to Update:**
- `session2-usage.qmd`: All command examples (lines 45-46, 69-77, 91, 155, 207, 242, etc.)
- `session3-advanced.qmd`: All command examples (lines 85, 182, 207, 482)
- `README.md`: All references to mint CLI

---

### 2. Mandatory Language Selection

**Status:** NEW REQUIREMENT - Changes user workflow

**What Changed:**
- Language selection (`--lang`) is now **mandatory** for all project types
- Cannot create projects without specifying python, r, or stata
- Previously this may have been optional or had defaults

**Impact on Presentation:**
- ✅ Presentation already shows `--lang stata` in examples
- ⚠️ Should emphasize this is **required**, not optional
- Need to clarify error message if language is omitted

**Files to Update:**
- `session2-usage.qmd`: Line 70-78 - Add note that `--lang` is required
- `session1-concepts.qmd`: Line 355 - Emphasize language requirement

---

### 3. Tokenless GitOps Architecture

**Status:** MAJOR FEATURE - Simplifies user experience significantly

**What Changed:**
- Registration workflow now uses **SSH keys only** - no GitHub personal access tokens needed
- GitOps-based workflow: CLI creates PRs via git operations
- GitHub Actions workflows handle repository creation using built-in `GITHUB_TOKEN`
- Users only need SSH access to registry repository

**Benefits:**
- ✅ No token management hassle
- ✅ Better security (repository-scoped permissions)
- ✅ Easier onboarding
- ✅ Automatic PR-based review process

**Impact on Presentation:**
- ❌ Session 2, Slide "Prerequisites" mentions setup but doesn't emphasize SSH keys
- ⚠️ Should add slide explaining tokenless architecture benefits
- ✅ Session 1 mentions automation but doesn't explain GitOps approach
- 📝 Could add architectural diagram showing SSH → Git → PR → GitHub Actions flow

**Files to Update:**
- `session1-concepts.qmd`: Add slide about tokenless GitOps (after line 105)
- `session2-usage.qmd`: Update prerequisites section (around line 48) to emphasize SSH key setup
- `session2-usage.qmd`: Update registration section (around line 449) to explain the PR workflow

---

### 4. Enclave Workflow - Fully Implemented

**Status:** PRODUCTION READY - Major feature now available

**What Changed:**
- Enclave functionality is **no longer planned** - it's **implemented and working**
- Complete workflow for air-gapped environments (FISMA, HIPAA, secure enclaves)
- New commands available:
  - `mintd create enclave --name <name>` - Create enclave workspace
  - `mintd enclave add <dataset>` - Add dataset to approved manifest
  - `mintd enclave pull <dataset>` - Download data (on networked machine)
  - `mintd enclave package --name <transfer>` - Package for physical transfer
  - `mintd enclave verify <transfer>` - Verify integrity in enclave
  - `mintd enclave unpack <transfer>` - Unpack verified data
  - `mintd enclave clean` - Clean up old versions
  - `mintd enclave list` - List approved/transferred data

**Enclave Features:**
- Versioned data storage with hierarchical organization
- Cryptographic verification (checksums)
- Manifest tracking for compliance
- Audit trail for all transfers
- Support for archived (tarball) and unpacked transfers
- Automatic cleanup of old versions

**Impact on Presentation:**
- ❌ Session 1, Slide "Benefit 6: Enclave Support" (line 285) says "planned implementation"
- ✅ Should say "fully implemented and production ready"
- ❌ Session 3 entire enclave section (lines 138-298) treats this as "coming soon"
- ✅ Should update to show actual working commands
- ⚠️ Need to add demo of enclave workflow in Session 3
- 📝 Could add screenshots of enclave workspace structure

**Files to Update:**
- `session1-concepts.qmd`: Line 285-298 - Update from "planned" to "implemented"
- `session3-advanced.qmd`: Lines 138-298 - Update all enclave slides with actual commands
- `session3-advanced.qmd`: Add slide showing `mintd enclave --help` output
- `session2-usage.qmd`: Consider adding basic enclave mention

---

### 5. New Data Management Commands

**Status:** NEW FEATURE - Enhanced data workflow

**What Changed:**
- New `mintd data` command group for managing data products:
  - `mintd data import` - Import data into project structure
  - `mintd data add` - Track data with DVC
  - Supports granular data directory structure (raw, interim, processed)
- Integrated with DVC remote configuration
- Can specify endpoint for S3-compatible storage (Wasabi, MinIO, etc.)

**Impact on Presentation:**
- ⚠️ Presentation shows manual workflow (ingest.do → clean.do → validate.do)
- ✅ This is still valid, but could mention `mintd data import` helper
- 📝 Could add advanced section showing data import automation

**Files to Update:**
- `session2-usage.qmd`: Lines 191-313 - Add note about `mintd data import` as alternative
- `session3-advanced.qmd`: Consider adding slide on data import commands

---

### 6. Configuration Enhancements

**Status:** IMPROVED UX - Better setup experience

**What Changed:**
- `mintd config setup` now prompts for and saves registry URL to config
- DVC remote endpoint configuration stored in project metadata
- Enhanced remote setup for data downloads
- Global config file at `~/.mintd/config.yaml` (note: mintd, not mint!)

**Configuration Options:**
- Registry URL (can be saved globally)
- S3 credentials (AWS, Wasabi, MinIO)
- DVC remote settings (bucket, endpoint, region)
- Default metadata (name, organization)

**Impact on Presentation:**
- ⚠️ Session 2, Line 46 shows `mint config setup` - needs update to `mintd`
- ✅ Presentation mentions setup wizard, which is still accurate
- 📝 Could add slide showing config file structure

**Files to Update:**
- `session2-usage.qmd`: Line 46 - Change `mint` to `mintd`
- `session2-usage.qmd`: Lines 595-599 - Update troubleshooting for mintd config

---

### 7. Wasabi S3 Permission Synchronization

**Status:** NEW FEATURE - Enterprise storage integration

**What Changed:**
- Automatic synchronization of GitHub team permissions to Wasabi IAM
- 1:1 naming convention: GitHub teams/users ↔ Wasabi IAM groups/users
- Permission sync workflow integrated with registry
- Supports S3-compatible storage providers (AWS, Wasabi, MinIO)

**Identity Mapping:**
- GitHub Teams → Wasabi IAM Groups (must match exactly)
- GitHub Users → Wasabi IAM Users (must match exactly)
- Users must be created manually in Wasabi
- System automatically assigns users to groups based on GitHub team membership

**Impact on Presentation:**
- ✅ Presentation mentions S3 storage but not Wasabi specifically
- ⚠️ Session 3 access control section (lines 305-425) doesn't mention Wasabi sync
- 📝 Could add advanced topic on storage provider integration

**Files to Update:**
- `session3-advanced.qmd`: Lines 305-425 - Add section on Wasabi S3 sync
- `session1-concepts.qmd`: Line 95-99 - Mention S3-compatible storage providers

---

### 8. Registry Website Generation

**Status:** NEW FEATURE - Web interface available

**What Changed:**
- `mint-registry build-site` command generates static Jekyll site
- No longer just "planned" - basic site generation is working
- Static site can be deployed to GitHub Pages
- Catalog browsing via web interface (not just GitHub search)

**Site Features:**
- Browse datasets like a library catalog
- Search and filter catalog entries
- Client-side templating for dynamic content
- Jekyll-based static site generation

**Impact on Presentation:**
- ❌ Session 1, Slide "Benefit 1: Findability" (line 158) says "Coming Soon (Web Interface)"
- ✅ Should say "Available Now" or "In Beta"
- ❌ Session 3, Slide "Web Interface Preview" (line 640) says "Design phase"
- ✅ Should say "Implemented - basic functionality available"
- 📝 Could add demo of actual website

**Files to Update:**
- `session1-concepts.qmd`: Lines 158-176 - Update web interface status
- `session3-advanced.qmd`: Lines 640-655 - Update from "planned" to "available"
- Consider adding screenshots of actual registry website

---

### 9. Registry Management Commands

**Status:** ENHANCED - More control over registry

**What Changed:**
- `mint-registry migrate` - Migrate existing repositories via GitOps
- `mint-registry update` - Update registry with missing/outdated files
- `mint-registry sync` - Manual permission sync trigger
- `mint-registry build-site` - Generate static website
- All operations support tokenless workflow via SSH

**Impact on Presentation:**
- ✅ Session 3 mentions migration strategy (line 437)
- ⚠️ Could emphasize that migration is now an automated command
- 📝 Add example of migration command usage

**Files to Update:**
- `session3-advanced.qmd`: Lines 437-488 - Add `mint-registry migrate` example
- `session3-advanced.qmd`: Update command from `mint registry register` to `mintd registry register`

---

### 10. Documentation Site

**Status:** NEW RESOURCE - Official documentation available

**What Changed:**
- Full MkDocs documentation site at https://cooper-lab.github.io/mint/
- Comprehensive guides for:
  - Installation
  - Quick start
  - Project types (data, project, infra, enclave)
  - Configuration
  - Features (storage, Stata integration, utilities, registry)
  - CLI reference
  - API reference
  - Development guide

**Documentation Structure:**
```
docs/
├── index.md              # Homepage
├── installation.md       # Install guide
├── quick-start.md        # Getting started
├── project-types.md      # Project type details
├── configuration.md      # Config reference
├── templates.md          # Template system
├── cli.md               # CLI reference
├── api.md               # Python API
├── development.md       # Contributing guide
└── features/
    ├── storage.md       # S3, DVC setup
    ├── stata.md         # Stata integration
    ├── utilities.md     # Helper functions
    └── registry.md      # Registry integration
```

**Impact on Presentation:**
- ⚠️ Presentation references local README files
- ✅ Should add the documentation website URL
- 📝 Add slide showing documentation site

**Files to Update:**
- `session2-usage.qmd`: Lines 706-710 - Add documentation website URL
- `session3-advanced.qmd`: Lines 755-770 - Add documentation website URL
- `README.md`: Line 365 - Update documentation link

---

### 11. Template System Refactoring

**Status:** INTERNAL IMPROVEMENT - Better code organization

**What Changed:**
- Language-specific template strategies for Python, R, and Stata
- Standardized template directory structure
- Template manager with Jinja2 rendering
- Templates now in `src/mintd/files/` directory

**Template Categories:**
- Project templates (data, project, infra, enclave)
- Language templates (python, r, stata)
- Utility templates (logging, validation, manifest)
- Documentation templates (README, metadata)

**Impact on Presentation:**
- ✅ Presentation doesn't go into template internals
- ✅ User-facing behavior unchanged
- 📝 Could mention improved template system in advanced session

**Files to Update:**
- `session3-advanced.qmd`: Consider adding note about template customization

---

### 12. Manifest System

**Status:** NEW FEATURE - Change detection

**What Changed:**
- New `mintd manifest` command group
- File manifests for change detection
- Track which files have changed since last run
- Useful for incremental processing workflows

**Impact on Presentation:**
- ⚠️ Not mentioned in presentation at all
- 📝 Could add as advanced topic for power users

**Files to Update:**
- `session3-advanced.qmd`: Consider adding manifest system as advanced feature

---

## 📊 Summary of Required Updates

### High Priority (Must Fix)

1. **Rename all `mint` commands to `mintd`** throughout presentation
   - Affects: All three sessions, README
   - Scope: ~50+ command examples

2. **Update enclave status from "planned" to "implemented"**
   - Affects: Session 1 (Benefit 6), Session 3 (enclave section)
   - Scope: ~8 slides

3. **Add tokenless GitOps explanation**
   - Affects: Session 1 (architecture), Session 2 (prerequisites)
   - Scope: 2-3 new slides

4. **Update web interface status to "available"**
   - Affects: Session 1 (findability), Session 3 (future capabilities)
   - Scope: 2 slides

### Medium Priority (Should Update)

5. **Add documentation website link**
   - Affects: Session 2 and 3 resources sections
   - Scope: Update URLs in 2 slides

6. **Emphasize mandatory language selection**
   - Affects: Session 2 (creating projects)
   - Scope: 1 slide, add warning/note

7. **Add Wasabi S3 integration details**
   - Affects: Session 3 (access control)
   - Scope: 1-2 slides

### Low Priority (Nice to Have)

8. **Add mintd data import commands**
   - Affects: Session 2 (workflow)
   - Scope: 1 slide or note

9. **Add manifest system mention**
   - Affects: Session 3 (advanced features)
   - Scope: 1 slide

10. **Add screenshots of actual tools**
    - Affects: All sessions
    - Scope: Visual enhancement

---

## 🔍 Commands Changed Reference

### Old Command → New Command

| Old (Presentation) | New (Current) | Status |
|-------------------|---------------|---------|
| `mint create data` | `mintd create data` | REQUIRED |
| `mint config setup` | `mintd config setup` | REQUIRED |
| `mint registry register` | `mintd registry register` | REQUIRED |
| `mint create enclave` | `mintd create enclave` | REQUIRED |
| N/A | `mintd enclave add` | NEW |
| N/A | `mintd enclave pull` | NEW |
| N/A | `mintd enclave package` | NEW |
| N/A | `mintd enclave verify` | NEW |
| N/A | `mintd enclave unpack` | NEW |
| N/A | `mintd enclave clean` | NEW |
| N/A | `mintd enclave list` | NEW |
| N/A | `mintd data import` | NEW |
| N/A | `mintd manifest create` | NEW |
| N/A | `mint-registry build-site` | NEW |
| N/A | `mint-registry update` | NEW |

---

## 📝 Architecture Changes

### Tokenless GitOps Flow (NEW)

```
User → mintd → SSH Git Clone → Local Changes → Git Push → PR
                                                           ↓
                                                   GitHub Actions
                                                    (GITHUB_TOKEN)
                                                           ↓
                                              Repository Creation
                                              Permission Sync
```

**Benefits:**
- No personal access tokens needed
- Better security (repository-scoped)
- PR-based review workflow
- Automatic permission sync

### Enclave Workflow (NOW IMPLEMENTED)

```
Networked Machine:
1. mintd enclave add <dataset>      # Add to manifest
2. mintd enclave pull <dataset>     # Download data
3. mintd enclave package --name X   # Create transfer bundle

Physical Transfer:
4. Copy tarball to USB/secure transfer

Air-Gapped Enclave:
5. mintd enclave verify <archive>   # Verify integrity
6. mintd enclave unpack <archive>   # Unpack data
7. Use data for analysis

Maintenance:
8. mintd enclave clean              # Prune old versions
```

---

## 🎯 Testing Commands (Verify Before Presenting)

Run these commands to verify current functionality:

```bash
# Test basic mintd installation and commands
mintd --version
mintd --help
mintd create --help
mintd enclave --help
mintd data --help
mintd registry --help

# Test mint-registry commands
mint-registry --help
mint-registry validate --help
mint-registry build-site --help

# Test configuration
mintd config --help
mintd config show  # Show current config (if any)

# Test template listing
mintd templates list

# Check documentation site
# https://cooper-lab.github.io/mint/
```

---

## 📚 Resources for Updating Presentation

### Official Documentation
- Main site: https://cooper-lab.github.io/mint/
- mintd README: `/Users/mad265/git-pub/cooper-lab/mintd/README.md`
- mint-registry README: `/Users/mad265/git-pub/cooper-lab/mint-registry/README.md`

### Repository Locations
- mintd: `/Users/mad265/git-pub/cooper-lab/mintd`
- mint-registry: `/Users/mad265/git-pub/cooper-lab/mint-registry`
- data-registry: `/Users/mad265/git-yale/cooper-lab/data-registry`

### Git History
- mintd: Recent commits show rename, enclave implementation, DVC enhancements
- mint-registry: Recent commits show Wasabi sync, tokenless workflow, site generation

### Example Projects
- Check `/Users/mad265/git-pub/cooper-lab/` for example projects created with mintd

---

## ✅ Validation Checklist

Before presenting, verify:

- [ ] All `mint` commands changed to `mintd` in slides
- [ ] All code examples tested with current mintd version
- [ ] Enclave slides reflect implemented (not planned) status
- [ ] Tokenless GitOps workflow explained
- [ ] SSH key setup emphasized in prerequisites
- [ ] Web interface marked as available (not coming soon)
- [ ] Documentation website URL included in resources
- [ ] Screenshots updated with actual mintd output (not mock-ups)
- [ ] Demo scripts tested with actual repositories
- [ ] Config file paths updated (~/.mintd/ not ~/.mint/)

---

**Next Steps:**
1. Review this document
2. Update presentation files (.qmd)
3. Test all code examples
4. Create screenshots of actual tools
5. Update demo scripts
6. Render and review presentations
7. Practice demos with actual commands

