class Comment < ActiveRecord::Base
	belongs_to :user ,dependent: :destroy
	belongs_to :review , dependent: :destroy
end
