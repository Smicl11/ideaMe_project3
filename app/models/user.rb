class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
