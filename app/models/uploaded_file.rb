class UploadedFile < ActiveRecord::Base
  belongs_to :user
  has_attachment :storage => :file_system

  named_scope :default_order, :order => 'created_at DESC'

  cattr_reader :per_page
  @@per_page = 20
end
