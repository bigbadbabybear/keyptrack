require 'test_helper'

class BuildsGooglePlayControllerTest < ActionController::TestCase
  test "should get commit:string" do
    get :commit:string
    assert_response :success
  end

  test "should get game:references" do
    get :game:references
    assert_response :success
  end

end
