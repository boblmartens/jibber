Given /I am on the registration page/ do
	visits "/users/new"
end

Given /I am on the new users page/ do
  visits "/users/new"
end

Given /a user "testy"/ do
	a = User.new
	a.email = "test@test.com"
	a.password = "test"
	a.name = "testy"
	a.save
end

Given /I am on the members page/ do
	visits "/users"
end

Given /there are (\d+) users/ do |n|
  Users.transaction do
    Users.destroy_all
    n.to_i.times do |n|
      Users.create! :name => "Users #{n}"
    end
  end
end

When /I delete the first users/ do
  visits users_url
  clicks_link "Destroy"
end

Then /there should be (\d+) users left/ do |n|
  Users.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end