return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Custom function to safely extract total words and active visual selections
    local function get_words()
      local wc = vim.fn.wordcount()
      if wc.visual_words ~= nil then
        return "   " .. wc.visual_words .. "/" .. wc.words
      else
        return "   " .. wc.words
      end
    end

    -- Insert the word count component into section lualine_z (far right corner)
    -- You can switch this to 'lualine_x' or 'lualine_y' depending on preference
    table.insert(opts.sections.lualine_z, {
      get_words,
      cond = function()
        -- Only display word count in text, markdown, or documentation files
        local ft = vim.bo.filetype
        return ft == "markdown" or ft == "text" or ft == "asciidoc" or ft == "org"
      end,
    })
  end,
}
