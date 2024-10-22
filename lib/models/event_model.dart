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

  // Convert Firestore Document to Event model
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      category: json['category'] ?? '',
      attendees: List<String>.from(json['attendees'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Convert Event model to JSON format for Firestore
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'time': time,
      'location': location,
      'category': category,
      'attendees': attendees,
      'imageUrl': imageUrl,
    };
  }
}
