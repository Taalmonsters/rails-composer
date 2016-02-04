class VisualisationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :vis_type, :type => :string
  
  def generate_visualisation
    if vis_type.eql?('graph')
      generate_graph_vis
    end
  end
  
  private
  
  def generate_graph_vis
    copy_file "graph.scss", "app/assets/stylesheets/graph.scss"
    copy_file "graph.js", "app/assets/javascripts/graph.js"
    get "https://raw.githubusercontent.com/mbostock/d3/master/d3.min.js", "app/assets/javascripts/d3.min.js"
    template "_graph.html.erb", "app/views/visualisations/_graph.html.erb"
  end
  
end
