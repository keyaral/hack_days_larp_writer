class LarpsController < ApplicationController
  before_action :set_larp, only: [:show, :edit, :update, :destroy]

  # GET /larps
  # GET /larps.json
  def index
    @larps = Larp.all
  end

  # GET /larps/1
  # GET /larps/1.json
  def show
  end

  # GET /larps/new
  def new
    @larp = Larp.new
  end

  # GET /larps/1/edit
  def edit
  end

  # POST /larps
  # POST /larps.json
  def create
    @larp = Larp.new(larp_params)

    respond_to do |format|
      if @larp.save
        format.html { redirect_to @larp, notice: 'Larp was successfully created.' }
        format.json { render :show, status: :created, location: @larp }
      else
        format.html { render :new }
        format.json { render json: @larp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /larps/1
  # PATCH/PUT /larps/1.json
  def update
    respond_to do |format|
      if @larp.update(larp_params)
        format.html { redirect_to @larp, notice: 'Larp was successfully updated.' }
        format.json { render :show, status: :ok, location: @larp }
      else
        format.html { render :edit }
        format.json { render json: @larp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /larps/1
  # DELETE /larps/1.json
  def destroy
    @larp.destroy
    respond_to do |format|
      format.html { redirect_to larps_url, notice: 'Larp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_larp
      @larp = Larp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def larp_params
      params.fetch(:larp, {})
    end
end
