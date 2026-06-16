-- landscape-filter.lua
-- Wraps content in a landscape page for Typst output.
-- For HTML output the div is passed through unchanged.
--
-- Usage: wrap a table (or any block) in a div with class "landscape":
--
--   ::: {.landscape}
--   | A | B | C |
--   |---|---|---|
--   | 1 | 2 | 3 |
--   : My wide table {#tbl-wide}
--   :::
--
--   Or with a code-generated table:
--
--   ::: {.landscape}
--   ```{r}
--   #| label: tbl-wide
--   #| tbl-cap: "My wide table"
--   knitr::kable(wide_df)
--   ```
--   :::

function Div(el)
  if not quarto.doc.is_format("typst") then
    return nil
  end

  if el.classes:includes("landscape") then
    local open  = pandoc.RawBlock('typst', '#page(flipped: true)[')
    local close = pandoc.RawBlock('typst', ']')
    local blocks = { open }
    for _, block in ipairs(el.content) do
      table.insert(blocks, block)
    end
    table.insert(blocks, close)
    return blocks
  end
end
