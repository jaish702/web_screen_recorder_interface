import 'dart:async';

import 'package:flutter/services.dart';

import 'flutter_screen_recording_platform_interface.dart';

class MethodChannelFlutterScreenRecording
    extends FlutterScreenRecordingPlatform {
  static const MethodChannel _channel =
      MethodChannel('flutter_screen_recording');

  @override
  Future<bool> startRecordScreen(String name) async {
    final bool start = await _channel
        .invokeMethod('startRecordScreen', {"name": name, "audio": false});
    return start;
  }

  @override
  Future<bool> startRecordScreenAndAudio(String name) async {
    final bool start = await _channel
        .invokeMethod('startRecordScreen', {"name": name, "audio": true});
    return start;
  }

  @override
  Future<String> get stopRecordScreen async {
    final String path = await _channel.invokeMethod('stopRecordScreen');
    return path;
  }
}
