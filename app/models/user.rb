class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def self.seed_admin!
    create!(email: 'foo@bar.com', password: 'P@ssw0rd')
  end
end
