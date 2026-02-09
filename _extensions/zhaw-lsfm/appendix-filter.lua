-- Detect the appendix divider heading emitted by Quarto book projects
-- and switch heading numbering to alphabetic (A, B, C, ...)

local found_appendix = false

function Header(el)
  if not quarto.doc.is_format("typst") then
    return nil
  end

  -- Quarto emits the appendix divider as an unnumbered level-1 heading
  -- with class "unnumbered" containing the localized appendix title
  if el.level == 1 and el.classes:includes("unnumbered") then
    local text = pandoc.utils.stringify(el.content)
    if text == "Anhang" or text == "Appendices" or text == "Appendix" then
      found_appendix = true
      -- Emit the appendix state change and reset heading counter
      local state_change = pandoc.RawBlock('typst',
        '#state("appendix-mode", false).update(true)\n#counter(heading).update(0)')
      return {state_change, el}
    end
  end

  return nil
end
