require 'test_helper'

class GwordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gword = gwords(:one)
  end

  test "should get index" do
    get gwords_url
    assert_response :success
  end

  test "should get new" do
    get new_gword_url
    assert_response :success
  end

  test "should create gword" do
    assert_difference('Gword.count') do
      post gwords_url, params: { gword: { entry: @gword.entry } }
    end

    assert_redirected_to gword_url(Gword.last)
  end

  test "should show gword" do
    get gword_url(@gword)
    assert_response :success
  end

  test "should get edit" do
    get edit_gword_url(@gword)
    assert_response :success
  end

  test "should update gword" do
    patch gword_url(@gword), params: { gword: { entry: @gword.entry } }
    assert_redirected_to gword_url(@gword)
  end

  test "should destroy gword" do
    assert_difference('Gword.count', -1) do
      delete gword_url(@gword)
    end

    assert_redirected_to gwords_url
  end
end
