# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto-Typst template for ZHAW LSFM (Zurich University of Applied Sciences) academic documents. The template provides institutional branding, proper formatting, and automated document structure generation for student theses and academic papers.

## Common Development Commands

### Building and Rendering
```bash
# Render main template example to all formats
quarto render template.qmd

# Render specific format
quarto render template.qmd --to zhaw-lsfm-typst
quarto render template.qmd --to html

# Render index documentation
quarto render index.qmd
```

### Development and Testing
```bash
# Preview with live reload
quarto preview template.qmd

# Check extension installation
quarto list extensions

# Install/reinstall extension locally during development
quarto install extension . --no-prompt
```

## Architecture Overview

### Extension Structure
```
_extensions/zhaw-lsfm/
├── typst-template.typ     # Main Typst template with ZHAW formatting
├── typst-show.typ         # YAML metadata mapping to Typst
├── _extension.yml         # Extension configuration
├── shortcodes.lua         # Document structure shortcodes
├── class-filter.lua       # .hidden class expansion
├── pagebreak-filter.lua   # Automatic page breaks
└── fonts/                 # Custom font directory
```

### Core Template Features
- **Institutional branding**: Automatic ZHAW headers, title page, and imprint generation
- **Document structure**: Shortcodes for TOC, figure/table lists, references
- **Metadata-driven**: Extensive YAML frontmatter support for thesis information
- **Language support**: German/English automatic text generation
- **Font handling**: Arial default with fallback cascade and local font support

### Key Files
- `template.qmd`: Example thesis document with full YAML metadata
- `index.qmd`: Documentation and feature demonstration
- `_extension.yml`: Extension configuration with format settings and filters

### Template Integration
The template uses a filter pipeline:
1. `class-filter.lua`: Expands `.hidden` to `.unnumbered .unlisted`
2. `pagebreak-filter.lua`: Adds page breaks before major sections
3. Quarto's built-in Typst processing

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

### File Ignore Patterns
The `.quartoignore` excludes build artifacts and example files from template distribution.