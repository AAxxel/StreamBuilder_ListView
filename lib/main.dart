import 'package:flutter/material.dart';
import 'package:pruebacorta_ii/widget/counter_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stream Counter',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _customStream = CustomStream();
  List<String> events = []; 
  
  @override
  void initState() {
    super.initState();
    _customStream.startEmitting();
    _customStream.customStream.listen((event) {
      setState(() {
        events.add(event); 
      });
    });
  }

  @override
  void dispose() {
    _customStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Counter"),
      ),
      body: ListView.builder(
        itemCount: events.length, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index]), 
          );
        },
      ),
    );
  }
}
