class CommentsController < ActionController::Base
  def edit
    @user = User.find_by(id: session[:user_id])
    @comment = Comment.find(params[:id])
    @post = Post.where(id: @comment.post_id).first
    @comments = Comment.where(post_id: @post.id)
    if @user.nil? || @user.id != @comment.user_id
      redirect_to('/')
    end
  end

  def update
    Comment.find(params[:id]).update(comment_params)
    redirect_to('/')
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to('/')
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :comment_text, :user_name, :date)
  end 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

