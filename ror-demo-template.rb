apply "https://raw.github.com/Taalmonsters/rails-composer/master/devise-gmail-composer.rb"

copy_from_repo 'app/assets/stylesheets/application.css.scss',
  :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'

copy_from_repo 'app/views/layouts/_navigation-taalmonsters.html.erb',
  {:dest => 'app/views/layouts/_navigation.html.erb', :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
  
copy_from_repo '36a24f487b20c3f73b8ac6d20e749257cb8148b1/devise.nl.yml',
  {:dest => 'config/locales/devise.nl.yml', :repo => 'https://gist.githubusercontent.com/jwkloos/f3136056b96241f1d46f/raw/'}
  
copy_from_repo '5c7b9fe5572e6783c47de7e0366ae54c16b5d0ab/devise_invitable.nl.yml',
  {:dest => 'config/locales/devise_invitable.nl.yml', :repo => 'https://gist.githubusercontent.com/scambra/1311861/raw/'}

copy_from_repo 'config/locales/nl.yml',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
  
# Add demo banner
inject_into_file 'app/views/layouts/application.html.erb', :before => "</body>" do <<-'RUBY'
    <div id="banner">DEMO</div>
RUBY
end

gsub_file 'app/views/layouts/application.html.erb', /\<title\>/, '<title>De Taalmonsters - '

copy_from_repo 'app/views/home/index.html.erb',
  {:dest => 'app/views/visitors/index.html.erb', :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}

git add: "."
git commit: %Q{ -m 'Commit after generate' }
