class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :review
	validates_presence_of :body
end
