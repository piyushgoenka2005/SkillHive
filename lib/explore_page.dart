import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDark;

  const ExplorePage({
    super.key,
    required this.toggleTheme,
    required this.isDark,
  });

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map<String, dynamic>> articles = [
    {
      'title': 'The Rise of China: Implications for Global Power Structures',
      'description':
          'An in-depth analysis of Chinas growing influence on the global stage, examining its economic, military, and geopolitical strategies and their impact on international relations.',
      'imageUrl':
          'https://images.unsplash.com/photo-1609457021150-631651897b07',
      'readTime': '7 min read',
    },
    {
      'title': 'Russia’s Return to the Global Stage: The New Cold War?',
      'description':
          'Exploring Russia’s resurgence under Vladimir Putin, its geopolitical ambitions, and its ongoing standoff with the West over issues like Ukraine and NATO expansion.',
      'imageUrl': 'https://images.unsplash.com/photo-1545311651-d2850133b2fe',
      'readTime': '6 min read',
    },
    {
      'title':
          'The Geopolitics of the Middle East: Power Shifts and Proxy Wars',
      'description':
          'A deep dive into the shifting power dynamics in the Middle East, with a focus on U.S. withdrawal, Iranian influence, and regional rivalries shaping future conflicts.',
      'imageUrl': 'https://images.unsplash.com/photo-1549463636-f3f36e4abef1',
      'readTime': '8 min read',
    },
    {
      'title': 'The U.S.-China Rivalry in the Indo-Pacific: A New Cold War?',
      'description':
          'A comprehensive look at the growing rivalry between the U.S. and China in the Indo-Pacific, covering trade wars, military tensions, and the struggle for regional dominance.',
      'imageUrl':
          'https://images.unsplash.com/photo-1587597422749-e47cb899a4cf',
      'readTime': '6 min read',
    },
    {
      'title': 'Global Energy Geopolitics: The New Battle for Resources',
      'description':
          'This article examines how energy resources—oil, gas, and rare earth metals—are increasingly central to global geopolitical strategy and competition.',
      'imageUrl':
          'https://images.unsplash.com/photo-1573141065293-b8a1f3545476',
      'readTime': '7 min read',
    },
    {
      'title': 'Cybersecurity and Geopolitics: The New Frontier of Conflict',
      'description':
          'An exploration of how cyberattacks and digital warfare are shaping modern geopolitics, with focus on state-sponsored cyber activities and the risks to global security.',
      'imageUrl': 'https://images.unsplash.com/photo-1531829647-0738ec99854f',
      'readTime': '5 min read',
    },
    {
      'title':
          'The European Union in Crisis: Can it Survive Rising Nationalism?',
      'description':
          'A look at the challenges the EU faces in the face of growing nationalism, economic crises, and internal divisions, and what this means for the future of Europe.',
      'imageUrl':
          'https://images.unsplash.com/photo-1531912783934-1983509bc16a',
      'readTime': '6 min read',
    },
    {
      'title':
          'The Geopolitics of Climate Change: New Conflicts and Cooperation',
      'description':
          'This article explores how climate change is becoming a driving force in geopolitics, creating new challenges and opportunities for international cooperation and conflict.',
      'imageUrl': 'https://images.unsplash.com/photo-1542304890-cce94b450129',
      'readTime': '7 min read',
    },
  ];

  final List<Map<String, dynamic>> podcasts = [
    {
      'title': 'Podcast 1',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
    {
      'title': 'Podcast 2',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
    {
      'title': 'Podcast 3',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
    {
      'title': 'Podcast 4',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
    {
      'title': 'Podcast 5',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
    {
      'title': 'Podcast 6',
      'description': 'Interesting podcast about tech',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '45 min'
    },
  ];

  final List<Map<String, dynamic>> videos = [
    {
      'title': 'Video 1',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
    {
      'title': 'Video 2',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
    {
      'title': 'Video 3',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
    {
      'title': 'Video 4',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
    {
      'title': 'Video 5',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
    {
      'title': 'Video 6',
      'description': 'Exciting video content',
      'imageUrl': 'https://placeholder.com/300x200',
      'duration': '12:30'
    },
  ];

  bool showAllArticles = false;
  bool showAllPodcasts = false;
  bool showAllVideos = false;

  static const int initialCount = 3;

  @override
  Widget build(BuildContext context) {
    // Enhanced dark mode colors
    final backgroundColor =
        widget.isDark ? const Color(0xFF121212) : Colors.white;
    final cardColor = widget.isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = widget.isDark ? Colors.white : Colors.black87;
    final secondaryTextColor = widget.isDark ? Colors.white70 : Colors.black54;

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
        title: Text('Explore',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Articles',
              items: articles,
              showAll: showAllArticles,
              onToggle: () =>
                  setState(() => showAllArticles = !showAllArticles),
              backgroundColor: backgroundColor,
              cardColor: cardColor,
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
            ),
            _buildHorizontalSection(
              title: 'Podcasts',
              items: podcasts,
              showAll: showAllPodcasts,
              onToggle: () =>
                  setState(() => showAllPodcasts = !showAllPodcasts),
              backgroundColor: backgroundColor,
              cardColor: cardColor,
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
              icon: Icons.mic,
              accentColor: Colors.blue,
            ),
            _buildHorizontalSection(
              title: 'Videos',
              items: videos,
              showAll: showAllVideos,
              onToggle: () => setState(() => showAllVideos = !showAllVideos),
              backgroundColor: backgroundColor,
              cardColor: cardColor,
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
              icon: Icons.play_circle_filled,
              accentColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
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

  Widget _buildSection({
    required String title,
    required List<Map<String, dynamic>> items,
    required bool showAll,
    required VoidCallback onToggle,
    required Color backgroundColor,
    required Color cardColor,
    required Color textColor,
    required Color secondaryTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          ...items.take(showAll ? items.length : initialCount).map(
                (item) => Card(
                  color: cardColor,
                  elevation: widget.isDark ? 0 : 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color:
                          widget.isDark ? Colors.white12 : Colors.transparent,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Container(
                          height: 200,
                          color:
                              widget.isDark ? Colors.white12 : Colors.grey[200],
                          // Replace with actual image
                          child: Center(
                            child: Image.network(
                              item[
                                  'imageUrl'], // Replace with the desired image URL
                              width: 200, // Set width of the image
                              height: 150, // Set height of the image
                              fit: BoxFit
                                  .cover, // Optionally adjust how the image is scaled
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['description']!,
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['readTime']!,
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Center(
            child: _buildToggleButton(showAll, onToggle, textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalSection({
    required String title,
    required List<Map<String, dynamic>> items,
    required bool showAll,
    required VoidCallback onToggle,
    required Color backgroundColor,
    required Color cardColor,
    required Color textColor,
    required Color secondaryTextColor,
    required IconData icon,
    required MaterialColor accentColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              _buildToggleButton(showAll, onToggle, textColor),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: showAll ? items.length : initialCount,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  width: 280,
                  margin: const EdgeInsets.only(right: 16),
                  child: Card(
                    color: cardColor,
                    elevation: widget.isDark ? 0 : 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color:
                            widget.isDark ? Colors.white12 : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Container(
                            height: 160,
                            color: widget.isDark
                                ? Colors.white12
                                : Colors.grey[200],
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    icon,
                                    size: 48,
                                    color: accentColor,
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      item['duration']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['description']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(bool showAll, VoidCallback onToggle, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: IconButton(
        icon: Icon(
          showAll ? Icons.arrow_back : Icons.arrow_forward,
          color: color,
        ),
        onPressed: onToggle,
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
