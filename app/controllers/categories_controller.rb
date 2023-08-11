class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.where(user_id: current_user.id).includes([:items]).order('created_at DESC')
  end

  # GET /categories/1 or /categories/1.json
  def show
    if current_user.id.to_i == Category.find(params[:id]).user_id.to_i
      @category = Category.find(params[:id])
    else
      redirect_to categories_path
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)
    respond_to do |_format|
      if @category.save
        redirect_to custom_categories_path, notice: 'Category was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
