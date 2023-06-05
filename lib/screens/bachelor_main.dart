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
  @override
  void initState() {
    super.initState();
    Provider.of<BachelorProvider>(context, listen: false)
        .setBachelors(generateRandomBachelors());
    Provider.of<BachelorProvider>(context, listen: false)
        .setLikes(List.empty(growable: true));
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
                trailing:
                    bachelorProvider.listOfLikedBachelors.contains(bachelor)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.heart_broken),
                visualDensity: const VisualDensity(horizontal: -2),
                tileColor:
                    bachelorProvider.listOfLikedBachelors.contains(bachelor)
                        ? Colors.pink[200]
                        : Colors.white,
                onTap: () {
                  final selectedBachelor = bachelors[index];
                  bachelorProvider.selectBachelor(selectedBachelor);
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
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).go('/likes');
                },
                child: const Icon(Icons.shopping_cart),
              ))
        ],
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
