class PostsController < ApplicationController

def show
@post = Post.find(params[:id])
@comment = Comment.new
end


# def create
#   raise
#   @comment = Comment.new(comment_params)
#   @post = Post.find(params[:id])
#   @comment.post_id = @post.id
#   @comment.user_id = current_user.id
#   if @comment.save
#     redirect_to posts_path
#   else
#     render :new, status: :unprocessable_entity
#   end
# end




private

def comment_params
  params.require(:comment).permit(:content, :post_id, :current_user_id)
end



end
