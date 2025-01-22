import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/rt/rt_dashboard.dart';
import 'firebase_options.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/auth/login_screen.dart';
import 'screens/user/user_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(snapshot.data!.uid)
                  .get(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (userSnapshot.hasData && userSnapshot.data!.exists) {
                  final userData =
                      userSnapshot.data!.data() as Map<String, dynamic>;
                  if (userData['role'] == 'admin') {
                    return AdminDashboard();
                  } else if (userData['role'] == 'rt') {
                    return RtDashboard();
                  } else {
                    return UserDashboard();
                  }
                }
                return LoginScreen();
              },
            );
          }
          return LoginScreen();
        },
      ),
    );
  }
}
