class Post < ApplicationResource
	attr_accessor :category_id
	has_many :tags
end
