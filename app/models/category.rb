class Category < ActiveRecord::Base
	validates :desc, presence: true

	has_and_belongs_to_many :movies
end
