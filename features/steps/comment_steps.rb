Given /I am on the new comment page/ do
  visits "/comments/new"
end

Given /there are (\d+) comments/ do |n|
  Comment.transaction do
    Comment.destroy_all
    n.to_i.times do |n|
      Comment.create! :name => "Comment #{n}"
    end
  end
end

When /I delete the first comment/ do
  visits comments_url
  clicks_link "Destroy"
end

Then /there should be (\d+) comments left/ do |n|
  Comment.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end
