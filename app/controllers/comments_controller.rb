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
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @review, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js #create.js.erb
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:review_id, :body, :user_id)
    end
end
