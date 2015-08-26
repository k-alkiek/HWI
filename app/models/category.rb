class Category < ActiveRecord::Base
	has_many :items, dependent: :destroy
end
