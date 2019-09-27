class ItemsController < ApplicationController
  before_action :set_item_and_larp, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @larp = Larp.find(params['larp_id'])
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @larp = Larp.find(params['larp_id'])
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @larp = Larp.find(params['larp_id'])
    @item.larp = @larp
    if @item.save
      redirect_to larp_items_path(@larp), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      redirect_to larp_items_path(@larp), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_and_larp
      @item = Item.find(params[:id])
      @larp = Larp.find(params['larp_id'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.fetch(:item, {}).permit(:name, :short_description)
    end
end
