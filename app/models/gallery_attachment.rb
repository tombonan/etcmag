class GalleryAttachment < ActiveRecord::Base
	mount_uploader :avatar, MultipleGalleryUploader
   	belongs_to :gallery
end
