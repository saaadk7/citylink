import 'package:citylink/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch all events
  Stream<List<Event>> getEvents() {
    return _db.collection('events').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());
  }

  // Add a new event
  Future<void> addEvent(Event event) async {
    await _db.collection('events').add(event.toJson());
  }
}
