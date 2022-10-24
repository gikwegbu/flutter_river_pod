import 'package:flutter/material.dart';
import 'package:flutter_river_pod/ui/pages/change_notifier.dart';
import 'package:flutter_river_pod/ui/pages/future_provider.dart';
import 'package:flutter_river_pod/ui/pages/provider.dart';
import 'package:flutter_river_pod/ui/pages/state_notifier.dart';
import 'package:flutter_river_pod/ui/pages/state_provider.dart';
import 'package:flutter_river_pod/ui/pages/stream_provider.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod State Management'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProviderPage(color: Colors.teal),
                ),
              );
            },
            title: "Provider",
            color: Colors.teal[300],
          ),
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const StateProviderPage(color: Colors.orange),
                ),
              );
            },
            title: "State Provider",
            color: Colors.orange[300],
          ),
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FutureProviderPage(color: Colors.lime),
                ),
              );
            },
            title: "Future Provider",
            color: Colors.lime[300],
          ),
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const StreamProviderPage(color: Colors.red),
                ),
              );
            },
            title: "Stream Provider",
            color: Colors.red[300],
          ),
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ChangeNotifierPage(color: Colors.purple),
                ),
              );
            },
            title: "Change Notifier Provider",
            color: Colors.purple[300],
          ),
          pageButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const StateNotifierPage(color: Colors.blue),
                ),
              );
            },
            title: "State Notifier Provider",
            color: Colors.blue[300],
          ),
        ],
      ),
    );
  }

  Padding pageButton(
      {required VoidCallback press, String? title, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () => press(),
        minWidth: double.infinity,
        color: color,
        child: Text(title.toString()),
      ),
    );
  }
}
