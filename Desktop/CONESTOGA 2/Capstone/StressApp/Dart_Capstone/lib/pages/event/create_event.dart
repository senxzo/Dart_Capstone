import 'package:flutter/material.dart';
import 'package:stressed_out/models/event.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/utils/app_constants.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Event event = Event.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.createEvent),
      body: Material(
        elevation: 0.5,
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    event.title = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  minLines: 3,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    event.description = value!;
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Event Start Date & Time'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the event start date and time';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // Parse and set the event start date and time
                          event.eventStartDateTime = DateTime.parse(value!);
                        },
                      ),
                    ),
                    SizedBox(width: 32.0),
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Event End Date & Time'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the event end date and time';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // Parse and set the event end date and time
                          event.eventEndDateTime = DateTime.parse(value!);
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    event.location = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a status';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    event.status = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Text('Create Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
