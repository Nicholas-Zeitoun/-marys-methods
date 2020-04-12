require 'test_helper'

class StepControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get step_new_url
    assert_response :success
  end

end
