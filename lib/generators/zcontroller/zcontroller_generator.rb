class ZcontrollerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :controller_name, type: :string, default: 'new'
  class_option :new, type: :boolean, default: true, desc: 'Include new action'
  class_option :edit, type: :boolean, default: true, desc: 'Include edit action'
  class_option :stylesheet, type: :boolean, default: true, desc: 'Include stylesheet'
  class_option :javascript, type: :boolean, default: true, desc: 'Include javascript'

  def paths
    @controller_path = "app/controllers/#{file_name}_controller.rb"
    @stylesheet_path = "app/assets/stylesheets/all/#{file_name}.css.scss"
    @javascripts_path = "app/assets/javascripts/#{file_name}.js" 
  end

  def generate_controller
    case behavior
    when :invoke
      template "controller.erb", @controller_path
      template "form_actions.erb", "app/views/#{file_name}/new.html.erb" if options.new?
      template "form_actions.erb", "app/views/#{file_name}/edit.html.erb" if options.new? && options.edit?
      template "form.erb", "app/views/#{file_name}/_form.html.erb" if options.new?
      create_file @stylesheet_path if options.stylesheet?
      create_file @javascripts_path if options.javascript?
    else
      FileUtils.remove_entry @controller_path, force: true
      FileUtils.remove_entry @stylesheet_path, force: true
      FileUtils.remove_entry @javascripts_path, force: true
      FileUtils.remove_entry "app/views/#{file_name}", force: true
    end
  end

  def add_routes
    case behavior
    when :invoke
      route("resources :#{file_name}, only: [:index#{', :new, :create, :show' if options.new?}#{', :edit, :update' if options.new? && options.edit?}]")
    end
  end

  private #!!! All public methods are run !!!#

  def file_name
    controller_name.underscore
  end

  def file_name_singular
    file_name.singularize
  end

  def model_name
    file_name.titleize.singularize.gsub(" ", "")
  end
end
