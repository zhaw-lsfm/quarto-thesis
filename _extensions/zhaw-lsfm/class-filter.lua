-- Filter to expand .hidden class to .unnumbered .unlisted
return {
  {
    Header = function (header)
      local classes = header.classes
      
      -- Check if header has "hidden" class
      for i, class in ipairs(classes) do
        if class == "hidden" then
          -- Remove "hidden" class
          classes:remove(i)
          
          -- Add "unnumbered" and "unlisted" if not already present
          local has_unnumbered = false
          local has_unlisted = false
          
          for _, existing_class in ipairs(classes) do
            if existing_class == "unnumbered" then
              has_unnumbered = true
            elseif existing_class == "unlisted" then
              has_unlisted = true
            end
          end
          
          if not has_unnumbered then
            classes:insert("unnumbered")
          end
          
          if not has_unlisted then
            classes:insert("unlisted")
          end
          
          break
        end
      end
      
      return header
    end
  }
}