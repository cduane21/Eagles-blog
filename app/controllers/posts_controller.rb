class PostsController < ActionController::Base
  
  def post
      @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to('/')
    else
      @user_post = Post.where(user_id: @user.id)
      @reversed_post = @user_post.order(id: :desc)
    end
  end

  def make_post
      @user = User.find_by(id: session[:user_id])
      @post = Post.new()
      @post.post_text = params[:post_text]
      @post.user_id = session[:user_id]
      @post.user_name = session[:user_name]
    if !@post.post_text.blank?
      @post.save
      redirect_to('/')
    else
      flash[:alert] = "Come on' " << @user.user_name << ", don't be a loser. write a real post."
      redirect_to('/post')
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    @post = Post.find(params[:id])
    if @user.nil? || @user.id != @post.user_id
      redirect_to('/')
    end
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @post = Post.find(params[:id])
    @post_text = post_params[:post_text]
    if !@post_text.blank?
      Post.find(params[:id]).update(post_params)
      redirect_to('/post')
    else
      flash[:alert] = @user.user_name << ", if you are going to leave it blank, just delete it."
      redirect_to('/posts/' + @post.id.to_s + '/edit')
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to('/')
  end

  def comment
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id)
  end

  def make_comment
      @post = Post.find(params[:id])
      @comment = Comment.new(params[:comments])
      @comment.comment_text = params[:comment_text]
      @comment.post_id = @post[:id]
      @comment.user_id = session[:user_id]
      @comment.user_name = session[:user_name]
      @comment.save
      redirect_to('/')
  end
  private
  def post_params
    params.require(:post).permit(:user_id, :post_text, :user_name, :date)
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end