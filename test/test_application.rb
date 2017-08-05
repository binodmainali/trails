require_relative "test_helper"
class TestApp < Trails::Application
end

class TrailsAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert last_response.ok?
    body = last_response.body
    assert body["Lets"]
  end

  def test_url
    get "/product/1"
    assert last_response.ok?
    body = last_response.body
    assert body[""]
  end
end