module Matrack
  class MvcGen < Generator
    attr_reader :name, :len

    desc "method[g]", "generates new controllers, models and views"
    def g(*args)
      @name = args[0] == "controller" ? args[1].pluralize : args[1]
      @len = args.length
      create_controller(args) if args[0] == "controller"
      create_model(args) if args[0] == "model"
    end

    desc "method[create_controller]", "creates new controllers"
    def create_controller(args)
      create_file "./app/controllers/#{name}_controller.rb" do
        data = "class #{name.to_camel_case}Controller < ApplicationController"
        args[2..-1].each { |mthd| data += "\n  def #{mthd} \n  end"} if len > 2
        data += "\nend"
      end
      create_views(args)
      create_helper
    end

    desc "method[create_views]", "creates new controllers views"
    def create_views(args)
      path = "./app/views/#{name}"
      empty_directory path
      if len > 2
        args[2..-1].each { |mthd| create_a_file("#{mthd}.html.erb", path) }
      end
    end

    desc "method[create_helper]", "creates new helper"
    def create_helper
      path = "./app/helpers/#{name}_helper.rb"
      create_file "./app/helpers/#{name}_helper.rb" do
        "module #{name.to_camel_case}Helper \nend"
      end
    end

    desc "method[create_model]", "creates new models"
    def create_model(args)
      create_file "./app/models/#{name}.rb" do
        data = "class #{name.to_camel_case} < Matrack::BaseModel"
        if len > 2
          args[2..-1].each do |prop|
            name, type = prop.split(":")
            data += "\n  property :#{name}, :#{type}"
          end
        end
        data += "\n  create_table \nend"
      end
    end

    map ["g", "generate"] => "g"
  end
end