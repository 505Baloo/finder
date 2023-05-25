import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/fake_bachelors.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:finder/screens/bachelor_preview.dart';

class BachelorMain extends StatefulWidget {
  const BachelorMain({super.key});

  @override
  State<BachelorMain> createState() => _BachelorMainState();
}

class _BachelorMainState extends State<BachelorMain> {
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
          // subtitle: Text('${bachelor.job}'),
          subtitle: Text(parseSearchingForToString(bachelor.searchFor)),
          visualDensity: const VisualDensity(horizontal: -3),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => BachelorPreview(
                      bachelor: bachelor,
                    )));
          },
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
          width: 400,
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
