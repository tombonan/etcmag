class Gallery < ActiveRecord::Base
  belongs_to :issue
  belongs_to :author

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :gallery_attachments, :dependent => :destroy
  accepts_nested_attributes_for :gallery_attachments
end
