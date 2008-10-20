Given /I am on the new comments page/ do
  visits "/comments/new"
end

Given /there are (\d+) comments/ do |n|
  Comments.transaction do
    Comments.destroy_all
    n.to_i.times do |n|
      Comments.create! :name => "Comments #{n}"
    end
  end
end

When /I delete the first comments/ do
  visits comments_url
  clicks_link "Destroy"
end

Then /there should be (\d+) comments left/ do |n|
  Comments.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end
