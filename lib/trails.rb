require "trails/version"
require "trails/array"
require "trails/routing"
require "trails/util"
require "trails/dependencies"

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
      rescue
        body = "
          <div>
            <h1>Oops!</h1>
            <h2>We could't find the page <br>you were looking for.</h2>
            <p>You may have mistyped the address or the page may have moved.</p>
          </div>"
        [200, {'Content-Type' => 'text/html'}, [body] ]
      end
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
