class CommentsController < ApplicationController

	before_filter :authenticate_user!, :load_movie

	def new
		@comment = Comment.new
	end

	def index
		@comments = @movie.comments
	end

	def edit
		@comment = @movie.comments.find(params["id"])
	end

	def destroy
		@comment = @movie.comments.find(params["id"])

		if @comment.destroy
			redirect_to @movie, notice: "Comment was successfully deleted"
		else
			redirect_to @movie, notice: "Errors are #{@comment.errors.full_messages}"
		end

	end

	def update
		@comment = @movie.comments.find(params["id"])
		# @comment = Comment.new(desc: params["comment"]["desc"], movie: @movie)
		# @comment = Comment.new(comment_params)
		
		if @comment.update_attributes(desc: params["comment"]["desc"])
		  redirect_to @movie, notice: 'Comment was successfully created.'
		else 
			# puts "Did not save"
		  redirect_to edit_movie_comment_path(@movie,@comment), notice: "Errors are #{@comment.errors.full_messages} "
	  end
	end

	def create
		# puts "Movie = "
		# p @movie 
		# id = params["comment"]["movie_id"]
		# p id
		puts "############################"
		puts "In create action"
		p params
		@comment = Comment.new(desc: params["comment"]["desc"], movie: @movie, user: current_user)
		# @comment = Comment.new(comment_params)
		
		if @comment.save
		  redirect_to @movie, notice: 'Comment was successfully created.'
		else 
			# puts "Did not save"
		  redirect_to new_movie_comment_path(@movie), notice: "Errors are #{@comment.errors.full_messages} "
	  end

	end

	private
		def comment_params
			params.require(:comment).permit(:desc)
		end

		def load_movie
			@movie = Movie.find(params["movie_id"])
		end
end
