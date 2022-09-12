// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NetworkRequest extends StatefulWidget {
  const NetworkRequest({super.key, required String title});

  @override
  State<NetworkRequest> createState() => _NetworkRequestState();
}

class _NetworkRequestState extends State<NetworkRequest> {
  //simulate network NetworkRequest
  Future<String> getData() async {
    //simulate network request to get user email
    String email = await Future.delayed(const Duration(seconds: 3), () {
      // ignore: avoid_print
      return 'chalani@gmail.com';
    });

    // await Future.delayed(const Duration(seconds: 2), () {
    //   // ignore: avoid_print
    //   print('name: chalani , age : 21');
    // });

    // ignore: avoid_print, prefer_interpolation_to_compose_strings
    // print(email + '\nother codes');
    return email;
  }

  Future<void> getNetworkRequest() async {
    // ignore: avoid_print
    print(await getData());
  }

  @override
  void initState() {
    super.initState();
    getNetworkRequest();
    // ignore: avoid_print
    print('Another lines runs without waiting');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Asynchronous Programming "),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'GET DATA',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      )),
    );
  }
}
