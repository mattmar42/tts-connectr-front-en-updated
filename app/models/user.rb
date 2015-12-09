class User < ActiveRecord::Base
	has_many :relationships
	has_many :friends, through: :relationships

	has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_relationships, :source => :user

	has_many :subscriptions
	has_many :interests, through: :subscriptions

	validates :name, presence: true
	
	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end

	def largeimage
		"http://graph.facebook.com/#{self.uid}/picture?type=large"
	end

	def normalimage
		"http://graph.facebook.com/#{self.uid}/picture?type=normal"
	end
end
