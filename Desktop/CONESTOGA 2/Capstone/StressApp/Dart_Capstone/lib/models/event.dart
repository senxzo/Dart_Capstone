class Event {
  String id;
  String title;
  String description;
  DateTime eventStartDateTime;
  DateTime eventEndDateTime;
  String location;
  String status;
  String createdBy;
  DateTime createdDate;
  bool? requestedToJoin;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.eventStartDateTime,
    required this.eventEndDateTime,
    required this.location,
    required this.status,
    required this.createdBy,
    required this.createdDate,
  });

  Event.empty()
      : id = '',
        title = '',
        description = '',
        eventStartDateTime = DateTime.now(),
        eventEndDateTime = DateTime.now(),
        location = '',
        status = '',
        createdBy = '',
        createdDate = DateTime.now(),
        requestedToJoin = false;

  // Converting Event object to JSON.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'eventStartDateTime': eventStartDateTime,
      'eventEndDateTime': eventEndDateTime,
      'location': location,
      'status': status
    };
  }

  Event.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        description = data['description'],
        eventStartDateTime = data['eventStartDateTime'],
        eventEndDateTime = data['eventEndDateTime'],
        location = data['location'],
        status = data['status'],
        createdBy = data['createdBy'],
        createdDate = data['createdDate'],
        requestedToJoin = data['requestedToJoin'];
}
