class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
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
  end

  def create
    @review = Review.new(review_params)
    @review.save
    respond_with(@review)
  
  # REVIEW FORM CODE
  #  @review = Review.create(review_params)
  #  
  #  
  #   respond_to do |format|
  #    if @review.save
  #      format.html { redirect_to @item, notice: 'Review was successfully created.' }
  #      format.json { render :show, status: :created, location: @review }
  #      format.js #create.js.erb
  #    else
  #      format.html { render :new }
  #      format.json { render json: @review.errors, status: :unprocessable_entity }
  #    end
  #  end
   end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :body, :rating, :user_id, :item_id)
    end
end
