class User < ApplicationRecord
	validates :email, presence: { message: 'must be present' }
	validates :email, uniqueness: { message: "is alread taken" }
	has_many :posts
	has_many :comments
	has_many :userfriends
	has_many :friends, :through => :userfriends
end
