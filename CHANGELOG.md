# Changelog

All notable changes to the ZHAW LSFM Quarto-Typst template will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Quarto book project support (requires Quarto >= 1.9.18)
- Multi-chapter structure with numbered chapter files in root directory
- `appendix-filter.lua` for automatic A/B appendix numbering via `file_metadata` API
- Appendix-aware heading numbering in `typst-template.typ` via `appendix-mode` state

### Fixed
- Renamed `cover-image` metadata field to `zhaw-cover-image` to avoid conflict with Quarto's built-in `cover-image` book field (which caused `[object Object].png` in HTML output)

### Removed
- `template.qmd` single-file template (superseded by book chapter files)

### Changed
- Font configuration now uses Quarto's standard `mainfont` YAML parameter instead of hardcoded Typst fallback chain
- Switched project type from single-file to `type: book`
- Replaced `template.qmd` with `index.qmd` as book entry point plus numbered chapter files
- ZHAW-specific metadata now lives in `_quarto.yml` instead of per-file YAML frontmatter
- Book HTML output now serves as the landing page (replaces separate `index.qmd` landing page)
- Bumped minimum Quarto version to 1.9.18

### Removed
- `template.qmd` single-file template (replaced by book chapter files)
- Separate landing page `index.qmd` (replaced by book HTML output)

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

[Unreleased]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.2.1...HEAD
[0.2.1]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/zhaw-lsfm/quarto-thesis/releases/tag/v0.1.0
