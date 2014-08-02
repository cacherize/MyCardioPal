class ZcontrollerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :controller_name, type: :string, default: 'new'

  def generate_controller
    case behavior
    when :invoke
      template "controller.erb", "app/controllers/#{file_name}_controller.rb"
      template "form_actions.erb", "app/views/#{file_name}/new.html.erb"
      template "form_actions.erb", "app/views/#{file_name}/edit.html.erb"
      template "form.erb", "app/views/#{file_name}/_form.html.erb"
      create_file "app/assets/stylesheets/all/#{file_name}.css.scss"
      create_file "app/assets/javascripts/#{file_name}.js"
    when :revoke
      File.delete "app/controllers/#{file_name}_controller.rb"
      File.delete "app/assets/stylesheets/all/#{file_name}.css.scss"
      File.delete "app/assets/javascripts/#{file_name}.js"
      Dir.delete "app/views/#{file_name}"
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
