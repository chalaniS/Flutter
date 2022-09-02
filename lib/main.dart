import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter demo',
      theme: ThemeData(
          primaryColor: Colors.lightBlue[800]
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter33'),
        leading: IconButton(
          icon: const Icon(Icons.menu), onPressed: () {  },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), onPressed: () {  },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert), onPressed: () {  },
          ),
        ],
        flexibleSpace: Icon(
          Icons.photo_camera,
          size: 75.0,
          color: Colors.pink[900],
        ),
      ),
    );
  }
}
