require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
		Post.new(@valid_attributes).should be_valid
  end

	it "should not save instance if given only body" do
		Post.new(:body => "body test").should_not be_valid
	end

	it "should not save instance if given only title" do
		Post.new(:title => "title test").should_not be_valid
	end

	it "should update attributes after edit" do
		p = Post.create(@valid_attributes)
		p.update_attributes(:title => "test title")
		p.title.should == "test title"
	end

	it "should delete record" do
		p = Post.create(@valid_attributes)
		p.destroy
		p = Post.find(:all).should == []
	end
end
