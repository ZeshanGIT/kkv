import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GetStorage _box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Role ${_box.read('role')}"),
            Text(_box.read('user').toString()),
          ],
        ),
      ),
    );
  }
}
