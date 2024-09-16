
# Instagram-like Web Application



## Objective

This is a basic Instagram-like web application built using Ruby on Rails. The application focuses on core features like user authentication, image sharing, comments, likes, a follow system, and basic admin functionality. The emphasis is on backend logic and functionality, with minimal focus on the front-end design.




## Features

 1. User Authentication and Authorization
   - User registration, login, and authentication via Devise.
   - Role management (Regular Users and Admins) via Cancancan.
   - Regular Users: Can create, edit, and delete their posts.
   - Admins: Can manage all posts and users.

 2. User Profile
  - Users can view and edit their profile information (username, email, bio).
  - A profile page lists the user’s posts.

 3. Posts (Images or Videos)
  - Users can create, edit, and delete posts with images.
  - Post includes the image, caption, and user information.
  - Posts are displayed in reverse chronological order.
  - Active Storage handles image uploads.

 4. Comments
 - Users can comment on posts, and delete their own comments.
 - Admins can delete any comment.

 5. Likes
  - Users can like or unlike posts.
  - Post displays the number of likes.

 6. Follow System
  - Users can follow or unfollow other users.
  - The homepage shows posts from followed users.
  - A list of followers and following is shown on the user profile page.

 7. Admin Panel
  - Admins can manage users and posts.

 8. Search
  - Users can search for other users by username.
  - Posts can be filtered by caption keywords.

 9. Notifications
 - Notifications are sent when a user is followed, or when their post receives a comment or like.


 10. Basic Analytics
 - Basic statistics like total users, posts, and comments.
 - Shows the most active users.

 11. Messaging Feature
 - Users can message their followers.

 12. Save Post Feature
 - Users can save posts and view their saved posts privately.
## Technologies Used

**Ruby on Rails(7.2.1)** 

**PostgreSQL(1.1)**  for database management

**Active Storage**  for image upload handling.

**Devise(4.9)**  for authentication.

**Cancancan**  for authorization.

**RSpec** for unit testing.

**Active Admin(3.2.0)** for admin panel.