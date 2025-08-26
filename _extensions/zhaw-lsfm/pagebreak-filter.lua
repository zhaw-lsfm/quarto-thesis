-- Add pagebreaks before level 1 headings
function Header(el)
  if el.level == 1 then
    -- Add a pagebreak before level 1 headings
    local pagebreak = pandoc.RawBlock('typst', '#pagebreak(weak: true)')
    return {pagebreak, el}
  end
  return el
end