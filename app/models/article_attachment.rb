class ArticleAttachment < ActiveRecord::Base
	mount_uploader :avatar, MutlipleArticleUploaderUploader
   	belongs_to :article

end
