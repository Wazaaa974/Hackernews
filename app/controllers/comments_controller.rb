class CommentsController < ApplicationController

  # def new
  #   @comment = Comment.new(comment_params)
  #   @post = Post.find(params[:id])
  # end

  def create
    @comment = Comment.new()
    @comment.content = params[:comment][:content]
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :current_user_id)
  end


end
