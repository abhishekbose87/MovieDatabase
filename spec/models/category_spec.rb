require 'spec_helper'

describe Category do
  
  context "validations" do

  	# it "desc is mandatory" do
  	# 	category = Category.new
  	# 	expect(category.valid?).to be_false
  	# end

    it { should validate_presence_of(:desc) }

  	# it "desc is either up or down" do
  		# category = Category.new(desc: "asdasdasd")
  		# expect(category.valid?).to be_false
  	# end

  end

  context "associations" do
    it { should have_and_belong_to_many(:movies) }
  end

end
