class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end


  def latest
    @reviews = Review.all.reverse.first(10)
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
    if current_user.role == 1

    else
      current_user.reviews.find(params[:id])
    end
  end

  def create
    @item= Item.find(params[:item_id])
    @review= @item.reviews.create(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @item, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review}
        format.js
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    if current_user.role == 1
      @review.destroy
      redirect_to "/items/#{@review.item_id}"
    else
      @review = current_user.reviews.find(params[:id])
      @review.destroy
      redirect_to "/items/#{@review.item_id}"
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :body, :rating, :user_id, :item_id)
    end
end
