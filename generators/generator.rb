module Matrack
  class Generator < Thor
    include Thor::Actions

    attr_reader :app_name

    class_option :test_framework, default: :rspec

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "new app_name", "creates new project with app_name as the app name"
    # The new method is actually like the initializer of this class.
    def new(app_name)
      @app_name = app_name
      empty_directory "#{app_name}"
      create_mvc_dir(["assets", "controllers", "helpers", "models", "views"])
      create_dir(["config", "db"])
      files = ["config.ru", "Gemfile", "README.md"]
      copy_basic_files(files)
    end

    desc "method[create_a_file]", "creates new file"
    def create_a_file(name, path)
      create_file "#{path}/#{name}"
    end

    desc "method[create_mvc_dir]", "creates app dir with mvc folders"
    def create_mvc_dir(directories = [])
      directories.each do |name|
        empty_directory "#{app_name}/app/#{name}"
        create_asset_dirs if name == "assets"
        if name == "views"
          create_view_layout
          files = ["application.html.erb", "invalid.html.erb"]
          path = "app/views/layout"
          copy_basic_files(files, path)
        elsif name == "controllers"
          copy_basic_files("application_controller.rb", "app/#{name}")
        end
      end
    end

    desc "method[create_asset_dirs]", "creates asset subfolders"
    def create_asset_dirs
      directories = ["css", "images", "js"]
      directories.each do |name|
        path = "#{app_name}/app/assets/#{name}"
        empty_directory path
        create_a_file("application.#{name}", path) if ["css", "js"].include? name
      end
    end

    desc "method[create_view_layout]", "creates view layout folder"
    def create_view_layout
      empty_directory "#{app_name}/app/views/layout"
    end

    desc "method[create_dir]", "creates directories in the app root"
    def create_dir(directories = [])
      directories.each do |name|
        empty_directory "#{app_name}/#{name}"
        files = ["active_manager.rb", "application.rb", "routes.rb"]
        copy_basic_files(files, "#{name}") if name == "config"
      end
    end

    desc "method[copy_basic_files]", "creates basic setup files"
    def copy_basic_files(name, path = nil)
      dir_path = path.nil? ? "#{app_name}" : "#{app_name}/#{path}"
      if name.is_a? Array
        name.each { |n| copy_file "generate/#{n}", "#{dir_path}/#{n}" }
      else
        copy_file "generate/#{name}", "#{dir_path}/#{name}"
      end
    end

  end
end
