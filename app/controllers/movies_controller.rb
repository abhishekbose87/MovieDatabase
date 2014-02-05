class MoviesController < ApplicationController

	before_action :check_admin_login, except: [:index, :show]

	def index
		@movies = Movie.all
	end

	def show 
		# puts "I am in the show method"
		@movie = Movie.find(params[:id])
		@comments = @movie.comments
		upvotes = @movie.votes.where(value:"up")
		@usernames = []
		upvotes.each do |v|
    	@usernames << v.user.name
    end

    @votes_from_current_user = Vote.where(movie_id: @movie, user_id: current_user)
    p @votes_from_current_user.count
    p @votes_from_current_user
	end

	def new
		@movie = Movie.new
	end

	def create
		# puts "##################Params = "
		# p params
	  @movie = Movie.new(movie_params)
		if @movie.save
		  redirect_to @movie, notice: 'Movie was successfully created.'
		else 
			# p "----------------------------"
			# p @movie.errors.full_messages
		  redirect_to new_movie_path, notice: "Errors are #{@movie.errors.full_messages} "
	  end
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update_attributes(movie_params)
		  redirect_to @movie, notice: 'Movie was successfully updated.'
		else 
		  redirect_to (edit_movie_path), notice: "Errors are #{@movie.errors.full_messages} "
	  end
	end

	def destroy
		@movie = Movie.find(params[:id])
		# puts "I am in the destroy action"
		if @movie.destroy
			redirect_to movies_path, notice: "Movie was successfully destroyed"
		else
			redirect_to @movie, notice: "Errors are #{@movie.errors.full_messages}"
		end
	end

	def edit
		 @movie = Movie.find(params["id"])
	end 

	def upvote
		@movie = Movie.find(params["id"])
		@vote = Vote.new(value: "up",movie: @movie, user: current_user)
		@vote.save!
		redirect_to @movie, notice: "Your upvote has been registered"
	end

	def downvote
		@movie = Movie.find(params["id"])
		@vote = Vote.new(value: "down",movie: @movie, user: current_user)
		@vote.save!
		redirect_to @movie, notice: "Your downvote has been registered"
	end

	private
		def movie_params
			params.require(:movie).permit(:title, :description, :cast, :language )
		end 

		def check_admin_login
			redirect_to new_user_session_path, notice: "You have been redirected because you have no access" unless current_user
			redirect_to movies_path, notice: "You have been redirected because you have no access" unless current_user.try(:admin?)				
		end

end
