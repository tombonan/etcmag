class Author < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged
	has_many :blogs
	has_many :articles

	#validations
	
end
