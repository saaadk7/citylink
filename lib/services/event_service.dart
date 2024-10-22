import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:citylink/models/event_model.dart';
class EventService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream that returns a list of events in real-time
  Stream<List<Event>> getEvents() {
    return _db.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList();
    });
  }

  // Add an event to Firestore
  Future<void> addEvent(Event event) {
    return _db.collection('events').add(event.toJson());
  }
}
