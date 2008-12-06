class Comment < ActiveRecord::Base
	belongs_to :post
  belongs_to :user

	validates_presence_of :body
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :homepage
end
