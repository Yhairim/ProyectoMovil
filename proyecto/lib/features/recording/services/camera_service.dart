import 'package:flutter/foundation.dart';

class CameraService extends ChangeNotifier {
  bool _isRecording = false;
  bool get isRecording => _isRecording;
  void toggleRecording() {
    _isRecording = !_isRecording;
    notifyListeners();
  }
}
