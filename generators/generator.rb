module Matrack
  class Generator < Thor
    include Thor::Actions

    # argument :name
    class_option :test_framework, default: :rspec

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "new appname", "creates new project with name as the app name"
    def new(name)
      empty_directory "#{name}"
      create_mvc_dir(name, ["assets", "controllers", "models", "views"])
    end

    desc "new appname", "creates new project with name as the app name"
    def create_lib_file
      create_file "#{name}/lib/#{name}.rb" do
        "class #{name.camelize}\n end"
      end
    end

    desc "method[create_mvc_dir]", "creates app dir with mvc folders"
    def create_mvc_dir(app_name, directories = [])
      directories.each { |name| empty_directory "#{app_name}/app/#{name}" }
    end

  end
end
