# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **template repository** for the ZHAW LSFM Quarto-Typst template.

**Repository Structure:**
- Extension (`_extensions/zhaw-lsfm/`)
- Book project with numbered chapter files (`index.qmd`, `1-einleitung.qmd`, ...)
- Project configuration (`_quarto.yml`)

**Full documentation** is maintained separately at:
- Repository: <https://github.com/zhaw-lsfm/quarto-thesis-docs>
- Website: <https://zhaw-lsfm.github.io/quarto-thesis-docs>

## Common Development Commands

### Building the Book
```bash
# Render to all formats
quarto render

# Specific format
quarto render --to zhaw-lsfm-typst

# Preview
quarto preview
```

### Publishing to GitHub Pages
```bash
# Render and publish (book HTML output serves as the landing page)
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
1. **Quarto Extension** — Students install via `quarto use template`
2. **Demo / Landing Page** — The book rendered to HTML at <https://zhaw-lsfm.github.io/quarto-thesis>

### Book Project Structure

The project uses `type: book` in `_quarto.yml`. Chapter files are in the root directory with numeric prefixes to indicate order:

```
_quarto.yml              # Book project config + ZHAW metadata
index.qmd                # Front matter (TOC, Typst only)
1-zusammenfassung.qmd    # Abstract / Zusammenfassung
2-einleitung.qmd         # Chapter 1
3-literatur.qmd          # Chapter 2
4-methoden.qmd           # Chapter 3
5-ergebnisse.qmd         # Chapter 4
6-diskussion.qmd         # Chapter 5
references.qmd           # Bibliography
7-anhang-rohdaten.qmd    # Appendix A (under appendices: key)
8-anhang-statistik.qmd   # Appendix B
```

**Why `index.qmd`?** `index.qmd` is the standard Quarto book entry point and works for both book and website rendering. When students install via `quarto use template`, they receive `index.qmd` plus a renamed copy (e.g., `PA2.qmd`) — the renamed copy can be deleted.

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
├── pagebreak-filter.lua   # Automatic page breaks before H1 headings
├── appendix-filter.lua    # Switches appendix numbering to A, B, C
└── fonts/                 # Custom font directory
```

### Core Template Features
- **Book project**: Multi-chapter thesis with proper chapter numbering
- **Institutional branding**: Automatic ZHAW headers, title page, and imprint generation
- **Document structure**: Shortcodes for TOC, figure/table lists, references
- **Appendix support**: Automatic A/B numbering for appendix chapters
- **Metadata-driven**: Extensive YAML configuration in `_quarto.yml`
- **Language support**: German/English automatic text generation
- **Font handling**: Arial default via Quarto's `mainfont` YAML parameter, with local font support

### Filter Pipeline
The template uses three Lua filters:
1. `pagebreak-filter.lua`: Adds page breaks before level-1 headings
2. `appendix-filter.lua`: Detects appendix chapters via `file_metadata` API and switches heading numbering from `1.1.` to `A.1.`
3. Quarto's built-in Typst processing

### Shortcode System
Unified `{{< >}}` syntax for document elements:
- `{{< table-of-contents >}}`
- `{{< list-of-figures >}}`
- `{{< list-of-tables >}}`
- `{{< references >}}`

### YAML Metadata Schema
ZHAW-specific metadata lives in `_quarto.yml` (not in individual chapter files):
- Standard Quarto: `title`, `author`, `bibliography`, `lang` (under `book:`)
- ZHAW-specific: `institut`, `thesis-type`, `degree-type`, `study-direction`, `supervisors`
- Formatting: `confidential`, `submission-date`, `study-year`, `cover-image`

## Working with .quartoignore

Files listed in `.quartoignore` are NOT provided to students when they run `quarto use template`.

Current exclusions:
- Project files (CLAUDE.md, Readme.md, .Rproj)
- Build artifacts (docs/, *_files, *.typ, .quarto)
- Documentation files

Students receive:
- `_quarto.yml` (book project config with metadata)
- `index.qmd` (front matter / book entry point)
- Numbered chapter files (`1-einleitung.qmd`, etc.)
- `references.qmd`
- `_extensions/` directory
- `cover.png`
- `references.bib`

**Note:** `quarto use template` also creates a renamed copy of `index.qmd` (e.g., `PA2.qmd`). This duplicate can be deleted — `_quarto.yml` references `index.qmd`.

## Extension Development

Changes to `_extensions/zhaw-lsfm/` affect:
- Template rendering behavior
- Available metadata fields
- Document formatting

After changes:
1. Test with `quarto render --to zhaw-lsfm-typst`
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
   quarto render --to zhaw-lsfm-typst

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
- **Minimum Quarto version**: 1.9.18 (required for Typst book support)

## Development Notes

### Font Configuration
- Default: Arial 11pt (set via `mainfont` and `fontsize` in `_extension.yml`)
- Custom fonts: Place .ttf/.otf files in `_extensions/zhaw-lsfm/fonts/`
- Override: Use `mainfont` and `fontsize` in `_quarto.yml` under the format key

### Class Usage Patterns
- `.unnumbered .unlisted`: Exclude heading from TOC and numbering
- `.unnumbered`: Not numbered but appears in TOC (e.g. bibliography)

### Appendix Handling
- Chapters listed under `appendices:` in `_quarto.yml` get A/B numbering
- `appendix-filter.lua` uses `quarto.doc.file_metadata()` API to detect appendix chapters (language-independent)
- The filter sets a Typst state (`appendix-mode`) and resets the heading counter
- `typst-template.typ` checks this state to switch between `1.1.` and `A.1.` numbering

## TODOs

1. **Push / publish** — push main to origin, publish GitHub Pages.
