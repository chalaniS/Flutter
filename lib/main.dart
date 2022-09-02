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

      debugShowCheckedModeBanner: false,  //use for remove banner of debug on appbar
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter demo',
      theme: ThemeData(primaryColor: Colors.lightBlue[800]),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],

            //use for add images to background, before add image, edit puspac,yaml
            // flexibleSpace: Image.asset(
            //   "assests/images.jpg",
            //   fit: BoxFit.cover,
            // ),

            bottom:  const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  text: 'Car',
                ),
                Tab(
                    icon: Icon(Icons.directions_transit),
                    text: 'Train',
                ),
                Tab(
                    icon: Icon(Icons.directions_bike),
                    text: 'Bike',
                ),
              ],
            ),
            //shadow of Appabar
            elevation: 8.0,
            backgroundColor: Colors.pinkAccent,
          ),
        body:  const TabBarView(
          children: [
            // tab1(),
            Icon(
              Icons.directions_car,
              size: 60.0,
            ),
             Icon(
              Icons.directions_transit,
              size: 60.0,
            ),
             Icon(
              Icons.directions_bike,
              size: 60.0,
            ),
          ],
        ),

        ),
    );

  }
}

// Widget tab1(){
//   return  Container(
//     child: const Center(
//       child: Text('From tab1 widget'),
//     ),
//   );
// }