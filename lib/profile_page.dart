import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              const Text("Account Details",
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
              const Text("Security",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: const Text("Change Password"),
                ),
              ),
              const SizedBox(height: 20),
              const Text("MCQ Performance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildPerformanceChart(),
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
        const Spacer(),
        TextButton(onPressed: () {}, child: const Text("Edit")),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
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
          color: Colors.grey.shade200,
          child: const Center(
            child: Text("Graph Placeholder (Use a chart library here)"),
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
          color: Colors.grey.shade200,
          child: const Center(
            child: Text("Pie Chart Placeholder (Use a chart library here)"),
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
          color: Colors.grey.shade200,
          child: const Center(
            child: Text("Pie Chart performance"),
          ),
        ),
      ],
    );
  }
}
