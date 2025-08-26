-- Shortcodes for generating figure and table lists in Typst
return {
  ['list-of-figures'] = function(args, kwargs, meta)
    -- Generate typst code for figure list
    local typst_code = '#outline(title: none, target: figure.where(kind: "quarto-float-fig"))'
    return pandoc.RawBlock('typst', typst_code)
  end,
  
  ['list-of-tables'] = function(args, kwargs, meta)
    -- Generate typst code for table list  
    local typst_code = '#outline(title: none, target: figure.where(kind: "quarto-float-tbl"))'
    return pandoc.RawBlock('typst', typst_code)
  end
}