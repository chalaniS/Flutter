import 'dart:async' show Future, StreamController;

import 'package:flutter/material.dart';

class ExampleStream extends StatefulWidget {
  const ExampleStream({super.key});

  @override
  State<ExampleStream> createState() => _ExampleStreamState();
}

class _ExampleStreamState extends State<ExampleStream> {
  // ignore: prefer_final_fields
  StreamController _controller = StreamController();

  addStreamData() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      _controller.sink.add(i);
    }
  }

  Stream<int> addStreamData2() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: addStreamData2().where((event) => event.isEven),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('error');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator.adaptive();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Stream Items'),
                    Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
