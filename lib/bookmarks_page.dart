import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDark;

  const BookmarksPage(
      {super.key, required this.toggleTheme, required this.isDark});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  final List<Map<String, dynamic>> bookmarkedItems = [
    {
      'title': 'Introduction to Calculus',
      'type': 'Course',
      'progress': 0.7,
      'isBookmarked': true,
    },
    {
      'title': 'Basic Physics',
      'type': 'Course',
      'progress': 0.3,
      'isBookmarked': true,
    },
    {
      'title': 'English Grammar',
      'type': 'Article',
      'progress': 0.0,
      'isBookmarked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu,
                color: widget.isDark
                    ? Colors.white
                    : Colors.black), // Icon color fixed
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Bookmarks',
            style: TextStyle(
                color: widget.isDark
                    ? Colors.white
                    : Colors.black)), // Title color fixed
        backgroundColor: widget.isDark
            ? Colors.black
            : Colors.white, // Background color fixed
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: widget.isDark
                    ? Colors.white
                    : Colors.black), // Icon color fixed
            onPressed: () {
              _showSettingsBottomSheet(
                  context, widget.toggleTheme, widget.isDark);
            },
          ),
        ],
      ),
      drawer: CustomDrawer(userName: 'Piyush Goenka'),
      body: bookmarkedItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No bookmarks yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedItems.length,
              itemBuilder: (context, index) {
                final item = bookmarkedItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      item['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['type']),
                        if (item['progress'] > 0)
                          LinearProgressIndicator(
                            value: item['progress'],
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        item['isBookmarked']
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          item['isBookmarked'] = !item['isBookmarked'];
                          if (!item['isBookmarked']) {
                            bookmarkedItems.removeAt(index);
                          }
                        });
                      },
                    ),
                    onTap: () {
                      // Navigate to the bookmarked item
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
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
