# KaajLagbe Android MVP Starter

Flutter + Firebase starter for a local customer/worker marketplace.

## 1. Create Flutter project
If you want to start fresh, run:
`flutter create kaajlagbe`
Then copy the `lib/`, `pubspec.yaml`, and `firestore.rules` from this starter.

## 2. Firebase setup
Install Firebase CLI and FlutterFire CLI:
`firebase login`
`dart pub global activate flutterfire_cli`

From the project root:
`flutter pub get`
`flutterfire configure`

Select Android and your Firebase project. This generates the real `lib/firebase_options.dart`.

## 3. Enable Phone OTP
Firebase Console → Authentication → Sign-in method → Phone → Enable.
For Android Phone Auth, add your app SHA-1/SHA-256 in Firebase Project Settings.

## 4. Enable Firestore
Firebase Console → Firestore Database → Create database.
Deploy rules using Firebase CLI if installed:
`firebase deploy --only firestore:rules`

## 5. Run
`flutter run`

## Current implemented flow
Phone → OTP → Customer/Worker role → separate dashboard.

Customer: categories + sample worker + post-job UI.
Worker: available jobs + accept UI.

## Production work still needed
Real job queries, worker location/radius search, customer/worker profiles, booking state machine, chat, FCM notifications, image upload, ratings, admin panel, payment/commission, abuse reporting, and production-grade Firestore rules.
