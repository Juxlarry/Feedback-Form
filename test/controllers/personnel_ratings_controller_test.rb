require 'test_helper'

class PersonnelRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personnel_rating = personnel_ratings(:one)
  end

  test "should get index" do
    get personnel_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_personnel_rating_url
    assert_response :success
  end

  test "should create personnel_rating" do
    assert_difference('PersonnelRating.count') do
      post personnel_ratings_url, params: { personnel_rating: { cashier_rate: @personnel_rating.cashier_rate, comments: @personnel_rating.comments, doctor_rate: @personnel_rating.doctor_rate, lab_rate: @personnel_rating.lab_rate, nurse_rate: @personnel_rating.nurse_rate, pharmacist_rate: @personnel_rating.pharmacist_rate, receptionist_rate: @personnel_rating.receptionist_rate, staff_rate: @personnel_rating.staff_rate } }
    end

    assert_redirected_to personnel_rating_url(PersonnelRating.last)
  end

  test "should show personnel_rating" do
    get personnel_rating_url(@personnel_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_personnel_rating_url(@personnel_rating)
    assert_response :success
  end

  test "should update personnel_rating" do
    patch personnel_rating_url(@personnel_rating), params: { personnel_rating: { cashier_rate: @personnel_rating.cashier_rate, comments: @personnel_rating.comments, doctor_rate: @personnel_rating.doctor_rate, lab_rate: @personnel_rating.lab_rate, nurse_rate: @personnel_rating.nurse_rate, pharmacist_rate: @personnel_rating.pharmacist_rate, receptionist_rate: @personnel_rating.receptionist_rate, staff_rate: @personnel_rating.staff_rate } }
    assert_redirected_to personnel_rating_url(@personnel_rating)
  end

  test "should destroy personnel_rating" do
    assert_difference('PersonnelRating.count', -1) do
      delete personnel_rating_url(@personnel_rating)
    end

    assert_redirected_to personnel_ratings_url
  end
end
