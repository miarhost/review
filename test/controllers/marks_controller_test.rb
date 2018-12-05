require 'test_helper'

class MarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mark = marks(:one)
  end

  test "should get index" do
    get marks_url, as: :json
    assert_response :success
  end

  test "should create mark" do
    assert_difference('Mark.count') do
      post marks_url, params: { mark: { post_id: @mark.post_id, value: @mark.value } }, as: :json
    end

    assert_response 201
  end

  test "should show mark" do
    get mark_url(@mark), as: :json
    assert_response :success
  end

  test "should update mark" do
    patch mark_url(@mark), params: { mark: { post_id: @mark.post_id, value: @mark.value } }, as: :json
    assert_response 200
  end

  test "should destroy mark" do
    assert_difference('Mark.count', -1) do
      delete mark_url(@mark), as: :json
    end

    assert_response 204
  end
end
