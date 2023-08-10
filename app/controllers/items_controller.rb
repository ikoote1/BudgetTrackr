class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items/new
  def new
    if current_user.id.to_i == Category.find(params[:category_id]).user_id.to_i
      @item = Item.new
      @categories = Category.where(user_id: current_user.id)
    else
      redirect_to '/'
    end
  end

  # POST /items or /items.json
  def create
    @item = Item.new(name: params[:item][:name], amount: params[:item][:amount], user_id: current_user.id)
    if params[:item][:selected_ids]
      if save_item_and_categorization
        redirect_to categories_path(params[:category_id])
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to Categorizations_path(params[:category_id]), alert: 'please select at least one checkbox.'
    end
  end

  private

  def save_item_and_categorization
    ActiveRecord::Base.transaction do
      @item.save
      params[:item][:selected_ids].each do |id|
        Categorization.create(item_id: @item.id, category_id: id.to_i)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :amount, selected_id: [])
    end
end
