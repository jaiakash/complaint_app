package com.example.complaint_app;  // Ensure this matches your package name

import android.util.Log;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

public class MyFirebaseMessagingService extends FirebaseMessagingService {
    private static final String TAG = "FCMService";

    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {
        Log.d(TAG, "Message received: " + remoteMessage.getData());
    }

    @Override
    public void onNewToken(String token) {
        Log.d(TAG, "New token: " + token);
    }
}
