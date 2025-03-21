# Government Officer Complaint Management App

This app allows users to log in, submit complaints, and ensure real-time communication with government officers. Officers receive complaints in real-time and can manage them efficiently.

## Features

- **User Authentication**: 
  - Google Login
  - Phone Number Authentication
- **Complaint Submission**: 
  - Users can submit complaints with text, images, and location data.
- **Complaint Categorization**:
  - Users select a department, sub-department, and then a specific officer.
- **Real-Time Communication**:
  - Complaints are sent and received in real-time using Firebase.
- **Officer Management**:
  - Officers can manage complaints by marking them as resolved or adding comments.
- **Admin Metrics Dashboard**:
  - Admins can view complaint metrics categorized by officer, department, and area.

## Tech Stack

- **Frontend**: Flutter
- **Backend**: Firebase (Real-time Database, Authentication)
- **Authentication**: Google login, Phone number authentication

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/jaiakash/complaint_app.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:

   - Go to the [Firebase Console]()
   - Click on "Add Project" and follow the on-screen instructions to create a Flutter project. The steps would look similar to the ones shown below.

     | Step 1 | Step 2 | Step 3 |
     | ------ | ------ | ------ |
     | ![Step 1](https://github.com/user-attachments/assets/4378c3d8-b1ab-4a6b-9b15-cbf319dec547) | ![Step 2](https://github.com/user-attachments/assets/d521c0de-35fb-44ca-8d5b-6aa60180a841) | ![Step 3](https://github.com/user-attachments/assets/66e7d2ac-91d6-41d9-8784-d64b465a6e12) |
   - Now, that your Firebase project has been set up, make sure the connection is established via `firebase.json`. It is very important to for any use of a Firebase service. Hence, always make sure that flutterfire has configured the project correctly. Some of the steps might be like this:
   
      The prompt for flutterfire configure
     ![Flutterfire config](https://github.com/user-attachments/assets/6fced010-99b7-47a0-b0cc-46645864c911)

      The configuration upon success gives you all the Firebase App IDs that you can use.
     ![Flutterfire config success](https://github.com/user-attachments/assets/e55e1e4a-f161-4a48-a90a-8ba1b7312b38)

   - With Firebase config in your project completed, you would still need some specific setup for authenticating the Firebase services. For more details, check the [Setup.md](/Setup.md)
   - With the necessary setup completed, you may now be able to use Firebase services and enable them for running the application.

4. Run the app:
   ```bash
   flutter run
   ```

## Contribution
   1. Fork the repository.
   2. Create a new branch (`git checkout -b feature/your-feature`).
   3. Commit your changes (`git commit -am 'Add your feature'`).
   4. Push to the branch (`git push origin feature/your-feature`).
   5. Create a new pull request.
