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

   - Create a Firebase project
   - Configure Firebase Authentication (Google login, Phone number)
   - Set up Firebase Realtime Database for complaints

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
