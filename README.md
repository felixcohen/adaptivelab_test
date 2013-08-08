adaptivelab_test
================

Instructions:

To run:

Use 'bundle install' to install required gems, and if you use rbenv or RVM, this should be fine with > Ruby 1.9.3 

use either shotgun (included in the Gemfile) or ruby itself to run from the command line:

'shotgun ./adaptive.rb'

or

'ruby ./adaptive.rb'


To run tests

run

'rake spec'

from the root directory.

To access data

You can use ActiveRecord methods on the 'Messages' class if you use

irb -r ./adaptive.rb

Or directly access the database in the db folder (sqlite3)


Adaptive Lab’s Technical Test

Background

We’ve built a very simple Twitter-like service that delivers short text updates via a RESTful API. Each update has the following metadata:

an ID for each message

a sentiment score indicator (a sliding scale between -1 meaning the message is very negative, to 0 meaning that the message is neutral and 1 meaning the message is very positive)

a timestamp for when the message was updated

a handle for the user who created the message

the number of followers for that user

The API can be accessed at: 

http://adaptive-test-api.herokuapp.com/tweets.json 

A call to the API will return 2 random updates from the service, though some of those updates could be duplicates from previous calls.

Details

Please build a web application that displays messages that are all about “Coke”.  Here are the details of what it should be providing:

A “Coke” page that has a button “Fetch more messages”.  When clicked it should fetch two tweets from the API.
After fetching tweets, the app should display all the relevant messages collected so far, along with the “Fetch more messages” button.

Messages containing one or more of the following keywords should be highlighted in red: ‘coke’, ‘coca-cola’ and ‘diet cola’.

The information to be shown for each message should be the user’s handle, the message text and the sentiment.
The messages should be sorted by sentiment, in descending order.

The messages should not be duplicated - instead, display a counter that tells the user how many times that message has been seen.

All tweets received from the API should be stored.

The API might fail occasionally so your app should account for that and display some sort of message to the user.

Please don’t worry about the page looking amazing, we’re just interested in the functionality!
Requirements

When the project has been completed it should be presented in a state which is maintainable by another developer.  To that end:

Tell us how to run the app
Tell us how to run your tests
Tell us how to retrieve the data that the app stores
Don’t forget comments in any code that needs them!

This project should be deployed to a github repository which should be committed to frequently

You’re free to use any frameworks or libraries that will help you with the challenge but please be prepared to explain your choices

Please don’t spend more than four hours as we can just assess from the point you reached.

Optional extras:

When a user clicks on a user handle, another view is displayed, which shows all of the messages from that particular user.

Instead of displaying the sentiment number, display the sentiment as a happy, sad or neutral face using these images: 

http://adaptive-test-api.herokuapp.com/images/positive.png 
http://adaptive-test-api.herokuapp.com/images/negative.png 
http://adaptive-test-api.herokuapp.com/images/neutral.png

