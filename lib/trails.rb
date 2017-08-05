require "trails/version"
require "trails/array"
require "trails/routing"

module Trails
  class Application
    def call(env)
        klass, action = get_controller_and_action(env)
        controller = klass.new(env)
        body = controller.send(action)
        [200, {'Content-Type' => 'text/html'}, [body] ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
