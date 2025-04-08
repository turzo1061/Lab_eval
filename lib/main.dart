import 'package:flutter/material.dart';

void main() {
  runApp(const LinkedInCloneApp());
}

class LinkedInCloneApp extends StatelessWidget {
  const LinkedInCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LinkedInHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LinkedInHomePage extends StatefulWidget {
  const LinkedInHomePage({super.key});

  @override
  State<LinkedInHomePage> createState() => _LinkedInHomePageState();
}

class _LinkedInHomePageState extends State<LinkedInHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    LinkedInFeed(),
    Center(child: Text('My Network')),
    Center(child: Text('Post')),
    Center(child: Text('Notifications')),
    Center(child: Text('Jobs')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LinkedInDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(0),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'My Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Jobs',
          ),
        ],
      ),
    );
  }
}

class LinkedInDrawer extends StatelessWidget {
  const LinkedInDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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'),
          ),
          const SizedBox(height: 10),
          const Text(
            'Md.Tuhin Rayhan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          const Text('Lecturer | Flutter Developer | Laravel Developer'),
          const SizedBox(height: 4),
          const Text('Dhaka, Bangladesh'),
          const SizedBox(height: 8),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('63 profile viewers'),
              Text('120 post impressions'),
            ],
          ),
          const Divider(),
          ListTile(
            title: const Text('Puzzle games'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Saved posts'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Groups'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text('Try Premium for BDT0'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class LinkedInFeed extends StatelessWidget {
  const LinkedInFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        LinkedInPost(),
      ],
    );
  }
}

class LinkedInPost extends StatelessWidget {
  const LinkedInPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'data:image/jpeg;base64,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'),
            ),
            title: const Text('Tamim Ahasan Rijon'),
            subtitle: const Text(
              'Software Quality Assurance Professional · 1w',
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "I'm excited to share that I've successfully completed the Software Quality Assurance – Manual Course...",
            ),
          ),
          const SizedBox(height: 8),
          Image.network(
            'data:image/png;base64,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',
            fit: BoxFit.cover,
          ),
          const OverflowBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.thumb_up_alt_outlined),
              Icon(Icons.comment_outlined),
              Icon(Icons.repeat),
              Icon(Icons.send_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
