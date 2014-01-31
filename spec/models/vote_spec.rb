require 'spec_helper'

describe Vote do
  
  context "validations" do

  	# it "value is mandatory" do
  	# 	vote = Vote.new
  	# 	expect(vote.valid?).to be_false
  	# end

   #  it "user is mandatory" do
   #    vote = Vote.new(value: "up") 
   #    expect(vote).not_to be_valid
   #  end

  	# it "value is either up or down" do
  	# 	vote = Vote.new(value: "asdasdasd")
  	# 	expect(vote.valid?).to be_false
  	# end

    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:movie) }
    it { should ensure_inclusion_of(:value).in_array(%w(up down)) }

  end

  context "associations" do

    it { should belong_to(:user) }
    it { should belong_to(:movie) }

  end

  context "#functions" do

    context "maintain votes for movie" do

      before(:each) do
        c = Category.create(desc:"Horror")
        @u = User.create(name:"Abhishek",username:"example",email:"abc@xyz.com",password:"password")
        @m = Movie.create(title:"Dhoom2", description:"asdasd", cast: "asdasd", language:"asdasd", category_ids: c.id)
      end

      it "increments upvotes for particular movie" do
        vote = Vote.new(value:"up",user: @u, movie: @m)
        expect{vote.save}.to change{@m.upvotes}.by(1)
      end

      it "decrements downvotes for particular movie" do
        vote = Vote.new(value:"down",user: @u, movie: @m)
        expect{vote.save}.to change{@m.downvotes}.by(1)
      end    

    end

  end

end
