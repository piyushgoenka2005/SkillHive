// lib/sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  // String _firstName = '';
  // String _lastName = '';
  // String _phoneNumber = '';
  // String _email = '';
  // String _password = '';
  // String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 32.0),
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                // onSaved: (value) => _firstName = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                // onSaved: (value) => _lastName = value!,
              ),
              SizedBox(height: 16.0),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'IN',
                // onSaved: (value) => _phoneNumber = value.completeNumber,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                // onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                // onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty /*|| value != _password*/) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                // onSaved: (value) => _confirmPassword = value!,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Implement sign-up logic here
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text('Create an account'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('I ready have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
