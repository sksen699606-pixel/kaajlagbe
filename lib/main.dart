import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/auth/phone_login_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/role_screen.dart';
import 'screens/customer/customer_home.dart';
import 'screens/worker/worker_home.dart';
import 'services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const KaajLagbeApp());
}

class KaajLagbeApp extends StatelessWidget {
  const KaajLagbeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'KaajLagbe',
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    home: const AuthGate(),
  );
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: AuthService.authStateChanges,
    builder: (_, snap) {
      if (snap.connectionState == ConnectionState.waiting) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      if (!snap.hasData) return const PhoneLoginScreen();
      return const RoleScreen();
    },
  );
}

class OtpRoute extends StatelessWidget {
  final String verificationId;
  final String phone;
  const OtpRoute({super.key, required this.verificationId, required this.phone});
  @override
  Widget build(BuildContext context) => OtpScreen(verificationId: verificationId, phone: phone);
}

class RoleHome extends StatelessWidget {
  final String role;
  const RoleHome({super.key, required this.role});
  @override
  Widget build(BuildContext context) => role == 'worker' ? const WorkerHome() : const CustomerHome();
}
