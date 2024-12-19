import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

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
        title: const Text('Bookmarks', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
