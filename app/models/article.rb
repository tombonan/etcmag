class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :issue
	belongs_to :author

	mount_uploader :image, ArticleimageUploader

end
