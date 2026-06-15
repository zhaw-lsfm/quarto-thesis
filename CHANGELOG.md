# Changelog

All notable changes to the ZHAW LSFM Quarto-Typst template will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.1] - 2026-06-15

### Fixed
- Figure and table counters now run consecutively across chapters; previously Quarto's per-chapter counter resets caused numbering to restart at each level-1 heading

## [0.3.0] - 2026-03-11

### Added
- Quarto book project support (requires Quarto >= 1.9.18)
- Multi-chapter structure with numbered chapter files (`index.qmd`, `1-zusammenfassung.qmd`, `2-einleitung.qmd`, ...)
- `1-zusammenfassung.qmd` as a dedicated abstract chapter (visible as its own page in HTML)
- `appendix-filter.lua` for automatic A/B appendix numbering via `file_metadata` API
- Appendix-aware heading numbering in `typst-template.typ` via `appendix-mode` state
- `zhaw-title-block` shortcode rendering the full ZHAW title page in HTML (header, supervisors, imprint)
- PDF download button in HTML output via Quarto's built-in `downloads: pdf` book option

### Changed
- Renamed `cover-image` metadata field to `zhaw-cover-image` to avoid conflict with Quarto's built-in `cover-image` book field
- Switched project type from single-file to `type: book`
- ZHAW-specific metadata now lives in `_quarto.yml` instead of per-file YAML frontmatter
- HTML title block (`title-block.html`) now empty — index title page handled by `{{< zhaw-title-block >}}` shortcode; chapter titles rendered via `is-index` flag
- `index.qmd` sidebar label set to `"Titelseite"` via `text:` in `_quarto.yml`
- Removed default `mainfont: Arial` — Typst uses its built-in default; Arial can be set optionally via `mainfont` in `_quarto.yml`
- Bumped minimum Quarto version to 1.9.18
- `zhaw-lsfm-html` listed before `zhaw-lsfm-typst` in `_quarto.yml` so HTML sidebar links resolve correctly

### Fixed
- `[object Object].png` in HTML cover image (caused by conflict with Quarto's built-in `cover-image` field)
- Empty font fallback list crash in Typst when `mainfont` is not set
- HTML title block and sidebar appearing on every chapter page

### Removed
- `template.qmd` single-file template (superseded by book chapter files)

## [0.2.1] - 2025-12-11

### Added
- Imprint (Impressum) section for HTML format
- Citation recommendation in imprint section
- Keywords display in imprint section
- Institution information in imprint section
- Year extraction from submission date for citations
- Imprint-related labels (German/English) in `html-labels.lua`

### Changed
- Updated HTML title block template to include imprint section
- Enhanced CSS styling for imprint section

## [0.2.0] - 2025-12-11

### Added
- HTML format support (`zhaw-lsfm-html`)
- Custom HTML title page with ZHAW metadata
- CSS styling for HTML output (`zhaw-html.css`)
- HTML title block template partial (`partials/title-block.html`)
- Language-specific labels for HTML via Lua filter (`html-labels.lua`)
- `.nojekyll` file for proper GitHub Pages deployment of `_extensions` folder

### Changed
- Extension now supports both Typst and HTML output formats
- Updated `_extension.yml` with HTML format configuration

## [0.1.0] - 2024-XX-XX

### Added
- Initial Typst template for ZHAW LSFM theses
- ZHAW institutional branding (headers, title page, imprint)
- Shortcodes for document structure (TOC, figures, tables, references)
- German/English language support
- Automatic page breaks before major sections
- Custom font support via `fonts/` directory
- Metadata-driven template with 20+ YAML fields

[Unreleased]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.3.1...HEAD
[0.3.1]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/zhaw-lsfm/quarto-thesis/releases/tag/v0.1.0
