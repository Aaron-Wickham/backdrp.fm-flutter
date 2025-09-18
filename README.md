# BACKDRP.FM — Flutter + Firebase Scaffold (Overlay)

This repo overlay gives you a consistent structure, Firebase rules/functions, and CI.  
**Usage**:
1) Locally run: `flutter create backdrp_fm`  
2) Copy the contents of this folder over `backdrp_fm/` (merge/replace where needed).  
3) Run: `dart pub get`

---

## Steps 1–4 (Project Bootstrap)

### 1) Create Firebase project
- In the Firebase Console, create a project. Note the **Project ID** (e.g., `backdrp-fm-prod`).
- Add apps: iOS, Android, and **Web**. Download/enable configs (use `flutterfire configure` later).

### 2) Owner account (role seeding)
- Sign in once in the app to create your user doc, OR manually create the doc.
- Then set your document at `users/{uid}` with:
```json
{ "email": "YOUR_EMAIL", "role": "owner", "createdAt": "<server timestamp>" }
```
- You can seed via Firebase Console or via CLI:
```
firebase firestore:documents:create users/YOUR_UID '{ "email": "YOUR_EMAIL", "role": "owner" }' --project YOUR_PROJECT_ID
```

### 3) Choose email provider
- **Option A: SendGrid** (Firebase Extension: *Trigger Email*).
- **Option B: Mailchimp** (Firebase Extension: *Mailchimp Integration*).
- After installing, set the environment variables / extension params. In the app, submitting email calls the `subscribeEmail` callable Function.

### 4) GitHub repo + CI
- Push your project to GitHub.
- Add repository secrets: `FIREBASE_TOKEN` (from `firebase login:ci`) and `PROJECT_ID` (your Firebase ID).
- On push to `main`, CI builds web and deploys Hosting.

---

## Local Setup

```bash
flutter pub add flutter_bloc equatable go_router get_it
flutter pub add firebase_core firebase_auth cloud_firestore firebase_storage firebase_messaging firebase_analytics firebase_app_check url_launcher intl just_audio audio_session
flutter pub add dev:build_runner dev:freezed dev:json_serializable dev:freezed_annotation
# Then:
dart pub get
flutterfire configure  # select your project & platforms
```

Run web dev:
```bash
flutter run -d chrome
```

Deploy (after CI configured or locally):
```bash
firebase deploy --only hosting,functions,firestore:rules,storage
```

## Notes
- This overlay includes Firestore/Storage rules, Functions skeleton, router/theme, and a simple UI shell.
- For SEO on Flutter Web, consider a small static `public/` marketing page in Firebase Hosting with prerendered meta tags that deep-links into app routes.
