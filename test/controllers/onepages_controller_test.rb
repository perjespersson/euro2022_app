require "test_helper"

class OnepagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onepage = onepages(:one)
  end

  test "should get index" do
    get onepages_url
    assert_response :success
  end

  test "should get new" do
    get new_onepage_url
    assert_response :success
  end

  test "should create onepage" do
    assert_difference("Onepage.count") do
      post onepages_url, params: { onepage: {  } }
    end

    assert_redirected_to onepage_url(Onepage.last)
  end

  test "should show onepage" do
    get onepage_url(@onepage)
    assert_response :success
  end

  test "should get edit" do
    get edit_onepage_url(@onepage)
    assert_response :success
  end

  test "should update onepage" do
    patch onepage_url(@onepage), params: { onepage: {  } }
    assert_redirected_to onepage_url(@onepage)
  end

  test "should destroy onepage" do
    assert_difference("Onepage.count", -1) do
      delete onepage_url(@onepage)
    end

    assert_redirected_to onepages_url
  end
end
