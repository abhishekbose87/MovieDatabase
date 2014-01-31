class Comment < ActiveRecord::Base

	validates_presence_of :desc, :movie, :user

	belongs_to :user
	belongs_to :movie

end
