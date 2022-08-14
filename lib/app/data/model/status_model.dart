class Status {
  int? elapsed;
  String? timestamp;

  Status({this.elapsed, this.timestamp});

  Status.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    timestamp = json['timestamp'];
  }
}
