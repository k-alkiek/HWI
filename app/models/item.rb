class Item < ActiveRecord::Base
	has_many :reviews
	belongs_to :category , dependent: :destroy
end
