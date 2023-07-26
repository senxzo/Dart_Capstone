class NetworkResult {
  bool _status = false;
  String _message = '';
  dynamic _data;

  // Getters for the above properties.
  bool get status => _status;
  String get message => _message;
  dynamic get data => _data;

  // Setter for the status property
  set status(bool status) {
    if (status) {
      _status = status;
    }
  }

  // Setter for the message property
  set message(String message) {
    if (message.isNotEmpty) {
      _message = message;
    }
  }

  // Setter for the data property
  set data(dynamic data) {
    if (data) {
      _data = data;
    }
  }
}
