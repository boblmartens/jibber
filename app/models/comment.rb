class Comment < ActiveRecord::Base
	belongs_to :post
  belongs_to :user

	validates_presence_of :body

  def commenter_name 
    if name == ""
      "A nameless voice"
    else
      name
    end
  end
end
