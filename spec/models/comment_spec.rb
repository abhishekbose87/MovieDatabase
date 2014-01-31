require 'spec_helper'

describe Comment do
  
  context "validations" do
  # 	it "desc is mandatory" do
  # 		comment = Comment.new
  # 		expect(comment.valid?).to be_false
  # 	end
  
    it { should validate_presence_of :desc }
    it { should validate_presence_of :movie }
    it { should validate_presence_of :user }

  end



  context "associations" do

    it { should belong_to(:movie) }
    it { should belong_to(:user) }

  end

end
