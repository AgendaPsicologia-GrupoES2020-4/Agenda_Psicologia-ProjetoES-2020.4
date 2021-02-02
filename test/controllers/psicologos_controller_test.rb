require "test_helper"

class PsicologosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get psicologos_new_url
    assert_response :success
  end

  test "should get create" do
    get psicologos_create_url
    assert_response :success
  end
end
