vim.cmd[[
if exists('g:neovide')
  let g:neovide_refresh_rate=70
  let g:neovide_scroll_animation_length = 0.3
  let g:neovide_no_idle=v:true
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_animation_length=0.03
  let g:neovide_cursor_antialiasing=v:true
  let g:neovide_cursor_vfx_mode = 'wireframe'
  set guifont=Iosevka\ Term:h13
end
]]
