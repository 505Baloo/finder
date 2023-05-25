import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/search_for_helper.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({super.key, required this.bachelor});

  Widget displayBachelorDetails() {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Flexible(
          child: Card(
        child: Column(children: [
          Image.asset(bachelor.avatar),
          Text(bachelor.firstName),
          Text(bachelor.lastName),
          Text(bachelor.job.toString()),
          Text(parseSearchingForToString(bachelor.searchFor))
        ]),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Preview"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Return"),
        )));
  }
}
