class WorldsController < ApplicationController
  before_action :authorize
  before_action :set_world, only: [:show, :edit, :update, :destroy]

  # GET /worlds
  # GET /worlds.json
  def index
    @worlds = current_user.worlds
  end

  # GET /worlds/1
  # GET /worlds/1.json
  def show
  end

  # GET /worlds/new
  def new
    @world = current_user.worlds.new
  end

  # GET /worlds/1/edit
  def edit
  end

  # POST /worlds
  # POST /worlds.json
  def create
    @world = current_user.worlds.new(world_params)

    respond_to do |format|
      if @world.save
        format.html { redirect_to @world, notice: 'World was successfully created.' }
        format.json { render :show, status: :created, location: @world }
      else
        format.html { render :new }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worlds/1
  # PATCH/PUT /worlds/1.json
  def update
    respond_to do |format|
      if @world.update(world_params)
        format.html { redirect_to @world, notice: 'World was successfully updated.' }
        format.json { render :show, status: :ok, location: @world }
      else
        format.html { render :edit }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worlds/1
  # DELETE /worlds/1.json
  def destroy
    @world.destroy
    respond_to do |format|
      format.html { redirect_to worlds_url, notice: 'World was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = current_user.worlds.find(params[:id]);
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def world_params
      params.require(:world).permit(:name)
    end
end
