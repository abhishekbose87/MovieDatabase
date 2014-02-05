require 'spec_helper'

describe User do
  context "validations" do
  	
  	# before(:each) do
  	# 	@user = User.new(username:"abhishekbose", email:"example@abc.com", password:"example", name:"Abhishek")
  	# end

  	# it "username is mandatory" do
  	# 	@user.username = nil
  	# 	expect(@user.valid?).to be_false
  	# end

  	# it "email is mandatory" do
  	# 	@user.email = nil
  	# 	expect(@user.valid?).to be_false
  	# end

  	# it "password is mandatory" do
  	# 	@user.password = nil
  	# 	expect(@user.valid?).to be_false
  	# end

  	# it "name is mandatory" do
  	# 	@user.name = nil
  	# 	expect(@user.valid?).to be_false
  	# end

  	# it "username is unique" do
  	# 	user2 = User.create(username:"abhishekbose", email:"example2@abc.com", password:"example2", name:"Abhishek2")
  	# 	expect(@user.valid?).to be_false
  	# end

  	# it "email is unique" do
  	# 	user2 = User.create(username:"abhishekbose2", email:"example@abc.com", password:"example2", name:"Abhishek2")
  	# 	expect(@user.valid?).to be_false
  	# end

    # it { should validate_presence_of(:username) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }
    # it { should validate_uniqueness_of(:username)}

  end

  context "associations" do

    it { should have_many (:comments) }
    it { should have_many (:votes) }
    
  end
end
