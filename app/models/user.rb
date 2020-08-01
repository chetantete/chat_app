class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_and_belongs_to_many :groups

	def gravatar_url
	  gravatar_id = Digest::MD5::hexdigest(email).downcase
	  "https://gravatar.com/avatar/#{gravatar_id}.png"
	end

end
