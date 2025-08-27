# ZHAW LSFM Quarto-Typst Template

A Quarto-Typst template for creating documents that conform to ZHAW (Zurich University of Applied Sciences) Department Life Sciences and Facility Management requirements.

## Features

- **Institutional branding**: Separate title page with ZHAW LSFM headers (German/English)
- **Imprint page**: Automatic second page with keywords, citation, and institute information
- **Page numbering**: Starts with first chapter (pages 1-2 are unnumbered)
- **Section numbering**: Decimal format (1.1., 1.2.) with 2-level depth by default
- **Figure/table lists**: User-friendly shortcodes for automated lists
- **Bibliography integration**: Automatic page breaks and proper citation handling

## Installing

```bash
quarto use template <github-organization>/zhaw-lsfm
```

This will install the format extension and create an example qmd file that you can use as a starting place for your document.

## Metadata Reference

### Basic Document Information

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `title` | string | Document title | `"Robust Regression and Outlier Detection"` |
| `subtitle` | string | Document subtitle | `"Chapter 2: Simple Regression"` |
| `date` | string | Document date | `"2024-01-15"` |
| `institut` | string | Institute name (displayed in uppercase) | `"umwelt und natürliche ressourcen"` |
| `lang` | string | Language code (`"en"` or `"de"`) | `"de"` |

### Author Information

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `author` | object/array | Author details with name, affiliation, email | See example below |

```yaml
author:
  - name: "Dr. Jane Smith"
    affiliation: "ZHAW LSFM"
    email: "jane.smith@zhaw.ch"
```

### Academic Document Fields (Theses)

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `thesis-type` | string | Type of thesis | `"Master Thesis"` |
| `degree-type` | string | Degree program | `"Master of Science"` |
| `study-year` | string | Academic year | `"2023/2024"` |
| `study-direction` | string | Field of study | `"Environmental Engineering"` |
| `submission-date` | string | Submission date | `"2024-06-30"` |
| `confidential` | boolean | Mark as confidential | `true` |
| `correctors` | array | List of thesis supervisors | See example below |

```yaml
correctors:
  - title: "Prof. Dr."
    name: "Max Mustermann"
    affiliation: "ZHAW LSFM"
```

### Document Layout & Formatting

| Field | Type | Description | Default | ZHAW Override |
|-------|------|-------------|---------|---------------|
| `papersize` | string | Paper size | `"us-letter"` | No change |
| `margin` | object | Page margins | `{x: 1.25in, y: 1.25in}` | No change |
| `mainfont` | string | Main text font | `"libertinus serif"` | No change |
| `fontsize` | string | Font size | `11pt` | No change |
| `section-numbering` | string | Section numbering format | `none` | `"1.1."` |
| `page-numbering` | string | Page numbering style | `"1"` | `none` (starts with content) |

### Table of Contents

| Field | Type | Description | Default |
|-------|------|-------------|---------|
| `toc` | boolean | Include table of contents | `false` |
| `toc-title` | string | TOC title | Language-dependent |
| `toc-depth` | number | TOC depth level | `2` |
| `toc-indent` | string | TOC indentation | `1.5em` |

### Content Organization

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `abstract` | string | Document abstract | `"This study examines..."` |
| `keywords` | string | Document keywords (for imprint) | `"regression, statistics, R"` |
| `columns` | number | Number of columns | `1` |

## ZHAW-Specific Modifications

The template has been customized with the following ZHAW requirements:

### 1. Institutional Branding
- **Title page headers**: Conditional German/English university and department names
- **Language logic**: Based on `lang` parameter
  - German (default): "ZÜRCHER HOCHSCHULE FÜR ANGEWANDTE WISSENSCHAFTEN"
  - English: "ZURICH UNIVERSITY OF APPLIED SCIENCES"

### 2. Page Structure
- **Separate title page**: Wrapped in `page()[]` for dedicated first page
- **Imprint page**: Automatic second page with keywords, APA citation, institute
- **Page numbering**: Starts with first content chapter (pages 1-2 unnumbered)

### 3. Section Numbering
- **Default format**: Changed from `"1.1"` to `"1.1."` for proper decimal numbering
- **Depth**: 2-level hierarchy by default (user-configurable)

### 4. Enhanced Features
- **Figure/table lists**: Shortcode support for automated generation
- **Bibliography integration**: Proper page breaks and citation handling
- **Institut display**: Automatic uppercase conversion of institute names

## Usage Example

```yaml
---
title: "Your Document Title"
subtitle: "Optional Subtitle"
institut: "your institute name"
lang: "de"  # or "en"
author:
  - name: "Your Name"
    affiliation: "ZHAW LSFM"
    email: "your.email@zhaw.ch"
keywords: "keyword1, keyword2, keyword3"
format:
  zhaw-lsfm-typst:
    toc: true
    number-sections: true
---
```

