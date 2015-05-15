class Admin::SportsController < AdminController
  before_action :set_admin_sport, only: [:show, :edit, :update, :destroy]

  # GET /admin/sports
  # GET /admin/sports.json
  def index
    @admin_sports = Admin::Sport.all
  end

  # GET /admin/sports/1
  # GET /admin/sports/1.json
  def show
  end

  # GET /admin/sports/new
  def new
    @admin_sport = Admin::Sport.new
  end

  # GET /admin/sports/1/edit
  def edit
  end

  # POST /admin/sports
  # POST /admin/sports.json
  def create
    @admin_sport = Admin::Sport.new(admin_sport_params)

    respond_to do |format|
      if @admin_sport.save
        format.html { redirect_to @admin_sport, notice: 'Sport was successfully created.' }
        format.json { render :show, status: :created, location: @admin_sport }
      else
        format.html { render :new }
        format.json { render json: @admin_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sports/1
  # PATCH/PUT /admin/sports/1.json
  def update
    respond_to do |format|
      if @admin_sport.update(admin_sport_params)
        format.html { redirect_to @admin_sport, notice: 'Sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_sport }
      else
        format.html { render :edit }
        format.json { render json: @admin_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sports/1
  # DELETE /admin/sports/1.json
  def destroy
    @admin_sport.destroy
    respond_to do |format|
      format.html { redirect_to admin_sports_url, notice: 'Sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_sport
      @admin_sport = Admin::Sport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_sport_params
      params.require(:admin_sport).permit(:name)
    end
end
