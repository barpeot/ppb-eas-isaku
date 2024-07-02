import 'package:eas_isaku/screens/login_screen.dart';
import 'package:eas_isaku/screens/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo mitra i.saku
            Image.asset(
              'assets/images/logo.png',
              width: 320,
              height: 210,
            ),

            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Join mitra i.Saku today!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
            ),

          const Column(
            children: [
              SizedBox(
                width: 327,
                height: 58,
                child: Text(
                  'mitra i.Saku is a powerful tool that allows you to manage your business transactions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 20),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Login', style: TextStyle(fontSize: 20),),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}