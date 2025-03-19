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
   git clone <repository_url>
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:

   - Create a Firebase project. Follow these three main steps to establish your Firebase project

     | Step 1 | Step 2 | Step 3 |
     | ------ | ------ | ------ |
     | ![Step 1](https://github.com/user-attachments/assets/4378c3d8-b1ab-4a6b-9b15-cbf319dec547) | ![Step 2](https://github.com/user-attachments/assets/d521c0de-35fb-44ca-8d5b-6aa60180a841) | ![Step 3](https://github.com/user-attachments/assets/66e7d2ac-91d6-41d9-8784-d64b465a6e12) |
   - Now, that your Firebase project has been set up, make sure the connection is established via `firebase.json`. It is very important to for any use of a Firebase service. Hence, always make sure that flutterfire has configured the project correctly. Some of the steps might be like this:
   
      The prompt for flutterfire configure
     ![Flutterfire config](https://github.com/user-attachments/assets/6fced010-99b7-47a0-b0cc-46645864c911)

      The configuration upon success gives you all the Firebase App IDs that you can use.
     ![Flutterfire config success](https://github.com/user-attachments/assets/e55e1e4a-f161-4a48-a90a-8ba1b7312b38)

   - Set up Firebase Realtime Database for complaints, authentication with providers like Google Account and Phone Number providers. You can visit your Firebase project to enable them:
      ![Authentication Screen and Providers](https://github.com/user-attachments/assets/1f205aaa-6179-4e67-8a59-36e623e80f97)

   - At the last, make sure whichever service you are using, it has the proper fingerprint of your app to authorize the providers/services of your Firebaese project. For example, Authentication via Google Account requires the SHA1 and SHA256 keys of your Flutter app before you can use the authentication service. Hence, ensure that you use your fingerprints correctly. In case of Android, these keys can be found via the following command: Within your `/android` directory execute the following command - `./gradlew signingReport` to obtain your SHA keys
      Execute the command:
      ![Command to generate keys](https://github.com/user-attachments/assets/3745c98e-d578-4267-a08a-143f0df40e96)

      Result of execution:
      ![Obtained keys](https://github.com/user-attachments/assets/7ef7e907-3cda-4801-b347-77bdbbb29242)

      Now, paste the same keys into your authentication provider:
      ![Setup key](https://github.com/user-attachments/assets/178c060d-4342-40b5-bb1a-d5b582d26c00)

   - Finally, you will be able to use the Firebase services via your own project. Do not forget to visit [Flutterfire Setup](https://firebase.google.com/docs/flutter/setup) to understand the setup process in greater details and different platforms!




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
