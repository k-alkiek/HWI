class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
     
    if current_user.role == 1 || current_user.role == 2
      
    else
      current_user.comments.find(params[:id])
    end
  end

  def create
     @review = Review.find(params[:review_id])
    @comment = @review.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @review, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
     
    @comment.update(comment_params)
    redirect_to @review
  end

  def destroy
    if current_user.role == 1 || current_user.role == 2
      @comment.destroy
      redirect_to @review
    else
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to @review
    end
  end

  private
    def set_comment
      @review = Review.find(params[:review_id])
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:review_id, :body, :user_id)
    end
end
