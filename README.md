# keep-up
Winter Hacklympics 2020

## Inspiration

Many college students agree that 2020 has been a difficult year to stay motivated and develop healthy habits, especially when you don't have your friends next to you to push you along. As 2021 nears the corner, our team has created KeepUp, a new take on habit tracking that is all about the social network: friends challenging friends to develop healthy habits (along with some hearty competition)!

## What it does

Key Features:
-Habit-Tracking: Each time they perform a habit, the user is able to log their progress and ‘KeepUp’ will display the trends/history of the habit.
-Streaks with Friends: “Snap Chat”-esque streaks! Users are able to start a healthy habit streak with a friend. Each day both friends perform a habit, the streak is updated to reflect the number of continuous days, encouraging users to keep up with their healthy habits!
-Challenge Forum: A forum page where users can propose healthy-habit challenges for their friends to accept.

## How we built it

We built this app using Swift in XCode and used Firebase as our backend to store data and handle user authentication. We used the FirebaseAuth package for user login, Cloud Firestore to store user data for habits, friends, and streaks, and the Realtime Database for the challenges forum. In order to add friends, streaks, or habits, we read and added data to the backend database using queries. We used the XCode Storyboard for UI design and used table view, navigation, and tab bar controllers to allow for a user friendly interface.

## Challenges we ran into

One challenge that we ran into was having to deal with large merge conflicts with the XCode storyboard. We resolved this by setting up a good workflow using git branches and github issues. Additionally, almost all of us were relatively new to using Cloud Firestore, so we had to learn this new technology very quickly. We also had to learn how to fix debugging issues, structure data, fix merge errors, display data from the backend in our view controllers and more in such a short time period. Although we faced many challenges, working together and constantly communicating with each other allowed us to quickly resolve any issues and find solutions!

## Accomplishments that we are proud of

We learned to use Firebase hosting and Cloud Functions to update data from our app in real time. We worked to set up documents/collections with Firestore in order to store data for each user to keep track of each habit, the length of time they have continued a habit, their friends list, their user authentication, and more.

Building the backend:
-To log each user’s habits and friends, we created a series of documents and collections to store each user’s habits and the corresponding days at which the person performed that habit. We then retrieved the data to be displayed in a habit log on the “trends” page.
-To create the challenges board, we used the real-time database for users to easily post (to firebase) new “healthy habit challenges” they would like to pose to their friends as well as receive/accept (read from firebase) “healthy habit challenges” from other users.

## What we learned

Our Key Takeaways Are...
-In app development, it is key to focus on building minimal key features before adding too many features!
-We learned how to read, store, and write data to Firebase!
-XCode storyboard conflicts are nasty!

## What's next for Keep Up

We believe that habit-building is all about being roped into a strong community! We want to add features to increase the social aspects of habit-building, including a feature to post pictures of people performing their habits, a podcast feature for listening to everything from habit building motivational talks and meditation tracks, and virtual workout/yoga sessions. We all need a strong community that can hold us accountable!

