import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/fake_bachelors.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:finder/screens/bachelor_details.dart';
import 'package:go_router/go_router.dart';

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
            // hoverColor: bachelor.gender == Gender.male
            //     ? Colors.blue.shade100
            //     : Colors.red.shade100,
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            title: Text(bachelor.firstName),
            // subtitle: Text('${bachelor.job}'),
            subtitle: Text(parseSearchingForToString(bachelor.searchFor)),
            visualDensity: const VisualDensity(horizontal: -2),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BachelorDetails(
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
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: buildBachelorsListView(),
        ),
      ),
    );
  }
}
