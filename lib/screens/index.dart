import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/fake_bachelors.dart';
import 'package:finder/tools/search_for_manager.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  void _display() {
    setState(() {});
  }

  List<Bachelor> listOfBachelors = generateRandomBachelors();

  Widget generateBachelorsListView() {
    return ListView.builder(
      itemCount: listOfBachelors.length,
      itemBuilder: (BuildContext context, int index) {
        Bachelor bachelor = listOfBachelors[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(bachelor.avatar),
          ),
          title: Text('${bachelor.firstName} ${bachelor.lastName}'),
          subtitle: Text('${bachelor.job}'),
          trailing: Text(parseSearchingForToString(bachelor.searchFor)),
          visualDensity: const VisualDensity(horizontal: -3),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finder"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: SizedBox(
          width: 700,
          child: generateBachelorsListView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _display,
        tooltip: 'Search!',
        child: const Icon(Icons.person_search_rounded),
      ),
    );
  }
}
