apply "https://raw.github.com/Taalmonsters/rails-composer/master/devise-gmail-composer.rb"

copy_file "https://raw.github.com/Taalmonsters/rails-composer/master/files/app/assets/stylesheets/application-bootstrap.css.scss", "app/assets/stylesheets/application.css"

git add: "."
git commit: %Q{ -m 'Commit after generate' }
