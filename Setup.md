## Setting up Services in Firebase

  Though you might have configured the firebase project into your Flutter app, some services like authentication need some special key unique to your app, in order to authorize the app to access that service. Hence, in this Setup readme, we have given a procedure of how to authorize the authentication service of your Firebase project by providing it the SHA keys of the Android app we will be using. For enabling other services, you may visit [FlutterFire docs](https://firebase.google.com/docs/flutter/setup)

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
