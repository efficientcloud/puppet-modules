class role::puppet {
  include auto::detect
  include nullmailer
  include puppet::client
  include resolver
  include screen
  include vim
  include zsh
}
