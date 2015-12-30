class Blog < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	belongs_to :author

	mount_uploader :image, BlogimageUploader
	
end
