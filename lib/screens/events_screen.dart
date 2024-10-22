import 'package:flutter/material.dart';

class Event {
  final String title;
  final String date;
  final String time;
  final String location;
  final String category;
  final List<String> attendees;
  final String imageUrl;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
    required this.attendees,
    required this.imageUrl,
  });
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<Event> events = [
    Event(
      title: 'Dribbble Meetup 2019',
      date: '26th May 2019',
      time: '10:00 AM - 11:00 AM',
      location: 'Sylhet, Bangladesh',
      category: 'Meetup',
      attendees: ['Alice', 'Bob', 'Charlie'],
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Event(
      title: 'Festivals and Fairs',
      date: '17th September 2021',
      time: '10:00 AM - 05:00 PM',
      location: 'Sylhet, Bangladesh',
      category: 'Festival',
      attendees: ['David', 'Eva', 'Frank'],
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Event(
      title: 'Music Fest 2022',
      date: '22nd August 2022',
      time: '06:00 PM - 09:00 PM',
      location: 'Dhaka, Bangladesh',
      category: 'Music',
      attendees: ['John', 'Doe', 'Jane'],
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Event(
      title: 'Comedy Night',
      date: '15th July 2022',
      time: '08:00 PM - 11:00 PM',
      location: 'Chittagong, Bangladesh',
      category: 'Comedy',
      attendees: ['Sam', 'Chris', 'Alex'],
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  int _currentPageCategories = 0;
  int _currentPageEvents = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Events',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeaturedEvent(events.first),
              const SizedBox(height: 20),
              _buildSectionTitleWithDots(
                  'Event Categories', _currentPageCategories, 2),
              const SizedBox(height: 10),
              _buildVerticalCategoryPagination(),
              const SizedBox(height: 20),
              _buildSectionTitleWithDots(
                  'Upcoming Events', _currentPageEvents, 2),
              _buildUpcomingEvents(),
              const SizedBox(height: 20),
              _buildShowMoreButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Build the featured event section (centered)
  Widget _buildFeaturedEvent(Event event) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.pinkAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.location,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Going',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build vertical pagination with dots
  Widget _buildVerticalCategoryPagination() {
    return SizedBox(
      height: 220, // Adjusted height for multiple rows
      child: PageView.builder(
        scrollDirection: Axis.vertical, // Vertical scroll
        onPageChanged: (int page) {
          setState(() {
            _currentPageCategories = page;
          });
        },
        itemCount: 2, // Two pages for category rows
        itemBuilder: (context, index) {
          return _buildEventCategories(index); // Row 1 and Row 2
        },
      ),
    );
  }

  // Build vertical pagination with dots for upcoming events
  Widget _buildUpcomingEvents() {
    return SizedBox(
      height: 320, // Adjusted height for multiple rows
      child: PageView.builder(
        scrollDirection: Axis.vertical, // Vertical scroll
        onPageChanged: (int page) {
          setState(() {
            _currentPageEvents = page;
          });
        },
        itemCount: 2, // Two pages for upcoming events
        itemBuilder: (context, index) {
          return _buildEventCards(
              index); // First and second row of upcoming events
        },
      ),
    );
  }

  // Dots for active row indicator (vertical pagination)
  Widget _buildDot(int currentPage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4), // Vertical spacing
      width: 10,
      height: currentPage == index ? 10 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  // Build the event categories (3 cards per row)
  Widget _buildEventCategories(int pageIndex) {
    List<Widget> categories = const [
      _EventCategoryCard(icon: Icons.event, label: 'Meetup'),
      _EventCategoryCard(icon: Icons.cake, label: 'Birthday'),
      _EventCategoryCard(icon: Icons.music_note, label: 'Music'),
      _EventCategoryCard(icon: Icons.theater_comedy, label: 'Comedy'),
      _EventCategoryCard(icon: Icons.sports_soccer, label: 'Sports'),
      _EventCategoryCard(icon: Icons.travel_explore, label: 'Travel'),
    ];

    // Show 3 categories per row
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Prevent scrolling inside GridView
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 3, // Show 3 per row
      itemBuilder: (context, index) {
        return categories[
            pageIndex * 3 + index]; // Index within the current row
      },
    );
  }

  // Build the event cards for upcoming events (two pages)
  Widget _buildEventCards(int pageIndex) {
    List<Widget> eventCards = events.map((event) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: const Color(0xff052659), // Use primary color for the card
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(event.imageUrl),
              radius: 30,
            ),
            title: Text(
              event.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for upcoming events
              ),
            ),
            subtitle: Text(
              '${event.date} • ${event.time}',
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Handle event tap
            },
          ),
        ),
      );
    }).toList();

    // Return the correct 2 events per page
    return Column(
      children: [
        eventCards[pageIndex * 2],
        eventCards[pageIndex * 2 + 1],
      ],
    );
  }

  // Section Title Widget with vertical dots for row indicator
  Widget _buildSectionTitleWithDots(
      String title, int currentPage, int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // Vertical dots indicator on the same line as the title
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              pageCount, (index) => _buildDot(currentPage, index)),
        ),
      ],
    );
  }

  // "Show More" Button
  Widget _buildShowMoreButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle show more functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent, // Button color matching theme
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text('Show More'),
      ),
    );
  }
}

// Event category card
class _EventCategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _EventCategoryCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.black
          .withOpacity(0.8), // Use darker color for better visibility
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 25,
              child: Icon(icon, size: 30, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white, // White text for category labels
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
