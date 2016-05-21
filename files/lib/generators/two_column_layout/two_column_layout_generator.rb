class TwoColumnLayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_layout
    copy_file "stylesheet.scss", "app/assets/stylesheets/two_column_layout.scss"
    template "application.html.erb", "app/views/layouts/application.html.erb"
    template "_menu.html.erb", "app/views/layouts/_menu.html.erb"
    template "_copyright.html.erb", "app/views/layouts/_copyright.html.erb"
  end
  
end
