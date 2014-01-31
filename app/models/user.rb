class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# validates_presence_of :username, :name
	# validates_uniqueness_of :username

	has_many :votes
	# has_many :movies, through: :votes

	has_many :comments
	# has_many :movies, through: :comments

end
