class HomeController < ApplicationController
  def index
    @personnel_rating = PersonnelRating.new
    @rating_score = RatingScore.new
    @personnel_ratings = PersonnelRating.all
  end


  def personnel_rating 
    @personnel_rating = PersonnelRating.new
  end

 #Custom Method --Feedback-- To run feedback Page
  def feedback
    #paginate: Does the pagination of pages
    @personnel_ratings = PersonnelRating.all.paginate(:page=>params[:page], per_page:10)
    @personnel_rating = PersonnelRating.new

  end
  
end
