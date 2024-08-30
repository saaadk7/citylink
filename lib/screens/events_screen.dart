import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';
//import 'package:iconify_flutter/iconify_flutter.dart';
//import 'package:iconify_flutter/icons/mdi.dart';
import 'package:citylink/services/event_service.dart';
import 'package:citylink/models/event_model.dart'; // Import your Event model

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CityLink Events')),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Add filter functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Toolbar functionality like settings, help, etc.
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Event>>(
        stream: eventService.getEvents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final events = snapshot.data!;
          final tournaments =
              events.where((e) => e.category == 'Tournament').toList();
          final upcomingShows =
              events.where((e) => e.category == 'Upcoming Show').toList();
          final contests =
              events.where((e) => e.category == 'Contest').toList();
          final recentShows =
              events.where((e) => e.category == 'Recent Show').toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Tournaments'),
                _buildCarousel(tournaments),
                _buildSectionTitle('Upcoming Shows'),
                _buildCarousel(upcomingShows),
                _buildSectionTitle('Contests'),
                _buildContestTabs(contests),
                _buildSectionTitle('Recent Shows'),
                _buildVideoGrid(recentShows),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20, // Smaller font size
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCarousel(List<Event> events) {
    return CarouselSlider.builder(
      itemCount: events.length,
      itemBuilder: (context, index, realIdx) {
        final event = events[index];
        return _buildEventCard(event);
      },
      options: CarouselOptions(
        height: 180, // Adjusted height
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
      ),
    );
  }

  Widget _buildContestTabs(List<Event> events) {
    return const DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(text: "Contest 1"),
              Tab(text: "Contest 2"),
              Tab(text: "Contest 3"),
              Tab(text: "Contest 4"),
            ],
          ),
          SizedBox(
            height: 300, // Adjust as needed
            child: TabBarView(
              children: [
                Center(child: Text("Content for Contest 1")),
                Center(child: Text("Content for Contest 2")),
                Center(child: Text("Content for Contest 3")),
                Center(child: Text("Content for Contest 4")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoGrid(List<Event> events) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return _buildVideoCard(event);
        },
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return OpenContainer(
      closedBuilder: (context, action) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Image.network(event.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  event.title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
      openBuilder: (context, action) => EventDetailsScreen(event: event),
    );
  }

  Widget _buildVideoCard(Event event) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(event.imageUrl,
                  fit: BoxFit.cover, width: double.infinity, height: 150),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    event.title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Video Title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Handle more shows functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(event.imageUrl),
            const SizedBox(height: 16),
            Text(
              event.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Date: ${event.date}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
