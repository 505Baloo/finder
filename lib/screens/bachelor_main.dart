import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/fake_bachelors.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:finder/providers/bachelor_provider.dart';

class BachelorMain extends StatefulWidget {
  const BachelorMain({super.key});

  @override
  State<BachelorMain> createState() => _BachelorMainState();
}

class _BachelorMainState extends State<BachelorMain> {
  // late List<Bachelor> _bachelors;

  @override
  void initState() {
    // _bachelors = generateRandomBachelors();
    super.initState();
    Provider.of<BachelorProvider>(context, listen: false)
        .setBachelors(generateRandomBachelors());
  }

  @override
  Widget build(BuildContext context) {
    Widget buildBachelorsListView() {
      return Consumer<BachelorProvider>(
        builder: (context, bachelorProvider, _) {
          final bachelors = bachelorProvider.bachelors;

          return ListView.builder(
            itemCount: bachelors.length,
            itemBuilder: (BuildContext context, int index) {
              Bachelor bachelor = bachelors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(bachelor.avatar),
                ),
                title: Text(bachelor.firstName),
                subtitle: Text(parseSearchingForToString(bachelor.searchFor)),
                visualDensity: const VisualDensity(horizontal: -2),
                onTap: () {
                  final selectedBachelor = bachelors[index];
                  Provider.of<BachelorProvider>(context, listen: false)
                      .selectBachelor(selectedBachelor);
                  GoRouter.of(context).go('/details/${selectedBachelor.id}');
                },
              );
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
