# Apply basic devise composer with Gmail action mailer
apply "https://raw.github.com/Taalmonsters/rails-composer/master/devise-gmail-composer-unconfirmable.rb"

# Add Taalmonster-specific css
copy_from_repo 'app/assets/stylesheets/application.css.scss',
  :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'
git add: "."
git commit: %Q{ -m 'Add Taalmonster-specific css' }

# Add Taalmonsters-specific navigation
copy_from_repo 'app/views/layouts/_navigation-taalmonsters.html.erb',
  {:dest => 'app/views/layouts/_navigation.html.erb', :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
git add: "."
git commit: %Q{ -m 'Add Taalmonsters-specific navigation' }

# Add Dutch translation files
copy_from_repo '36a24f487b20c3f73b8ac6d20e749257cb8148b1/devise.nl.yml',
  {:dest => 'config/locales/devise.nl.yml', :repo => 'https://gist.githubusercontent.com/jwkloos/f3136056b96241f1d46f/raw/'}
copy_from_repo '5c7b9fe5572e6783c47de7e0366ae54c16b5d0ab/devise_invitable.nl.yml',
  {:dest => 'config/locales/devise_invitable.nl.yml', :repo => 'https://gist.githubusercontent.com/scambra/1311861/raw/'}
copy_from_repo 'config/locales/nl.yml',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
git add: "."
git commit: %Q{ -m 'Add Dutch translation files' }

# Add brand name to page title
gsub_file 'app/views/layouts/application.html.erb', /\<title\>/, '<title>De Taalmonsters - '
git add: "."
git commit: %Q{ -m 'Add brand name to page title' }

# Replace root index
copy_from_repo 'app/views/home/index.html.erb',
  {:dest => 'app/views/visitors/index.html.erb', :repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
git add: "."
git commit: %Q{ -m 'Replace root index' }

# Add layout generators
copy_from_repo 'lib/generators/single_column_layout/single_column_layout_generator.rb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/single_column_layout/templates/_copyright.html.erb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/single_column_layout/templates/application.html.erb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/single_column_layout/templates/stylesheet.scss',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/two_column_layout/two_column_layout_generator.rb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/two_column_layout/templates/_copyright.html.erb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/two_column_layout/templates/application.html.erb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/two_column_layout/templates/_menu.html.erb',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
copy_from_repo 'lib/generators/two_column_layout/templates/stylesheet.scss',
  {:repo => 'https://raw.github.com/Taalmonsters/rails-composer/master/files/'}
git add: "."
git commit: %Q{ -m 'Add layout generators' }

if yes?("Use two-column-layout?")
  # Transform to two-column layout
  generate 'two_column_layout'
  git add: "."
  git commit: %Q{ -m 'Apply two-column layout' }
else
  # Transform to single-column layout
  generate 'single_column_layout'
  git add: "."
  git commit: %Q{ -m 'Apply single-column layout' }
end
 
# Add demo banner
if yes?("Add demo banner?")
  inject_into_file 'app/views/layouts/application.html.erb', :before => "</body>" do <<-'RUBY'
      <div id="banner">DEMO</div>
  RUBY
  end
  git add: "."
  git commit: %Q{ -m 'Add demo banner' }
end

# Add content to user index
inject_into_file 'app/views/users/index.html.erb', :after => "</h1>" do <<-'RUBY'
    <table class="table">
    <tbody>
      <% @users.each do |user| %>
        <tr>
          <%= render user %>
        </tr>
      <% end %>
    </tbody>
  </table>
RUBY
end
git add: "."
git commit: %Q{ -m 'Add content to user index' }

# Add content to user show
inject_into_file 'app/views/users/show.html.erb', :after => "</h1>" do <<-'RUBY'
    <p>Name: <%= @user.name if @user.name %></p>
    <p>Email: <%= @user.email if @user.email %></p>
RUBY
end
git add: "."
git commit: %Q{ -m 'Add content to user show' }
