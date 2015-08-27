class Review < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :item
	belongs_to :user
	has_many :likes

	validates_presence_of :title
end
