# BugTracker
This is a Bug Tracker created with Flutter and Dart, both Frontend and Backend.

## Getting started
To run the bugtracker, you first have to do a few things:
1. Inside the backend folder, create a file named `.env`. Here you will have to copy the following:
```
JWT_REFRESH_TOKEN_SIGNATURE=PutYourRefreshTokenSignatureHere
JWT_ACCESS_TOKEN_SIGNATURE=PutYourAccessTokenSignatureHere
```
and assign a value to each of the variables. They should be long strings, ideally algorithmically generated.