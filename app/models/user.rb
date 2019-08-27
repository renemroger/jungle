class User < ActiveRecord::Base
  has_secure_password

  auto_strip_attributes :name, squish: true
  auto_strip_attributes :email, squish: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true



  def self.authenticate_with_credentials(email, password)

    @user = User.new(:name => 'max', :email =>email,:password => password, :password_confirmation => password)
    if @user.save
      return @user
    else
      return nil
    end

  end
end
