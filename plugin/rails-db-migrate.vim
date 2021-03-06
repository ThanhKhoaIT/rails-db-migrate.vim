" @Author:      Khoa Nguyen (thanhkhoait@gmail.com)
" @Created:     2020-06-24.

command! RailsMigrateDown call RailsMigrateDownThisFile()
command! RailsMigrateUp call RailsMigrateUpThisFile()
command! RailsMigrateRedo call RailsMigrateRedoThisFile()
command! RailsMigrate call RailsMigrate()

let s:default_command = "!bundle exec rake"

if !exists("g:rails_migrate_command")
  let g:rails_migrate_command = s:default_command
endif

function! s:GetCurrentMigrateVerion()
  let l:filename = expand("%:t")
  let l:migrate_version=split(l:filename, '_')[0]
  if ((l:migrate_version * 1) == 0)
    return 0
  else
    return l:migrate_version
  endif
endfunction

function! RailsMigrateUpThisFile()
  if (s:GetCurrentMigrateVerion() == 0)
    echo 'Current file is not migrate'
    return
  else
    execute g:rails_migrate_command . " db:migrate:up VERSION=" . s:GetCurrentMigrateVerion()
  end
endfunction

function! RailsMigrateDownThisFile()
  if (s:GetCurrentMigrateVerion() == 0)
    echo 'Current file is not migrate'
    return
  else
    execute g:rails_migrate_command . " db:migrate:down VERSION=" . s:GetCurrentMigrateVerion()
  end
endfunction

function! RailsMigrateRedoThisFile()
  if (s:GetCurrentMigrateVerion() == 0)
    echo 'Current file is not migrate'
    return
  else
    execute g:rails_migrate_command . " db:migrate:redo VERSION=" . s:GetCurrentMigrateVerion()
  end
endfunction

function! RailsMigrate()
  execute g:rails_migrate_command . " db:migrate"
endfunction
