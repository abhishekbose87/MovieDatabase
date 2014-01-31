require 'spec_helper'

describe CommentsController do

before do
	c = Category.create(desc: "Horror")
	@movie = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)
	@user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password")	
end

render_views
	
	context "#new" do
		it "renders a new comment page for creating comments" do
			get :new, movie_id: @movie 
			expect(response).to render_template("new")
		end
	end

	context "#index" do

		before do
			@comment = Comment.create(desc: "Nice action sequences", movie: @movie, user: @user)
		end

		it "displays comments for a specific movie" do
			get :index, movie_id: @movie
			expect(assigns[:comments]).to eq [@comment]
		end

	end

	context "#create" do
		
		context "with description" do

			before do
				# p @movie
				# @comment = Comment.new(desc: "Nice action sequences", movie: @movie)
				# p @comment
				post :create, movie_id: @movie, comment: { desc: "Nice action sequences" } 
			end

			it "creates a comment for specific movie" do 
				expect(@movie.comments.count).to eq 1
			end
			it "redirects to specific movie page" do
				expect(response).to redirect_to @movie
			end

		end

		context "with blank description" do
			
			before do
				@comment = Comment.new(desc: "", movie: @movie)
				# post :create, movie_id: @movie, comment: { desc: "" } 
				post :create, { comment: @comment.attributes, movie_id: @movie }
			end

			it "does not create a comment for specific movie" do
				# p @movie
				# p @comment
				expect(@movie.comments.count).to eq 0
			end
			it "redirects to new comment for specific movie page" do
				expect(response).to redirect_to new_movie_comment_path(@movie)
			end
		end
	
	end

	context "#edit" do

		before do
			@comment = Comment.create(desc: "Nice action sequences", movie: @movie, user: @user)
		end

		it "renders a edit comment page" do
			get :edit, { movie_id: @movie ,id: @comment }
			expect(response).to render_template("edit")
		end
	
	end

	context "#update" do
		before do
			@comment = Comment.create(desc:"Got some nice action sequences", movie: @movie, user: @user)
		end

		context "with description" do
			before do
				put :update, movie_id: @movie, id: @comment, comment: { desc: "Nice acting", movie: @movie }
			end
			it "updates a comment for specific movie" do
				expect(@movie.comments.first.desc).to eq "Nice acting"
			end
			it "redirects to specific movie page" do
				expect(response).to redirect_to(@movie)
			end
		end

		context "with blank description" do
			before do
				put :update, movie_id: @movie, id: @comment, comment: { desc: "", movie: @movie }
			end
			it "updates no comment" do
				expect(@movie.comments.first.desc).to eq "Got some nice action sequences"
			end
			it "redirects to edit comment page" do
				expect(response).to redirect_to(edit_movie_comment_path(@movie,@comment))
			end
		end
				
	end

	context "#destroy" do
		
		before do
			@comment = Comment.create(desc:"Got some nice action sequences", movie: @movie, user: @user)
			delete :destroy, movie_id: @movie, id: @comment
		end
			
		
		
		it "makes count zero after deletion" do
			expect(@movie.comments.count).to eq 0
		end

		it "redirects to specific movie page" do
			expect(response).to redirect_to(@movie)
		end

	end

end