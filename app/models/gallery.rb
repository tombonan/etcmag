class Gallery < ActiveRecord::Base
  belongs_to :issue

  extend FriendlyId
  friendly_id :title, use: :slugged
end
