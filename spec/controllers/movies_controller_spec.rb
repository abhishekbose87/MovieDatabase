require 'spec_helper'

describe MoviesController do

	describe "#index" do
	
		it "assigns to @movies" do
			c = Category.create(desc: "Horror")
			m = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)
			get :index
			expect(assigns[:movies]).to eq([m])
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

	end

	describe "#new" do
		it "renders the new template" do
			user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password",admin: true)	
			sign_in user
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "#edit" do
		render_views

		it "renders the edit template" do
			c = Category.create(desc: "Horror")
			m = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)
			user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password",admin: true)	
			sign_in user
			get :edit, id: 1
			expect(response).to render_template("edit")
		end
	end

	describe "#create" do

		before do
			user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password",admin: true)	
			sign_in user
		end

		context "with valid data" do

			before do
				c = Category.create(desc: "Horror")
				@movie = Movie.new(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)			
				@movie_attributes = @movie.attributes.keep_if { 
					|key,value| ["title","description","cast","language"].include? key.to_s
					}
				# puts @movie_attributes
			end

			it "creates a movie object" do
				expect{ 
					post :create, movie: @movie_attributes
				}.to change{Movie.count}.by(1)			
			end
			
			it "redirects to show page for created object" do
				post :create, movie: @movie_attributes
				expect(response).to redirect_to Movie.last
			end
		
		end

		context "with invalid attributes" do
		
			it "redirects to new page if object not saved" do
				post :create, movie: { description:"asdasd", cast: "asdasd", language:"asdasd"} 				
				expect(response).to redirect_to(new_movie_path)
			end
		
			it "does not create a movie object" do
				expect{ 
					post :create, movie: {title:"", description:"asdasd", cast: "asdasd", language:"asdasd"} 
				}.to change(Movie,:count).by(0)			
			end
		
		end
		
	end

	describe "#show" do
		
		before do
			c = Category.create(desc: "Horror")
			@movie = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)				
			@user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password")	
			sign_in @user
		end

		it "shows a movie object for particular id" do
			get :show, id: 1
			expect(response).to render_template("show")
		end

		it "assigns specific movie object" do
			get :show, id: 1
			expect(assigns[:movie]).to eq @movie
		end
	
	end

	describe "#update" do

		before do
			c = Category.create(desc: "Horror")
			@movie = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)				
			user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password",admin: true)	
			sign_in user
		end

		context "with valid attributes" do
			
			it "updates a movie object" do
				put :update, {id: @movie, movie: {title:"Dhoom2", description:"action", cast: "asdasd", language:"asdasd"} }
				@movie.reload
				expect(@movie.description).to eq "action"			
			end

			it "redirects to show page for updated object" do
				put :update, id:@movie, movie: {title:"Dhoom2", description:"action", cast: "asdasd", language:"asdasd"} 
				expect(response).to redirect_to(@movie)
			end		

		end

		context "with invalid attributes" do 

			it "does not update a movie object" do
				put :update, id:@movie, movie: {title:"", cast: "asdasd", language:"asdasd"} 
				@movie.reload
				expect(@movie.description).to eq "asdasd"			
			end
			
			it "redirects to edit page if object not saved" do
				put :update, id:@movie, movie: {title:"", cast: "asdasd", language:"asdasd"} 
				expect(response).to redirect_to(edit_movie_path)
			end

		end	

		
	end

	describe "#destroy" do

		before do
			c = Category.create(desc: "Horror")
			@movie = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)
			user = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password",admin: true)	
			sign_in user
		end

		it "destroys a movie object" do
			expect{
				delete :destroy, id: @movie
			}.to change(Movie,:count).by(-1)
		end

		it "redirects to index page" do
			delete :destroy, id: @movie
			expect(response).to redirect_to movies_path
		end

	end

end
