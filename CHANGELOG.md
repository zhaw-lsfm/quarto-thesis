# Changelog

All notable changes to the ZHAW LSFM Quarto-Typst template will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
### Changed
### Fixed
### Removed

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

[Unreleased]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/zhaw-lsfm/quarto-thesis/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/zhaw-lsfm/quarto-thesis/releases/tag/v0.1.0
