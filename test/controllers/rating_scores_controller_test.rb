require 'test_helper'

class RatingScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating_score = rating_scores(:one)
  end

  test "should get index" do
    get rating_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_rating_score_url
    assert_response :success
  end

  test "should create rating_score" do
    assert_difference('RatingScore.count') do
      post rating_scores_url, params: { rating_score: { score_name: @rating_score.score_name } }
    end

    assert_redirected_to rating_score_url(RatingScore.last)
  end

  test "should show rating_score" do
    get rating_score_url(@rating_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_rating_score_url(@rating_score)
    assert_response :success
  end

  test "should update rating_score" do
    patch rating_score_url(@rating_score), params: { rating_score: { score_name: @rating_score.score_name } }
    assert_redirected_to rating_score_url(@rating_score)
  end

  test "should destroy rating_score" do
    assert_difference('RatingScore.count', -1) do
      delete rating_score_url(@rating_score)
    end

    assert_redirected_to rating_scores_url
  end
end
