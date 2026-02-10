# Fonts Directory

This directory can contain local font files (.ttf or .otf) that will be used by Typst in addition to system fonts.

## Font Configuration

The template uses Quarto's standard `mainfont` YAML parameter (set to `Arial` in `_extension.yml`). You can override the font in your `_quarto.yml`:

```yaml
format:
  zhaw-lsfm-typst:
    mainfont: "My Custom Font"
```

## For Arial Font Support

If Arial is not installed on your system, you can place Arial font files here:

- `arial.ttf` - Arial Regular
- `arialbd.ttf` - Arial Bold
- `ariali.ttf` - Arial Italic
- `arialbi.ttf` - Arial Bold Italic

## Usage

Simply place your font files in this directory. Typst will automatically find and use them if they match the configured font name.
