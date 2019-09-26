class CharactersController < ApplicationController
  before_action :set_character_and_larp, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @larp = Larp.find(params['larp_id'])
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @larp = Larp.find(params['larp_id'])
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    @larp = Larp.find(params['larp_id'])
    @character.larp = @larp

    if @character.save
      redirect_to larp_characters_path(@larp), notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      redirect_to larp_characters_path(@larp), notice: 'Character was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    redirect_to larps_characters_path(@larp), notice: 'Character was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character_and_larp
    @character = Character.find(params[:id])
    @larp = Larp.find(params['larp_id'])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_params
    params.fetch(:character, {}).permit(:name, :short_description)
  end
end
