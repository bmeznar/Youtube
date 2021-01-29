# README

Simple Youtube clone webpage made on Ruby on Rails for school project.

It has user authorization with devise and also includes Google and Facebook login.

  - If user is not signed in he can only watch and browse videos.
  - Signed in user has options to subscribe to different users, like or dislike videos(acts_as_votable gem) , comment on them (commontator gem) and add them on their playlist. User alo has an option to upload videos.

Each loged in user can edit their own profile and upload their profile photo.

Uploading videos (carrierwave-video gem) and uploading its thumbnail (active storage), video description and title.

User can subscribe to many others and many others can subscribe to that user. For each user you can see how many subscribers he has.

Main pages are home which displays all videos, subscriptions which displays all users you are subscribed to, my profile which displays my profile, my videos and last my playlist, where you can see all the videos you have added to your playlist. 

User profile displays users profile picture, name and subscriber count, all his videos and videos on his playlist.

App is compatable with heroku hosting.
