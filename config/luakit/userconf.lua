soup.accept_policy = "always"



-------------------------------------------------------------------------------------
--			keys binding
-------------------------------------------------------------------------------------
-- ctrl+c to copy
local modes = require "modes"
modes.add_binds("normal", {{
    "<Control-c>",
    "Copy selected text.",
    function ()
        luakit.selection.clipboard = luakit.selection.primary
    end
}})



--local modes = require "modes"
--modes.add_binds("normal", {{
--    "<Control-r>",
--    "Refresh the page.",
--    function ()
--        luakit.selection.clipboard = luakit.selection.primary
--    end
--}})


-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
--			adblock
-------------------------------------------------------------------------------------
require "adblock"
require "adblock_chrome"
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
--			homepage
-------------------------------------------------------------------------------------
local settings = require "settings"
settings.window.home_page = "www.swisscows.com"
-------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------
-- --			Download location
-- -------------------------------------------------------------------------------------
require "downloads"
-- require "downloads_chrome"
-- downloads.default_dir = os.getenv("HOME") .. "~/Downloads/Browser/Luakit"
-- -------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
--			Search
-------------------------------------------------------------------------------------
settings.window.default_search_engine = "duckduckgo"
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


--lousy.widget.tab.label_format = '<span font="Monspace">{index}: </span>{title}'



-------------------------------------------------------------------------------------
--Play Embedded Video in External Player
--The following snippet shows an example binding to 
--launch mpv to find a video via youtube-dl, then watch it:

-------------------------------------------------------------------------------------
local modes = require("modes")
local video_cmd_fmt = "mpv --ytdl '%s'"
modes.add_binds("ex-follow", {
  { "m", "Hint all links and open the video behind that link externally with MPV.",
      function (w)
          w:set_mode("follow", {
              prompt = "open with MPV", selector = "uri", evaluator = "uri",
              func = function (uri)
                  assert(type(uri) == "string")
                  luakit.spawn(string.format(video_cmd_fmt, uri))
                  w:notify("Launched MPV")
              end
          })
      end },
  { "M", "Open the video on the current page externally with MPV.",
      function (w)
        local uri = string.gsub(w.view.uri or "", " ", "%%20")
        luakit.spawn(string.format(video_cmd_fmt, uri))
        w:notify("Launched MPV")
      end },
})
-------------------------------------------------------------------------------------













-------------------------------------------------------------------------------------
-- Luakit's collection of included modules 
-------------------------------------------------------------------------------------
-- adblock_chrome.lua       keysym.lua
-- adblock.lua              log_chrome.lua
-- adblock_wm.lua           lousy
-- binds_chrome.lua         markdown.lua
-- binds.lua                modes.lua
-- bookmarks_chrome.lua     newtab_chrome.lua
-- bookmarks.lua            noscript.lua
-- chrome.lua               open_editor.lua
-- chrome_wm.lua            proxy.lua
-- cmdhist.lua              quickmarks.lua
-- completion.lua           readline.lua
-- domain_props.lua         referer_control_wm.lua
-- downloads_chrome.lua     search.lua
-- downloads.lua            select.lua
-- editor.lua               select_wm.lua
-- error_page.lua           session.lua
-- error_page_wm.lua        settings_chrome.lua
-- follow.lua               settings.lua
-- follow_selected.lua      styles.lua
-- follow_selected_wm.lua   tab_favicons.lua
-- follow_wm.lua            tabhistory.lua
-- formfiller.lua           taborder.lua
-- formfiller_wm.lua        undoclose.lua
-- go_input.lua             unique_instance.lua
-- go_next_prev.lua         userscripts.lua
-- go_up.lua                vertical_tabs.lua
-- help_chrome.lua          viewpdf.lua
-- hide_scrollbars.lua      view_source.lua
-- history_chrome.lua       webinspector.lua
-- history.lua              webview.lua
-- image_css.lua            webview_wm.lua
-- image_css_wm.lua         window.lua
-- introspector_chrome.lua
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
-- 			directories are
-------------------------------------------------------------------------------------
-- ~/.local/share/luakit/styles
-- /usr/share/luakit
-- ~/.config/luakit
-------------------------------------------------------------------------------------
