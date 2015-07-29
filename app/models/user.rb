class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :user_name, :presence => true
  validates :email, :presence => true
                    # :uniqueness => true
  validates :password, :presence => true,
                       # :confirmation => true,
                       # :length => {:within => 6..40},
                       :on => :create
  after_save :confirmaiton_email

  def confirmaiton_email
    m = Mandrill::API.new"API KEY"
    @user = User.last
    message = {
     :subject=> "Welcome to the blog",
     :from_name=> "Chris Duane",
     :text=>"Welcome to blog.",
     :to=>[{:email=> "#{@user[:email]}", :name=> "#{@user[:user_name]}"}],
     :html=>"<html><h1>Welcome to blog. <strong>This gets sent when you click sign up!</strong></h1></html>",
     :from_email=>"cduane21@gmail.com"
    }
  end
end
