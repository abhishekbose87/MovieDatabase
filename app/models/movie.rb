class Movie < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true

	validates_presence_of :description, :language, :cast

	has_many :comments
	# has_many :users, through: :comments

	has_many :votes 
	# has_many :users, through: :votes

	has_and_belongs_to_many :categories

end
