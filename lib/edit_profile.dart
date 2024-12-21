import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final bool isDark;

  const EditProfilePage({super.key, required this.isDark});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = "Piyush Goenka"; // Default values
    _emailController.text = "piyushgoenka@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: widget.isDark ? Colors.white : Colors.black),
        ),
        backgroundColor: widget.isDark ? Colors.black : Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/profile_image.png'), // Replace with the selected image
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the data (e.g., save to database)
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.isDark ? Colors.blue : Colors.blueAccent,
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
