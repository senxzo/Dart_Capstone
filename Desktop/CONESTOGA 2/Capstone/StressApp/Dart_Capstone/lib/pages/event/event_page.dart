import 'package:flutter/material.dart';
import 'package:stressed_out/models/event.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class EventPage extends StatelessWidget {
  final Event event;

  EventPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              event.title,
              style: TextStyle(
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            subtitle: Text(
              event.description,
              style: TextStyle(
                color: AppColors.primarySwatch.shade500,
              ),
            ),
            trailing: getRequestButton(event.requestedToJoin ?? false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Start Time: ${FormatConstants.getDateFormat().format(event.eventStartDateTime)}'),
                AppDimens.height08(),
                Text(
                    'End Time: ${FormatConstants.getDateFormat().format(event.eventEndDateTime)}'),
                AppDimens.height08(),
                Text('Location: ${event.location}'),
                AppDimens.height08(),
                Text('Status: ${event.status}'),
                AppDimens.height08(),
                Text('Created By: ${event.createdBy}'),
                AppDimens.height08(),
                Text('Created Date: ${event.createdDate}'),
                AppDimens.height16(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getRequestButton(bool requestedToJoin) {
    return requestedToJoin
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              disabledBackgroundColor: AppColors.primarySwatch.shade50,
            ),
            onPressed: null,
            child: const Text(AppConstants.requestSent),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
            ),
            onPressed: () {},
            child: const Text(AppConstants.requestToJoin),
          );
  }
}
