FactoryGirl.define do
  
  factory :response, class: Message do
	created_at "2012-09-27T16:15:06Z"
	id 8
	message "Tweet me your fav drinks #drinks"
	sentiment 0
	updated_at "2012-09-27T16:15:06Z"
  end
  
end