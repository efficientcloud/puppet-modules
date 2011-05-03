class role::development {
  include auto::detect
  include puppet::client
  include resolver
  include screen
  include vim
  include zsh
  include sudo
  include users
}
