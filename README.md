# Rails DB Migrate VIM Plugin
-----

### Installation

Recommended installation with `vundle`:

```vim
  Plugin 'ThanhKhoaIT/rails-db-migrate.vim'
```

### Configuration
#### Key mappings
Add your preferred key mappings to your `.vimrc` file.

```vim
" rails-db-migrate.vim mappings
map <Leader>dm :RailsMigrate<CR>
map <Leader>dd :RailsMigrateDown<CR>
map <Leader>du :RailsMigrateUp<CR>
map <Leader>dr :RailsMigrateRedo<CR>
```

#### Custom command
Overwrite the `g:rails_migrate_command` variable to execute a custom command.

Example: (it is Default)
```vim
let g:rails_migrate_command = "!bundle exec rake"
```

This `g:rails_migrate_command` variable can be used to support any number of migration runners or pre-loaders.
For example, to use Dispatch:
```vim
let g:rails_migrate_command = "Dispatch bundle exec rake"
```
