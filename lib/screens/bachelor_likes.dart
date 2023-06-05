import 'package:finder/providers/bachelor_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class BachelorLikes extends StatelessWidget {
  const BachelorLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(builder: (context, bachelorProvider, _) {
      return Scaffold(
        body: ListView.builder(
            itemCount: bachelorProvider.listOfLikedBachelors.length,
            itemBuilder: (BuildContext context, int index) => Card(
                elevation: 8,
                color: Colors.pink[200],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        bachelorProvider.listOfLikedBachelors[index].avatar),
                  ),
                  title: Text(
                      bachelorProvider.listOfLikedBachelors[index].firstName),
                  subtitle: Text(
                      (bachelorProvider.listOfLikedBachelors[index].job == null
                          ? ''
                          : bachelorProvider.listOfLikedBachelors[index].job
                              .toString())),
                  onTap: () {
                    GoRouter.of(context).go(
                        '/details/${bachelorProvider.listOfLikedBachelors[index].id}');
                  },
                ))),
      );
    });
  }
}
