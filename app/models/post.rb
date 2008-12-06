class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

	has_many :comments, :dependent => :destroy
  belongs_to :user

	validates_presence_of :title
	validates_presence_of :body

end
