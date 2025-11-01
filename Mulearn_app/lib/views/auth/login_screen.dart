import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/utils/auth_functions.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/views/auth/signup_screen.dart';
import 'package:flutter_application_1/views/presentation/dashboard_screen.dart';
import 'package:flutter_application_1/views/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(decoration: BoxDecoration(color: Colors.white)),
            Center(
              child: Container(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Image.asset(
                            'lib/assets/logo1.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            'Hello! Welcome Back',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Enter your muid or email address to request for OTP',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email or MuId is Required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email or MuId',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscurePassword,
                          builder: (context, obscure, child) => TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Password is Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              suffixIcon: IconButton(
                                color: Colors.grey[100],
                                icon: Icon(
                                  obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () =>
                                    _obscurePassword.value = !obscure,
                              ),
                            ),
                            obscureText: obscure,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot your Password',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Login with OTP',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final flag = await checkLogin(
                                UserModel(
                                  id: '',
                                  muid: '',
                                  name: '',
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );

                              if (!context.mounted) return;

                              if (flag == true) {
                                if (!context.mounted) return;

                                // Clear any existing messages
                                ScaffoldMessenger.of(context).clearSnackBars();

                                // Debug logging to help trace navigation issues
                                print(
                                  'Login successful, verifying auth state...',
                                );

                                // Verify Firebase Auth state
                                final currentUser =
                                    FirebaseAuth.instance.currentUser;
                                if (currentUser == null ||
                                    currentUserId == null) {
                                  print('Auth state verification failed:');
                                  print('currentUser: $currentUser');
                                  print('currentUserId: $currentUserId');

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Authentication error: Please try again',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Verify IDs match
                                if (currentUser.uid != currentUserId) {
                                  print('UID mismatch:');
                                  print('Firebase UID: ${currentUser.uid}');
                                  print('currentUserId: $currentUserId');
                                  currentUserId = currentUser.uid;
                                }

                                // Show initial success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Login Successful, loading profile...',
                                    ),
                                  ),
                                );

                                try {
                                  // Show loading message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Loading your profile...'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );

                                  // Get fresh token
                                  await FirebaseAuth.instance.currentUser
                                      ?.getIdToken(true);

                                  // Try to create/verify user document
                                  try {
                                    final userDoc = await FirebaseFirestore
                                        .instance
                                        .collection('mulearn_users')
                                        .doc(currentUserId)
                                        .get();

                                    print('User document check:');
                                    print('Document exists: ${userDoc.exists}');
                                    if (userDoc.exists) {
                                      print('Document data: ${userDoc.data()}');
                                    } else {
                                      print(
                                        'Document does not exist - will be created by loadUser',
                                      );
                                    }
                                  } catch (e) {
                                    print('Error checking user document: $e');
                                  }

                                  // Try to get the user document first to debug permissions

                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => DashboardScreen(),
                                    ),
                                  );
                                } catch (e, st) {
                                  print('Error loading user after login: $e');
                                  print('Stack trace: $st');

                                  return;
                                }

                                if (!context.mounted) return;

                                // Navigation already performed after loading the user (see earlier in the try block).
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Invalid User Credentials. Try again',
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Don\'t have an account? Sign up',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Homepage',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
