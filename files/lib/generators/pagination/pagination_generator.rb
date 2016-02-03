class PaginationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_layout
    copy_file "stylesheet.scss", "app/assets/stylesheets/pagination.scss"
    copy_file "pagination.js", "app/assets/javascripts/pagination.js"
    template "_pagination.html.erb", "app/views/layouts/_pagination.html.erb"
    
    inject_into_file 'app/controllers/application_controller.rb', :after => "protect_from_forgery with: :exception\n" do <<-'RUBY'
  before_action :set_pagination_params
  
  def set_pagination_params
    if params[:offset]
      @offset = params[:offset].to_i
    end
    if params[:number]
      @number = params[:number].to_i
    end
    if params[:total]
      @total = params[:total].to_i
    end
  end
    RUBY
    end
  end
end
