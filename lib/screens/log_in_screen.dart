import 'package:flutter/material.dart';
import 'package:navigation_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A deep, premium near-black background canvas
      backgroundColor: const Color(0xFF0F0F12),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 340, // Expanded width so elements aren't cramped
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E24), // Premium dark gray container
              borderRadius: BorderRadius.circular(24), // Modern soft rounding
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hey, welcome back 👋',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Please sign in to your account',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 32),

                  // --- EMAIL FIELD ---
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    maxLength: 100,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'lainaaa@gmail.com',
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: Colors.grey,
                      ),
                      counterText: "", // Hides ugly character count text
                      filled: true,
                      fillColor: const Color(
                        0xFF2A2A32,
                      ), // Modern filled input look
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required Field';
                      }
                      if (!value.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),

                  // --- PASSWORD FIELD ---
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    obscureText: true,
                    maxLength: 100,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '••••••••',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: Colors.grey,
                      ),
                      counterText: "",
                      filled: true,
                      fillColor: const Color(0xFF2A2A32),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 6) return 'Minimum 6 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // --- SUBMIT BUTTON ---
                  SizedBox(
                    width: double.infinity,
                    height:
                        48, // Slightly taller button for better touch target
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserProvider>().setUser(
                            _emailController.text,
                            _passwordController.text,
                          );

                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Matching field radius
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Sign In'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
