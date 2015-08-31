class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end
  def start
  end
  def home
  end
  
  def about
  end
  def show
    respond_with(@item)
  end
  def search
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.order("created_at DESC")
    end
  end
  def start2
  end
 def top
    if params[:top]
      @items = Item.top(params[:top]).order("created_at DESC")
    else
      @items = Item.order("created_at DESC")
  end
  @local_items = @items.sort_by(&:top_rating).reverse
  end

  def new
    if current_user.role == 1 || current_user.reviews.size >= 10
    @item = Item.new
    respond_with(@item)
    else
      needed = current_user.reviews.size - 10
      redirect_to items_path, notice: "You must have #{needed} more reviews."
    end
  end

  def edit
    if current_user.role == 1 
    else
      redirect_to items_path, notice: "You cannot do this. Only Admins are allowed to edit items."
    end
  end

    def NReview
    @review =Review.new
    respond_with(@review)
  end

  def create
    if current_user.role == 1
      @item = Item.new(item_params)
      @item.save
      respond_with(@item)
    else
      redirect_to items_path, notice: "You cannot do this"
    end
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    if current_user.role == 1
      @item.destroy
      respond_with(@item)
    else
       redirect_to items_path, notice: "You cannot do this"
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end


    def item_params
      params.require(:item).permit(:category_id, :name, :description)
    end
end
