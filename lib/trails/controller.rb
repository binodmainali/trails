require 'erubis'
require 'trails/file_model'

module Trails
  class Controller
    include Trails::Model
    def initialize(env)
       @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      klass = self.class
      klass.instance_variable_set(:@req_start_time, Time.now)
      eruby.result locals.merge(:env => env, :start_time => klass.instance_variable_get(:@req_start_time))
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Trails.to_underscore klass
    end
  end
end