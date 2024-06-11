import 'package:flutter/material.dart';
import 'package:wflutter_kit/http/requests.dart';
import 'package:wflutter_kit/ui/component/page/w_app_bar.dart';

main() {
  runApp(MaterialApp(
    home: TestMainPage(),
  ));
}

class TestMainPage extends StatefulWidget {
  const TestMainPage({super.key});

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  _doRequest() {
    // Requests.instance().getRequest("/get");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, title: "asd11"),
      body: Center(
        child: ElevatedButton(
          onPressed: _doRequest,
          child: Text("click me!!"),
        ),
      ),
    );
  }
}
