import 'dart:async';

class CustomStream {
  final _controller = StreamController<String>();

  Stream<String> get customStream => _controller.stream;

  void startEmitting() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.sink.add('elemento nuevo en el stream');
    });
  }

  void dispose() {
    _controller.close();
  }
}
