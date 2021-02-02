class RatingScoresController < ApplicationController
  before_action :set_rating_score, only: [:show, :edit, :update, :destroy]

  # GET /rating_scores
  # GET /rating_scores.json
  def index
    @rating_scores = RatingScore.all
  end

  # GET /rating_scores/1
  # GET /rating_scores/1.json
  def show
  end

  # GET /rating_scores/new
  def new
    @rating_score = RatingScore.new
  end

  # GET /rating_scores/1/edit
  def edit
  end

  # POST /rating_scores
  # POST /rating_scores.json
  def create
    @rating_score = RatingScore.new(rating_score_params)

    respond_to do |format|
      if @rating_score.save
        format.html { redirect_to @rating_score, notice: 'Rating score was successfully created.' }
        format.json { render :show, status: :created, location: @rating_score }
      else
        format.html { render :new }
        format.json { render json: @rating_score.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /rating_scores/1
  # PATCH/PUT /rating_scores/1.json
  def update
    respond_to do |format|
      if @rating_score.update(rating_score_params)
        format.html { redirect_to @rating_score, notice: 'Rating score was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating_score }
      else
        format.html { render :edit }
        format.json { render json: @rating_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_scores/1
  # DELETE /rating_scores/1.json
  def destroy
    @rating_score.destroy
    respond_to do |format|
      format.html { redirect_to rating_scores_url, notice: 'Rating score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_score
      @rating_score = RatingScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_score_params
      params.require(:rating_score).permit(:score_name, :score_emojis)
    end
end
