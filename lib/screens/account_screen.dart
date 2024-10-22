import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo.png"),
        title: const Text("Account", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Settings functionality
            },
          ),
          const CircleAvatar(radius: 15),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Section
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_pic.jpg'), // Replace with actual image
              ),
              const SizedBox(height: 10),
              const Text(
                'User Name', // Replace with actual name
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Account Settings and Login/Logout Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to account settings
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff052659),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: const Text('Account Settings',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Login/Logout functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff052659),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: const Text('Login/Logout',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Redesigned TabBar Section (Trending, Bookmarked, Favorites)
              const TabBarSection(),

              const SizedBox(height: 20),

              // Watch History Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Watch History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Horizontal Scrollable List for Watch History
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Replace with actual count
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text('Thumbnail'), // Replace with image
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              const Placeholder(
                  fallbackHeight: 50), // Replace with actual content
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tabs with Icons and Text
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.trending_up), text: 'Trending'),
            Tab(icon: Icon(Icons.bookmark), text: 'Bookmarked'),
            Tab(icon: Icon(Icons.star), text: 'Favorites'),
          ],
        ),
        SizedBox(
          height: 200, // Placeholder height for tab content
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(
                  child: Text('Trending Content',
                      style: TextStyle(color: Colors.white))),
              Center(
                  child: Text('Bookmarked Content',
                      style: TextStyle(color: Colors.white))),
              Center(
                  child: Text('Favorites Content',
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
