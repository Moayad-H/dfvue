class TranscriptionModel {
  final String text;
  final DateTime timestamp;

  TranscriptionModel({required this.text, required this.timestamp});

  Map<String, dynamic> toJson() => {
        'text': text,
        'timestamp': timestamp.toIso8601String(),
      };

  static TranscriptionModel fromJson(Map<String, dynamic> json) =>
      TranscriptionModel(
        text: json['text'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
