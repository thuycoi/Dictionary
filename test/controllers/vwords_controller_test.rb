require 'test_helper'

class VwordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vword = vwords(:one)
  end

  test "should get index" do
    get vwords_url
    assert_response :success
  end

  test "should get new" do
    get new_vword_url
    assert_response :success
  end

  test "should create vword" do
    assert_difference('Vword.count') do
      post vwords_url, params: { vword: { wort: @vword.wort } }
    end

    assert_redirected_to vword_url(Vword.last)
  end

  test "should show vword" do
    get vword_url(@vword)
    assert_response :success
  end

  test "should get edit" do
    get edit_vword_url(@vword)
    assert_response :success
  end

  test "should update vword" do
    patch vword_url(@vword), params: { vword: { wort: @vword.wort } }
    assert_redirected_to vword_url(@vword)
  end

  test "should destroy vword" do
    assert_difference('Vword.count', -1) do
      delete vword_url(@vword)
    end

    assert_redirected_to vwords_url
  end
end
