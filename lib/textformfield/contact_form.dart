import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _emailFocus.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Contact Form'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.contact_page)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const CircleAvatar(backgroundColor: Colors.blue, radius: 36),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      _formField(
                        labelText: 'Name',
                        hintText: 'Enter Name',
                        icon: Icons.person,
                        controller: _nameController,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_emailFocus);
                        },
                        validator: (value) =>
                            (value == null || value.trim().isEmpty)
                            ? 'Name is required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      _formField(
                        labelText: 'Email',
                        hintText: 'Enter the email',
                        icon: Icons.email_outlined,
                        controller: _emailController,
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_usernameFocus);
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          final emailPattern = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailPattern.hasMatch(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      _formField(
                        labelText: 'Username',
                        hintText: 'Enter a username',
                        icon: Icons.alternate_email,
                        controller: _usernameController,
                        focusNode: _usernameFocus,
                        textInputAction: TextInputAction.done,
                        validator: (value) =>
                            (value == null || value.trim().isEmpty)
                            ? 'Username is required'
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Name: ${_nameController.text}');
                        print('Email: ${_emailController.text}');
                        print('Username: ${_usernameController.text}');
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable form field builder — every parameter is actually wired into
// the returned TextFormField below. This is what your version was missing.
Widget _formField({
  required String labelText,
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  TextInputAction textInputAction = TextInputAction.next,
  TextInputType keyboardType = TextInputType.text,
  FocusNode? focusNode,
  void Function(String)? onFieldSubmitted,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      hintText: hintText,
      prefixIcon: Icon(icon, color: Colors.blue),
      filled: true,
      fillColor: Colors.white70,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    ),
  );
}