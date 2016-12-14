class User < ApplicationRecord
	has_many :posts
	has_many :comments
	has_many :userfriends
	has_many :friends, :through => :userfriends
end
