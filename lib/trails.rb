require "trails/version"
require "trails/array.rb"

module Trails
  class Application
    def call(env)
         `echo debug > debug.txt`;
        [200, {'Content-Type' => 'text/html'}, ["Lets go for a trail"] ]
    end
  end
end
