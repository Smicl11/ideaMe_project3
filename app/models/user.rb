class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, :on => :create
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
