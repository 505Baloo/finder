import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:finder/providers/bachelor_provider.dart';

class BachelorMain extends StatefulWidget {
  const BachelorMain({Key? key}) : super(key: key);

  @override
  State<BachelorMain> createState() => _BachelorMainState();
}

class _BachelorMainState extends State<BachelorMain> {
  late BachelorProvider bachelorProvider;
  late double textScaleFactor;
  late double fontSize;

  @override
  void initState() {
    super.initState();
  }

  void _toggleDislike(Bachelor bachelor) {
    bachelorProvider.applyDislike(bachelor);
  }

  void _toggleLike(Bachelor bachelor) {
    bachelorProvider.applyLike(bachelor);
    if (bachelor.isLiked) {
      bachelorProvider.listOfLikedBachelors.add(bachelor);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "You liked ${bachelor.firstName}'s profile!",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red.shade600,
        ),
      );
    } else {
      bachelorProvider.listOfLikedBachelors.remove(bachelor);
    }
  }

  @override
  Widget build(BuildContext context) {
    bachelorProvider = Provider.of<BachelorProvider>(context);
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
    fontSize = 16 * textScaleFactor;

    Widget buildBachelorsListView() {
      return Consumer<BachelorProvider>(
        builder: (context, bachelorProvider, _) {
          final bachelors = bachelorProvider.bachelors
              .where((element) => !element.isDisliked)
              .toList();
          return ListView.builder(
            itemCount: bachelors.length,
            itemBuilder: (BuildContext context, int index) {
              final bachelor = bachelors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(bachelor.avatar),
                ),
                title: Text(bachelor.firstName),
                subtitle: Text(parseSearchingForToString(bachelor.searchFor)),
                trailing: GestureDetector(
                  child:
                      bachelorProvider.listOfLikedBachelors.contains(bachelor)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Opacity(
                              opacity: 0.5, child: Icon(Icons.heart_broken)),
                  onTap: () => _toggleLike(bachelor),
                  onLongPressUp: () => _toggleDislike(bachelor),
                ),
                visualDensity: const VisualDensity(horizontal: -2),
                tileColor:
                    bachelorProvider.listOfLikedBachelors.contains(bachelor)
                        ? Colors.pink[200]
                        : Colors.white,
                onTap: () {
                  GoRouter.of(context).go('/details/$index');
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
