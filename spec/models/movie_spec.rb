require 'spec_helper'

describe Movie do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "#attributes" do
  	it { should respond_to(:title, :description, :cast, :release_date, :language, 
                           :upvotes, :downvotes) }
  end

  context "#validations" do

    # before(:each) do
    #   @m1 = Movie.new(title:"Roja", description: "Love story", cast:"Arvind Swamy",
    #                language: "Hindi")
    # end

    # it "title is mandatory" do
    #   @m1.title = nil
    #   expect(@m1.valid?).to eq false
    # end 

    # it "title is unique" do 
    #   m2 = Movie.new(title:"Roja", description: "story", cast:"Arvind",
    #                language: "Hindi")
    #   m2.save
    #   expect(@m1.valid?).to eq false
    # end

    # it "describe is mandatory" do
    #   @m1.description = nil
    #   expect(@m1.valid?).to eq false
    # end

    # it "cast is mandatory" do
    #   @m1.cast = nil
    #   expect(@m1.valid?).to eq false
    # end

    # it "language is mandatory" do
    #   @m1.language = nil
    #   expect(@m1.valid?).to eq false
    # end

    # it "category is mandatory" do
    #   @m1.categories = []
    #   expect(@m1.valid?).to eq false
    # end

    it "initializes upvotes to 0 " do
        c = Category.create(desc: "Horror")
        m = Movie.create(title:"Dhoom2", description:"asdasd", 
            cast: "asdasd", language:"asdasd", category_ids: c.id)
        expect(m.upvotes).to eq 0
    end

    it "initializes downvotes to 0 " do
        c = Category.create(desc: "Horror")
        m = Movie.create(title:"Dhoom2", description:"asdasd", 
            cast: "asdasd", language:"asdasd", category_ids: c.id)
        expect(m.downvotes).to eq 0
    end
  
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:cast) }
    it { should validate_presence_of(:language) }
    it { should validate_uniqueness_of(:title) }
    # it { should validate_presence_of(:categories) }

  end

  context "#relationships" do

    it { should have_many(:comments) }
    it { should have_many(:votes) }

    # it { should respond_to(:category) }
    it { should have_and_belong_to_many(:categories) }
  end

# describe 

end
