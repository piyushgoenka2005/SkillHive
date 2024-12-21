import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Function toggleTheme;
  final bool isDark;

  const ProfilePage(
      {super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back,
                color:
                    isDark ? Colors.white : Colors.black), // Icon color fixed
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('My Profile',
            style: TextStyle(
                color:
                    isDark ? Colors.white : Colors.black)), // Title color fixed
        centerTitle: true,
        backgroundColor:
            isDark ? Colors.black : Colors.white, // Background color fixed
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color:
                    isDark ? Colors.white : Colors.black), // Icon color fixed
            onPressed: () {
              _showSettingsBottomSheet(context, toggleTheme, isDark);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profile_image.png'), // Replace with your image
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Piyush Goenka",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Active since December 2024",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Profile Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildAccountDetail("Username", "PiyushGoenka"),
              _buildAccountDetail("Email", "piyushgoenka@gmail.com"),
              _buildAccountDetail("Years Active", "3 years"),
              const SizedBox(height: 20),
              const Text("Tech Stack",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  _buildChip("React"),
                  _buildChip("Node.js"),
                  _buildChip("MongoDB"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("MCQ Performance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildPerformanceChart(),
              const SizedBox(height: 20),
              // Edit Profile button added
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.grey[800] : Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Redirect to Edit Profile page
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: const Text("Edit Profile"),
                ),
              ),
              const SizedBox(height: 20),
              // Log Out button added
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Redirect to the home page (assumes home page route '/')
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text("Log Out"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountDetail(String title, String value) {
    return Row(
      children: [
        Text("$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.black)),
      backgroundColor: Colors.blue.shade100,
    );
  }

  Widget _buildPerformanceChart() {
    return Column(
      children: [
        const Text(
          "Monthly Quiz Performance",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          color: Colors.grey.shade300,
          child: const Center(
            child: Text("Graph Placeholder (Use a chart library here)",
                style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Overall Accuracy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          color: Colors.grey.shade300,
          child: const Center(
            child: Text("Pie Chart Placeholder (Use a chart library here)",
                style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Performance",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          color: Colors.grey.shade300,
          child: const Center(
            child: Text("Pie Chart performance",
                style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}

void _showSettingsBottomSheet(
    BuildContext context, Function toggleTheme, bool isDark) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
          child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.drive_eta),
            title: Text('Ride Mode'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.center_focus_strong),
            title: Text('Focus Mode'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            title: Text('Night Mode'),
            trailing: Switch(
              value: isDark,
              onChanged: (value) {
                toggleTheme();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ));
    },
  );
}
