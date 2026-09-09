-- clearpage.lua
local h2_count = 0

function Header(h)
  if h.level == 2 then
    h2_count = h2_count + 1
    if h2_count > 2 then
      return {pandoc.RawBlock("latex", "\\clearpage\n"), h}
    end
  end
end
