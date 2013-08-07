class StartupsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_startup, only: [:show, :edit, :update, :destroy]

  # GET /startups
  # GET /startups.json
  def index
    @startups = Startup.all
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    redirect_to startups_path
  end

  # GET /startups/new
  def new
    @startup = Startup.new
  end

  # GET /startups/1/edit
  def edit
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = Startup.new(startup_params)
    @startup.user = current_user

    respond_to do |format|
      if @startup.save
        format.html { redirect_to startups_path, notice: 'Startup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @startup }
      else
        format.html { render action: 'new' }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startups/1
  # PATCH/PUT /startups/1.json
  def update
    respond_to do |format|
      if @startup.update(startup_params)
        format.html { redirect_to edit_startup_path(@startup), notice: 'Startup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup.destroy
    respond_to do |format|
      format.html { redirect_to startups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_startup
      begin
        @startup = current_user.startups.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        respond_to do |format|
          format.html { redirect_to startups_path }
          format.json { head :forbidden }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def startup_params
      params.require(:startup).permit(:name, :pitch, :website, :product, :market_list, :user_id, :image)
    end
end
