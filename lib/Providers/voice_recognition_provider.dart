import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceRecognitionProvider extends ChangeNotifier {
  late stt.SpeechToText speech;
  bool isListening = false;
  String _currentText = 'Press the button and start speaking';
  List<String> _textList = [];

  VoiceRecognitionProvider() {
    speech = stt.SpeechToText();
    _readFromFile();
  }

  String get currentText => _currentText;
  List<String> get textList => _textList;

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListening = true;
        speech.listen(
          localeId: 'ar',
          onResult: (result) {
            _currentText = result.recognizedWords;
            notifyListeners();
          },
        );
      }
    } else {
      speech.stop();
      isListening = false;
      notifyListeners();
    }
  }

  Future<void> saveToFile(context) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/transcription.txt';
    final file = File(path);

    // Append the new text to the file
    await file.writeAsString('$_currentText\n', mode: FileMode.append);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Saved to $path'),
    ));
    // Re-read the file to update the displayed list
    await _readFromFile();
  }

  Future<void> _readFromFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/transcription.txt';
      final file = File(path);

      if (await file.exists()) {
        String fileContent = await file.readAsString();
        List<String> lines =
            fileContent.split('\n').where((line) => line.isNotEmpty).toList();
        _textList = lines;
      } else {
        _textList = [];
      }
      notifyListeners();
    } catch (e) {
      print('Failed to read the file: $e');
    }
  }

  void clearCurrentText() {
    _currentText = 'Press the button and start speaking';
    notifyListeners();
  }
}
