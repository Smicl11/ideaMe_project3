#ideaMe
**by Bryan Smith**

### An open source idea sharing app, where users can share, like, and comment on each others ideas!

![alt tag](https://github.com/Smicl11/ideaMe_project3/blob/master/main.png)

### Technologies
- Ruby on Rails
- Bootstrap
- PostgresSQL database
- Sass

![alt tag](https://github.com/Smicl11/ideaMe_project3/blob/master/main.png)

### Additional Gems
- gem 'simple_form'
- gem 'bootstrap-sass', '~> 3.3.6'
- gem 'acts_as_votable', '~> 0.10.0'
- gem 'acts_as_commentable_with_threading'
- gem 'social-share-button'

![alt tag](https://github.com/Smicl11/ideaMe_project3/blob/master/idea-index.png)

#### User Story
- User starts on splash page with jumbotron asking if they are looking for inspiration, user attention brought to login/signup
- If user is logged in the button becomes a create idea button
- Navbar allows quick access to the users profile, exploring posted ides or logging in/out
- As the user scrolls down the page they will see all of the ideas submitted to the site.
- A user cannot see idea details, comments, or vote on an idea unless they're logged in.
- Profile has a picture of user, user info and ideas they have submitted.
- From the profile page, user can create a new idea, delete or edit their profile
- Graceful fail on all validations, to guide user.

![alt tag](https://github.com/Smicl11/ideaMe_project3/blob/master/profile.png)

#### Relationship Model
![alt tag](https://raw.githubusercontent.com/Smicl11/ideaMe_project3/master/erd.png)
