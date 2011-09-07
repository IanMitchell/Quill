require 'test_helper'

class ArchivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

  test "should get date" do
    get :date
    assert_response :success
  end

end
