class Comment < ActiveRecord::Base
	belongs_to :post
  belongs_to :user

	validates_presence_of :body

  def commenter_name 
    if name == ""
      "A Shiftless Shadow"
    elsif name == nil
      "A Shiftless Shadow"
    else
      name
    end
  end
  
  def pretty_date
    created_at.strftime("%m.%d.%y")
  end
end
