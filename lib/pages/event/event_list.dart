import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stressed_out/models/event.dart';
import 'package:stressed_out/pages/event/event_page.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  Event event = Event(
    id: '1',
    title: 'Newly created event',
    description: 'This is the event description',
    eventStartDateTime: DateTime(2023, 7, 6, 10, 0),
    eventEndDateTime: DateTime(2023, 7, 6, 12, 0),
    location: 'Waterloo',
    status: 'Scheduled',
    createdBy: 'Manikiran, Garela',
    createdDate: DateTime(2023, 7, 6),
  );

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(fetchAlbum().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CommonComponents.tabbedAppBar(context, AppConstants.events),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 48.0),
          child: Column(
            children: [
              EventPage(event: event),
              EventPage(event: event),
              EventPage(event: event)
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarySwatch.shade900,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateEvent(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),*/
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
