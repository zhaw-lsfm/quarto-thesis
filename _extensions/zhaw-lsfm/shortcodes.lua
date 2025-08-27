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
  end,
  
  ['table-of-contents'] = function(args, kwargs, meta)
    -- Generate typst code for table of contents
    local typst_code = '#outline(title: none)'
    return pandoc.RawBlock('typst', typst_code)
  end,
  
  ['references'] = function(args, kwargs, meta)
    -- Generate references div for bibliography
    return pandoc.Div({}, pandoc.Attr("refs"))
  end
}