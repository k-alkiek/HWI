class Item < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :category
	  def average_rating
    if self.reviews.size > 0
       sprintf('%.2f', self.reviews.average(:rating)) 
    else
        'undefined'
    end
end
 def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
