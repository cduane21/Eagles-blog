class HomeController < ActionController::Base

  def index
    @user = User.find_by(id: session[:user_id])
    if !session[:user_id].nil?
      flash.notice = @user.user_name + " is logged in."
    end
    @mainFeed = Post.all
    @feed = @mainFeed.order(id: :desc)
    @comments = Comment.all
  end

  def login
    @user = User.where(user_name: params[:user_name]).first
    if !@user.nil? && @user.password == params[:password]
        session[:user_id] = @user.id
        session[:user_name] = @user.user_name
        redirect_to('/')
    else
        redirect_to('/sign_out')
        flash[:notice] = "Oops!"
    end
  end

  def logout
    session.clear
    redirect_to('/sign_out')
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
