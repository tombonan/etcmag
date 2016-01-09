class Blog < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	belongs_to :author

	mount_uploader :image, BlogimageUploader

	#Validations
	validates :title, presence: { message: "Title is required" }
	validates :image, presence: { message: "Please add an image" }
	validates :body, presence: { message: "Body text is required" }
	
end
