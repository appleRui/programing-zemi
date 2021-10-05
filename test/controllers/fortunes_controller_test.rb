require 'test_helper'

class FortunesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fortune = fortunes(:one)
  end

  test "should get index" do
    get fortunes_url
    assert_response :success
  end

  test "should get new" do
    get new_fortune_url
    assert_response :success
  end

  test "should create fortune" do
    assert_difference('Fortune.count') do
      post fortunes_url, params: { fortune: { content: @fortune.content, tweet_id: @fortune.tweet_id } }
    end

    assert_redirected_to fortune_url(Fortune.last)
  end

  test "should show fortune" do
    get fortune_url(@fortune)
    assert_response :success
  end

  test "should get edit" do
    get edit_fortune_url(@fortune)
    assert_response :success
  end

  test "should update fortune" do
    patch fortune_url(@fortune), params: { fortune: { content: @fortune.content, tweet_id: @fortune.tweet_id } }
    assert_redirected_to fortune_url(@fortune)
  end

  test "should destroy fortune" do
    assert_difference('Fortune.count', -1) do
      delete fortune_url(@fortune)
    end

    assert_redirected_to fortunes_url
  end
end
