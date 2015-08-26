class Item < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :category
end
