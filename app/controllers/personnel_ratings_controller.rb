class PersonnelRatingsController < ApplicationController
  before_action :set_personnel_rating, only: [:show, :edit, :update, :destroy]

  # GET /personnel_ratings
  # GET /personnel_ratings.json
  def index
    @personnel_ratings = PersonnelRating.all
  end

  # GET /personnel_ratings/1
  # GET /personnel_ratings/1.json
  def show
  end

  # GET /personnel_ratings/new
  def new
    @personnel_rating = PersonnelRating.new
  end

  # GET /personnel_ratings/1/edit
  def edit
  end

  def feedback 
    @personnel_ratings = PersonnelRating.all
  end

  # POST /personnel_ratings
  # POST /personnel_ratings.json
def create
    @personnel_rating = PersonnelRating.new(personnel_rating_params)
    
    #Modal Page respond Format
    respond_to do |format|
      #Calculating Rating Logic
      if @personnel_rating.save
        @rates = @personnel_rating

        @rate_total = (@rates.nurse_rate.to_i + @rates.doctor_rate.to_i + @rates.receptionist_rate.to_i + @rates.lab_rate.to_i + @rates.staff_rate.to_i + @rates.pharmacist_rate.to_i + @rates.cashier_rate.to_i)*4  
        @average_rate = (@rate_total.to_f/25).to_f;

        if @average_rate.to_f < 1.50
          # runs if `final rating` is NOT greater than 1.50
          @final_rating = @average_rate.floor 
        elsif@average_rate.to_f >= 1.50
          # runs if `number` is greater 1.50
          @final_rating = @average_rate.ceil; 
        end
        
        format.js {render 'personnel_ratings/create'}
        format.html { redirect_to @personnel_rating, notice: 'Personnel rating was successfully created.' }
        format.json { render :show, status: :created, location: @personnel_rating }
      else
        format.html { render :new }
        format.json { render json: @personnel_rating.errors, status: :unprocessable_entity }
      end
    end
  end
    


  # PATCH/PUT /personnel_ratings/1
  # PATCH/PUT /personnel_ratings/1.json
  def update
    respond_to do |format|
      if @personnel_rating.update(personnel_rating_params)
        format.html { redirect_to @personnel_rating, notice: 'Personnel rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @personnel_rating }
      else
        format.html { render :edit }
        format.json { render json: @personnel_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnel_ratings/1
  # DELETE /personnel_ratings/1.json
  def destroy
    @personnel_rating.destroy
    respond_to do |format|
      format.html { redirect_to personnel_ratings_url, notice: 'Personnel rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel_rating
      @personnel_rating = PersonnelRating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personnel_rating_params
      params.require(:personnel_rating).permit(:nurse_rate, :receptionist_rate, :pharmacist_rate, :doctor_rate, :lab_rate, :cashier_rate, :staff_rate, :comments, :score_emojis)
    end
end
