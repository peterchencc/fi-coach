class Admin::CoachesController < AdminController
  before_action :set_admin_coach, only: [:show, :edit, :update, :destroy]

  # GET /admin/coaches
  # GET /admin/coaches.json
  def index
    @admin_coaches = Admin::Coach.all
  end

  # GET /admin/coaches/1
  # GET /admin/coaches/1.json
  def show
  end

  # GET /admin/coaches/new
  def new
    @admin_coach = Admin::Coach.new
  end

  # GET /admin/coaches/1/edit
  def edit
  end

  # POST /admin/coaches
  # POST /admin/coaches.json
  def create
    @admin_coach = Admin::Coach.new(admin_coach_params)

    respond_to do |format|
      if @admin_coach.save
        format.html { redirect_to @admin_coach, notice: 'Coach was successfully created.' }
        format.json { render :show, status: :created, location: @admin_coach }
      else
        format.html { render :new }
        format.json { render json: @admin_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/coaches/1
  # PATCH/PUT /admin/coaches/1.json
  def update
    respond_to do |format|
      if @admin_coach.update(admin_coach_params)
        format.html { redirect_to @admin_coach, notice: 'Coach was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_coach }
      else
        format.html { render :edit }
        format.json { render json: @admin_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/coaches/1
  # DELETE /admin/coaches/1.json
  def destroy
    @admin_coach.destroy
    respond_to do |format|
      format.html { redirect_to admin_coaches_url, notice: 'Coach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_coach
      @admin_coach = Admin::Coach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_coach_params
      params.require(:admin_coach).permit(:coach_name)
    end
end
