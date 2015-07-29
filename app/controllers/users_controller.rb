class UsersController < ActionController::Base

  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
        redirect_to('/')
    end
  end
  
  def update
    User.find(params[:id]).update(user_params)
    redirect_to('/')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.clear
    redirect_to('/')
  end

  def new_user
     @user = User.find_by(id: session[:user_id])
    if !@user.nil?
      redirect_to('/')
    end
  end

 def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name
      @mainFeed = Post.all
      @feed = @mainFeed.order(id: :desc)
      @comments = Comment.all
      redirect_to('/')
    else
      render'new_user'
    end
  end

  # def confirmaiton_email
  #   puts "This will trigger an email."
  # end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password) #:password_confirmation)
  end 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
