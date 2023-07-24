import 'package:flutter/foundation.dart';
import 'package:stressed_out/models/event.dart';
import 'package:stressed_out/pages/event/event_service.dart';

class EventProvider extends ChangeNotifier {
  final EventService _eventService = EventService();

  // This calls the get events service call and update the data listeners.
  Future<void> getEvents(String userId) async {
    // TODO: Based on success or failure have to do basic things.
    await _eventService.getEvents(userId);
    notifyListeners();
  }

  // This calls the get event service call and update the data listeners.
  Future<void> getEvent(String eventId) async {
    // TODO: Based on response set the event details.
    await _eventService.getEvent(eventId);
    notifyListeners();
  }

  // This calls the event details service call and update the data listeners.
  Future<void> createEvent(Event event) async {
    // TODO: Based on success or failure have to do basic things.
    await _eventService.create(event);
    notifyListeners();
  }
}
