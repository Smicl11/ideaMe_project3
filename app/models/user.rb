class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, :on => :create

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
