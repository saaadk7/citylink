import 'package:flutter/material.dart';
//import 'package:iconify_flutter/iconify_flutter.dart';
//import 'package:iconify_flutter/icons/mdi.dart';
import 'package:citylink/services/account_service.dart';
import 'package:citylink/models/account_model.dart';
import 'package:shimmer/shimmer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AccountService accountService = AccountService();
  late Future<Account> _account;
  bool isLoggedIn = true; // Simulating login status

  @override
  void initState() {
    super.initState();
    _account = accountService.getAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add settings functionality
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.amber],
            ),
          ),
        ),
      ),
      body: FutureBuilder<Account>(
        future: _account,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerLoading();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading account details'));
          }

          final account = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfileSection(account),
                  const SizedBox(height: 20),
                  _buildLoginLogoutButton(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Submit Announcement'),
                  _buildAnnouncementBox(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Suggestions/Complaints'),
                  _buildSuggestionBox(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Watch History'),
                  // _buildWatchHistory(account.watchHistory),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Upcoming Services'),
                  _buildUpcomingServices(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(Account account) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(account.profileImageUrl),
        ),
        const SizedBox(height: 10),
        Text(
          account.username,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          account.email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Navigate to edit profile screen
          },
          child: const Text('Edit Profile'),
        ),
      ],
    );
  }

  Widget _buildLoginLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isLoggedIn = !isLoggedIn;
        });
      },
      child: Text(isLoggedIn ? 'Logout' : 'Login'),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAnnouncementBox() {
    final TextEditingController announcementController =
        TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: announcementController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your announcement',
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Submit announcement logic
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildSuggestionBox() {
    final TextEditingController suggestionController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: suggestionController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your suggestion/complaint',
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Submit suggestion/complaint logic
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildWatchHistory(List<Video> watchHistory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: watchHistory.map((video) {
        return Card(
          child: ListTile(
            leading: Image.network(video.thumbnailUrl),
            title: Text(video.title),
            subtitle: Text('${video.duration} • ${video.description}'),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildUpcomingServices() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildServiceCard('PORT'),
        _buildServiceCard('Job Alerts'),
        _buildServiceCard('Women Safety'),
      ],
    );
  }

  Widget _buildServiceCard(String serviceName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UnderConstructionPage(serviceName: serviceName),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.pink, Colors.amber],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            serviceName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100,
                height: 20,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150,
                height: 15,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnderConstructionPage extends StatelessWidget {
  final String serviceName;

  const UnderConstructionPage({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.amber],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'This is under construction',
          style: TextStyle(fontSize: 20, color: Colors.grey[600]),
        ),
      ),
    );
  }
}

class Video {
  final String thumbnailUrl;
  final String title;
  final String duration;
  final String description;

  Video({
    required this.thumbnailUrl,
    required this.title,
    required this.duration,
    required this.description,
  });
}
