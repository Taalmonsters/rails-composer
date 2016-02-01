apply "https://raw.github.com/Taalmonsters/rails-composer/master/devise-gmail-composer.rb"

copy_from_repo 'app/assets/stylesheets/application.css.scss',
  :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'

copy_from_repo 'app/views/layouts/_navigation-taalmonsters.html.erb',
  {:dest => 'app/views/layouts/_navigation.html.erb', :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}

git add: "."
git commit: %Q{ -m 'Commit after generate' }
