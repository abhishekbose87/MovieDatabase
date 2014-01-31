class Vote < ActiveRecord::Base

	validates :value, presence:true,
									 inclusion: { in: %w(up down), message: "is not a valid type"}

	validates_presence_of :user, :movie						

	belongs_to :user
	belongs_to :movie									  

	after_create :increment_count
	# before_destroy :decrement_count
	# after_create { @@count += 1 }

	# attr_accessor :total_count

	# def initialize(options=nil)
	# 	@total_count = 0
	# 	puts "In initialize"
	# end

	def increment_count
		m = self.movie
		m.upvotes += 1  if self.value == "up"
		m.downvotes +=1 if self.value == "down"
		m.save!
	end

end
