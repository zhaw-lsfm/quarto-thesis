# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **template repository** for the ZHAW LSFM Quarto-Typst template.

**Repository Structure:**
- Extension (`_extensions/zhaw-lsfm/`)
- Template scaffolding (`template.qmd`)
- Minimal landing page (`index.qmd`)

**Full documentation** is maintained separately at:
- Repository: <https://github.com/zhaw-lsfm/quarto-thesis-docs>
- Website: <https://zhaw-lsfm.github.io/quarto-thesis-docs>

## Common Development Commands

### Building Template Demo
```bash
# Render template to all formats
quarto render template.qmd

# Specific formats
quarto render template.qmd --to zhaw-lsfm-typst
quarto render template.qmd --to html

# Preview
quarto preview template.qmd
```

### Publishing Landing Page
```bash
# Render landing page and demos
quarto render index.qmd
quarto render template.qmd

# Publish to GitHub Pages
quarto publish gh-pages
```

### Testing Template Installation
```bash
# Test in clean directory
mkdir ../test-install && cd ../test-install
quarto use template zhaw-lsfm/quarto-thesis

# Verify installed files
ls -la
```

## Architecture Overview

### This Repository (quarto-thesis)

Serves two purposes:
1. **Quarto Extension** - Students install via `quarto use template`
2. **Landing Page** - Quick start info at <https://zhaw-lsfm.github.io/quarto-thesis>

### Documentation Repository (quarto-thesis-docs)

Contains:
- Full user manual
- ZHAW requirements
- Developer guides
- Getting started tutorials

### Extension Structure
```
_extensions/zhaw-lsfm/
├── typst-template.typ     # Main Typst template with ZHAW formatting
├── typst-show.typ         # YAML metadata mapping to Typst
├── _extension.yml         # Extension configuration
├── shortcodes.lua         # Document structure shortcodes
├── pagebreak-filter.lua   # Automatic page breaks
└── fonts/                 # Custom font directory
```

### Core Template Features
- **Institutional branding**: Automatic ZHAW headers, title page, and imprint generation
- **Document structure**: Shortcodes for TOC, figure/table lists, references
- **Metadata-driven**: Extensive YAML frontmatter support for thesis information
- **Language support**: German/English automatic text generation
- **Font handling**: Arial default with fallback cascade and local font support

### Template Integration
The template uses a filter pipeline:
1. `pagebreak-filter.lua`: Adds page breaks before major sections
2. Quarto's built-in Typst processing

### Shortcode System
Unified `{{< >}}` syntax for document elements:
- `{{< table-of-contents >}}`
- `{{< list-of-figures >}}`
- `{{< list-of-tables >}}`
- `{{< references >}}`

### YAML Metadata Schema
The template supports 20+ metadata fields including:
- Standard Quarto: `title`, `author`, `bibliography`, `lang`
- ZHAW-specific: `institut`, `thesis-type`, `degree-type`, `study-direction`, `supervisors`
- Formatting: `confidential`, `submission-date`, `study-year`

## Working with .quartoignore

Files listed in `.quartoignore` are NOT provided to students when they run `quarto use template`.

Current exclusions:
- Website files (index.qmd, _quarto.yml)
- Documentation files (now in separate repo)
- Project files (CLAUDE.md, Readme.md, .Rproj)
- Build artifacts (_site, .quarto)

Students receive:
- `template.qmd` (renamed to their directory name)
- `_extensions/` directory
- `cover.png`
- `references.bib`

## Extension Development

Changes to `_extensions/zhaw-lsfm/` affect:
- Template rendering behavior
- Available metadata fields
- Document formatting

After changes:
1. Test with `template.qmd`
2. Test with clean installation
3. Update documentation (in separate repo)
4. Follow release process (see below)

## Release Process

The extension uses semantic versioning (MAJOR.MINOR.PATCH). Follow this checklist when releasing:

### Making Changes
1. As you develop, add notes to `CHANGELOG.md` under `[Unreleased]` section
   - `Added`: New features
   - `Changed`: Changes to existing functionality
   - `Fixed`: Bug fixes
   - `Removed`: Removed features

### Creating a Release
1. **Update version number** in `_extensions/zhaw-lsfm/_extension.yml`
   - MAJOR: Breaking changes (e.g., 0.x.x → 1.0.0)
   - MINOR: New features, backwards compatible (e.g., 0.1.x → 0.2.0)
   - PATCH: Bug fixes only (e.g., 0.1.0 → 0.1.1)

2. **Update CHANGELOG.md**:
   ```bash
   # Move [Unreleased] changes to new version section
   # Add release date
   # Update comparison links at bottom
   ```

3. **Test thoroughly**:
   ```bash
   quarto render template.qmd --to zhaw-lsfm-typst
   quarto render template.qmd --to zhaw-lsfm-html

   # Test clean installation
   cd ../test && quarto use template ../quarto-thesis
   ```

4. **Commit and tag**:
   ```bash
   git add _extensions/zhaw-lsfm/_extension.yml CHANGELOG.md
   git commit -m "Release v0.x.x"
   git tag v0.x.x
   git push && git push --tags
   ```

5. **Create GitHub release** (optional but recommended):
   ```bash
   gh release create v0.x.x --title "v0.x.x" --notes-file CHANGELOG.md
   ```

### Version Guidelines
- Students use `quarto use template` which pulls latest commit
- Git tags allow pinning to specific versions if needed
- Keep CHANGELOG.md updated so changes are traceable

## Development Notes

### Font Configuration
- Default: Arial 11pt with extensive fallback cascade
- Custom fonts: Place .ttf/.otf files in `_extensions/zhaw-lsfm/fonts/`
- Override: Use `mainfont` and `fontsize` in YAML frontmatter
- **Known Issue**: Template rendering shows font warnings for Arial, Helvetica Neue, and Helvetica when these fonts are not installed on the system. Document still renders successfully using system fallback fonts.

### Class Usage Patterns
- `.hidden`: For abstracts (unnumbered, not in TOC)
- `.unnumbered`: For TOC, abbreviations, bibliographies (not numbered, appears in TOC)

### Known Limitations
- **Quarto Book Projects**: Not supported for custom Typst formats (confirmed by Quarto team)
- **Workaround**: Use single document with `{{< include >}}` for multi-chapter content
