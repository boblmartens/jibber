Given /I am on the index page/ do
  visits "/"
end

Given /there are (\d+) postings/ do |n|
  Posting.transaction do
    Posting.destroy_all
    n.to_i.times do |n|
      Posting.create! :name => "Posting #{n}"
    end
  end
end

When /I delete the first posting/ do
  visits postings_url
  clicks_link "Destroy"
end

Then /there should be (\d+) postings left/ do |n|
  Posting.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end
