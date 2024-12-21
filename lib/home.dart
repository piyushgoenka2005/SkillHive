import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function toggleTheme;
  final bool isDark;

  const HomePage({super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu,
                color:
                    isDark ? Colors.white : Colors.black), // Icon color fixed
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('SkillHive',
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
      drawer: CustomDrawer(userName: 'Piyush Goenka'),
      body: Container(
        color: isDark ? Colors.grey[900] : Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gap after AppBar
              const SizedBox(height: 20),

              // Top Banner
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300, // Placeholder color
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/banner.jpg'), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gap after Banner
              const SizedBox(height: 30),

              // Join Class Section
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Need to add a class?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Add your teacher with their class code or email address.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Join class',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),

              // Gap after Join Class
              const SizedBox(height: 30),

              // Recent Lessons Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent lessons',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Center(
                          child: Text(
                            'No recent lessons',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Gap after Recent Lessons
              const SizedBox(height: 30),

              // My Courses Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My courses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Get started',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Final Gap
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          // Do nothing for now
          if (index == 1) {
            Navigator.pushNamed(context, '/explore-page');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/bookmark-page');
          } else {
            Navigator.pushNamed(context, '/home');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
        ],
      ),
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

class CustomDrawer extends StatelessWidget {
  final String userName;
  const CustomDrawer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[400],
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_image.png'),
            ),
            accountName: Text(
              userName,
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: null,
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.person_outline,
                  title: 'My profile',
                  routeName: '/profile-page',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.school,
                  title: 'Learnings',
                  routeName: '/learnings',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.trending_up,
                  title: 'Performance',
                  routeName: '/performance',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.quiz,
                  title: 'Quiz',
                  routeName: '/quiz',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.person_add_outlined,
                  title: 'Invite friends',
                  routeName: '/invite-friends',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.info_outline,
                  title: 'About',
                  routeName: '/about',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.security,
                  title: 'Change Password',
                  routeName: '/forgot-password',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.exit_to_app,
                  title: 'Logout',
                  routeName: '/',
                  isReplacement: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String routeName,
      bool isReplacement = false}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (isReplacement) {
          Navigator.pushReplacementNamed(context, routeName);
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
    );
  }
}
