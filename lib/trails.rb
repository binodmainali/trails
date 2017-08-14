require "trails/version"
require "trails/array"
require "trails/routing"
require "trails/util"
require "trails/dependencies"
require "trails/controller"
require "trails/file_model"

module Trails
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [ 302, {'Location' =>"http://google.com"}, [] ]
      end
      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        body = controller.send(action)
        [200, {'Content-Type' => 'text/html'}, [body] ]
      rescue Exception => e
        [200, {'Content-Type' => 'text/html'}, [e] ]
      end
    end
  end
end
