import 'package:citylink/models/account_model.dart';

class AccountService {
  // Mock fetching account details
  Future<Account> getAccountDetails() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return Account(
      username: 'John Doe',
      email: 'johndoe@example.com',
      watchHistory: ['Video 1', 'Video 2', 'Video 3'],
      announcements: ['No Announcements'],
    );
  }

  // Mock updating account announcements
  Future<void> updateAnnouncements(String announcement) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // Handle announcement update logic here
  }
}
