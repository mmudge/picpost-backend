class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :authenticate_user!

  def index
    comments = Comment.all
    render json: comments
  end


  def show
    render json: @comment
  end


  def create
    post = Post.find(params[:post_id])
    # comment = Comment.new(comment_params)
    post.comments.build(comment_params)
    
    if post.comments.save!
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

    def set_comment
      @comment = comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:remark, :user_id)
    end
end
