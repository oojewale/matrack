module Matrack
  class MvcGen < Generator

    attr_reader :name, :len
    desc "method[g]", "generates new controllers, models and views"
    def g(*args)
      @name = args[1]
      @len = args.length
      create_controller(args) if args[0] == "controller"
      create_model(args) if args[0] == "model"
    end

    desc "method[create_controller]", "creates new controllers"
    def create_controller(args)
      create_file "./app/controllers/#{name}.rb" do
        data = "class #{name.to_camel_case} < Matrack::BaseController"
        args[2..-1].each { |mthd| data += "\n def #{mthd} \n end"} if len > 2
        data += "\nend"
      end
      create_views(args)
    end

    desc "method[create_views]", "creates new controllers views"
    def create_views(args)
      path = "./app/views/#{name}"
      empty_directory path
      if len > 2
        args[2..-1].each { |mthd| create_a_file("#{mthd}.html.erb", path) }
      end
    end

    desc "method[create_controller]", "creates new controllers"
    def create_model(args)
      create_file "./app/models/#{name}.rb" do
        data = "class #{name.to_camel_case} < ActiveManager"
        if len > 2
          args[2..-1].each do |prop|
            name = prop.split(":").first.to_sym
            type = prop.split(":").last.to_sym
            data += "\n property #{name}, #{type} \n end"
          end
        end
        data += "\n create_table \nend"
      end
    end

  end
end