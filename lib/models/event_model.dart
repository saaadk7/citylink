// event_model.dart
class Event {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final DateTime date;
  final String category;

  Event({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.date,
    required this.category,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
