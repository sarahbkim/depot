class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true # check that these exist 
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)$}i,
		multiline: true,
		message: 'must be a URL for JPG or PNG image.'
	}
end
