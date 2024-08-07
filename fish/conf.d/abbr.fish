if not set --query --global MY_ABBR_SET
  set --global MY_ABBR_SET true

  # Unix
  abbr -a ae nvim ~/.abbr.fish
  abbr -a clr clear
  abbr -a devlog tail -f log/development.log
  abbr -a ll lsd -al
  abbr -a ls lsd -a
  abbr -a p "ps aux | grep"

  # git
  abbr -a main "git stash && git co main && git fetch origin && git pull origin main --rebase"
  abbr -a gcaa git commit -a --amend
  abbr -a gl git log --pretty=oneline --abbrev-commit -n40
  abbr -a gr git reset HEAD^
  abbr -a gst git status
  abbr -a gtfo "echo '(╯°□°)╯︵ ┻━┻' && git reset --hard && git clean --force"
  abbr -a staging "git stash && git co staging && git fetch origin && git pull origin staging --rebase"

  # Bundler
  abbr -a be bundle exec

  # Rails
  abbr -a dm "rails db:migrate && RAILS_ENV=test rails db:migrate && git co origin/main db/structure.sql"
  abbr -a drb "rails db:rollback STEP=1 && RAILS_ENV=test rails db:rollback STEP=1 && git co origin/master db/structure.sql"

  #AWS
  abbr -a tweakster-aws "open -a /Applications/Firefox\ Developer\ Edition.app -g https://tweakster.awsapps.com/start#/"
end
