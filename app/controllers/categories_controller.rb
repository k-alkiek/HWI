class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    
    respond_with(@category)
  end

  def new
    if current_user.role == 1
    @category = Category.new
    respond_with(@category)
    else
      redirect_to categories_path, notice: "You cannot do this"
    end
  end

  def edit
    if current_user.role == 1
    else
      redirect_to categories_path, notice: "You cannot do this"
    end
  end

  def create
    if current_user.role == 1
      @category = Category.new(category_params)
      @category.save
      respond_with(@category)
    else
      redirect_to categories_path, notice: "You cannot do this"
    end
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

 def destroy
    if current_user.role == 1
      @category.destroy
      respond_with(@category)
    else
       redirect_to categories_path, notice: "You cannot do this"
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
