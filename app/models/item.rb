class Item < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :category
  def average_rating
    if self.reviews.size > 0
       sprintf('%.2f', self.reviews.average(:rating)) 
    else
        'Not Rated'
    end
end
  def top_rating
    if self.reviews.size > 0
       return self.reviews.average(:rating)
    else
        return 1
    end
end
 def self.search(query)
    where("name like ?", "%#{query}%") 
  end
  def self.top(query)
   text= Category.where(name: query).first
  where("category_id like ?", "%#{text.id}%")
end
end

