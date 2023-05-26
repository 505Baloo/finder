import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/fake_bachelors.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:finder/screens/bachelor_details.dart';

class BachelorMain extends StatefulWidget {
  const BachelorMain({super.key});

  @override
  State<BachelorMain> createState() => _BachelorMainState();
}

class _BachelorMainState extends State<BachelorMain> {
  late List<Bachelor> _bachelors;

  @override
  void initState() {
    super.initState();
    _bachelors = generateRandomBachelors();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildBachelorsListView() {
      return ListView.builder(
        itemCount: _bachelors.length,
        itemBuilder: (BuildContext context, int index) {
          Bachelor bachelor = _bachelors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            title: Text(bachelor.firstName),
            // subtitle: Text('${bachelor.job}'),
            subtitle: Text(parseSearchingForToString(bachelor.searchFor)),
            visualDensity: const VisualDensity(horizontal: -2),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finder"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: buildBachelorsListView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Search!',
        child: const Icon(Icons.person_search_rounded),
      ),
    );
  }
}
