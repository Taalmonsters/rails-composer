apply "https://raw.github.com/Taalmonsters/rails-composer/master/devise-gmail-composer.rb"

copy_from_repo 'app/assets/stylesheets/application-bootstrap.css.scss',
  :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'
copy_file 'app/assets/stylesheets/application-bootstrap.css.scss', 'app/assets/stylesheets/application.css.scss'
copy_file 'app/assets/stylesheets/application.css.scss', 'app/assets/stylesheets/application.scss'

git add: "."
git commit: %Q{ -m 'Commit after generate' }
