require_relative "test_helper"
class TestApp < Trails::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class TestController < Trails::Controller
  def index
    "Hello! from controller test"
  end
end

class TrailsAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/index"
    assert last_response.ok?
    body = last_response.body
    assert body["Hello!"]
  end

  def test_url
    get "/product/1"
    assert last_response.ok?
    body = last_response.body
    assert body[""]
  end
end