import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stressed_out/models/event.dart';
import 'package:stressed_out/utils/app_constants.dart';

// This contains all the user network actions.
class EventService {
  // This fetches all events by calling the event list endpoint.
  Future<List<Event>> getEvents(String userId) async {
    const url = AppUrls.domain + AppUrls.eventList;
    List<Event> events = <Event>[];

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({'id': userId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // TODO: Convert the response to events object.
        return events;
      } else {
        //return 'There was a problem fetching events. Please try again later';
        return events;
      }
    } catch (error) {
      print('Event list error: $error');
      //return 'Unable to fetch events';
      return events;
    }
  }

  // This fetches a single event by calling the event details endpoint.
  Future<Event> getEvent(String eventId) async {
    const url = AppUrls.domain + AppUrls.eventDetails;
    Event event = Event.empty();

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({'id': eventId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // TODO: Convert the response to event object.
        return event;
      } else {
        //return 'There was a problem fetching a event. Please try again later';
        return event;
      }
    } catch (error) {
      print('Single event fetch error: $error');
      //return 'Unable to fetch the event';
      return event;
    }
  }

  // This is used to create a post by calling post create endpoint.
  Future<String> create(Event event) async {
    const url = AppUrls.domain + AppUrls.eventCreate;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(event.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return 'Event created successfully!';
      } else {
        return 'There was a problem creating an event. Please try again later';
      }
    } catch (error) {
      print('Event creation error: $error');
      return 'Unable to create an event';
    }
  }
}
