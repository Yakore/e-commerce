import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDVx9IdWcNQIo6pAfVrtokUTAqrNAsFi3s",
            authDomain: "tienda-0d6h3m.firebaseapp.com",
            projectId: "tienda-0d6h3m",
            storageBucket: "tienda-0d6h3m.appspot.com",
            messagingSenderId: "1074975695928",
            appId: "1:1074975695928:web:a2b41b0ecd2b7d765772cd"));
  } else {
    await Firebase.initializeApp();
  }
}
