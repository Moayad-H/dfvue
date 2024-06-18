import 'dart:convert';
import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/models/transcriptionModel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text_provider.dart';

class VoiceRecognitionProvider extends ChangeNotifier {
  late stt.SpeechToText speech;
  bool isListening = false;
  String? _currentText = '';
  List<TranscriptionModel> _textList = [];
  String _saveStatusMessage = '';
  RecorderController controller = RecorderController();
  VoiceRecognitionProvider() {
    speech = stt.SpeechToText();
    readFromFile();
  }

  String? get currentText => _currentText;
  List<TranscriptionModel> get textList => _textList;
  String get saveStatusMessage => _saveStatusMessage;

  void listen(Locale? locale, String text) async {
    if (!isListening) {
      isListening = true;
      notifyListeners();
      bool available = await speech.initialize(onStatus: (val) {
        print('onStatus: $val');
      }, onError: (val) {
        print('onError: $val');
        isListening = false;
        controller.stop();
        notifyListeners();
      });

      if (available) {
        await speech.listen(
          localeId: locale!.languageCode,
          onResult: (result) {
            _currentText = result.recognizedWords;
            notifyListeners();
            if (speech.isNotListening) {
              speech.stop();
              isListening = false;
              notifyListeners();
            }
          },
        );
        controller.record();
      }
    } else {
      speech.stop();
      isListening = false;
      notifyListeners();
    }
  }

  Future<void> saveToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/transcriptionJson2.txt';
      final file = File(path);

      final transcription = TranscriptionModel(
        text: _currentText!,
        timestamp: DateTime.now(),
      );

      await file.writeAsString('${jsonEncode(transcription.toJson())}\n',
          mode: FileMode.append);
      _saveStatusMessage = 'Transcription saved successfully!';
      //_currentText = 'Press the button and start speaking';
      await readFromFile();
    } catch (e) {
      _saveStatusMessage = 'Failed to save transcription: $e';
    }
    notifyListeners();
  }

  Future<void> readFromFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/transcriptionJson2.txt';
      final file = File(path);

      if (await file.exists()) {
        String fileContent = await file.readAsString();
        List<TranscriptionModel> transcriptions = fileContent
            .split('\n')
            .where((line) => line.isNotEmpty)
            .map((line) => TranscriptionModel.fromJson(jsonDecode(line)))
            .toList();
        _textList = transcriptions;
      } else {
        _textList = [];
      }
    } catch (e) {
      print('Failed to read the file: $e');
    }
    notifyListeners();
  }

  Future<void> deleteTranscription(int index) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/transcriptionJson2.txt';
      final file = File(path);

      _textList.removeAt(index);

      // Rewrite the file with the updated list
      await file.writeAsString(
        '${_textList.map((transcription) => jsonEncode(transcription.toJson())).join('\n')}\n',
        mode: FileMode.write,
      );
      _saveStatusMessage = 'Transcription deleted successfully!';
    } catch (e) {
      _saveStatusMessage = 'Failed to delete transcription: $e';
    }
    notifyListeners();
  }

  void clearCurrentText(BuildContext context) {
    _currentText = '';
    notifyListeners();
  }
}
