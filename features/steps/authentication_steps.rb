Given /I am on the new authentication page/ do
  visits "/authentications/new"
end

Given /there are (\d+) authentications/ do |n|
  Authentication.transaction do
    Authentication.destroy_all
    n.to_i.times do |n|
      Authentication.create! :name => "Authentication #{n}"
    end
  end
end

When /I delete the first authentication/ do
  visits authentications_url
  clicks_link "Destroy"
end

Then /there should be (\d+) authentications left/ do |n|
  Authentication.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end
