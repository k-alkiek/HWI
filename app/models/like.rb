class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :review
	validates :post_id , presence = true
	validates :user_id , presence = true
end
