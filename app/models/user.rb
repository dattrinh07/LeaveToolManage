class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable



  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  has_many :requests

  # enum role: { Hr: "0", ProjectManager: "1", Employee: "3" }


  before_validation :generated_password, on: :create
  def generated_password 
  	password = Devise.friendly_token.first(8)
  	self.password = "abc123@@@" 
  end

end
