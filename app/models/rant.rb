class Rant < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :description, presence: true
end
