class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :issue
	belongs_to :author

	has_many :article_attachments, :dependent => :destroy
   	accepts_nested_attributes_for :article_attachments
end
