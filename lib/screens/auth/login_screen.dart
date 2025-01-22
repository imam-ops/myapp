import 'package:flutter/material.dart';
import 'package:myapp/screens/rt/rt_dashboard.dart';
import '../../services/auth_service.dart';
import '../admin/admin_dashboard.dart';
import '../user/user_dashboard.dart';
import '../auth/register_screen.dart'; // Tambahkan import ini

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  Future<void> _login() async {
  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill all fields')),
    );
    return;
  }
  setState(() => _isLoading = true);
  try {
    final user = await _authService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (user.role == 'admin') {
              return AdminDashboard();
            } else if (user.role == 'rt') {
              return RtDashboard();
            } else {
              return UserDashboard();
            }
          },
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed: $e')),
    );
  } finally {
    setState(() => _isLoading = false);
  }
}


  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
         child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            const Text(
              'Log In',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 0),
            const Text(
              'Sistem Informasi Pelayanan Publik Desa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Masukkan Email',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan Password',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add forgot password functionality
                },
                child: const Text('Lupa Kata Sandi?'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text('Login With Google'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text('Login With Facebook'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white),
                child: const Text('Login as Guest'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Belum Punya Akun?'),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                      // Add forgot password functionality
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      )
    );
  }
}
