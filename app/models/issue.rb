class Issue < ActiveRecord::Base
	#Friendly ID
	extend FriendlyId
	friendly_id :name, use: :slugged

	#Carrierwave
	mount_uploader :image, ImageUploader

	has_many :articles, :dependent => :destroy
	has_many :galleries, :dependent => :destroy
	
end
