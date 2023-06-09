import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finder/providers/bachelor_provider.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:finder/enums/gender.dart';

class BachelorDetails extends StatefulWidget {
  const BachelorDetails({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  BachelorDetailsState createState() => BachelorDetailsState();
}

class BachelorDetailsState extends State<BachelorDetails> {
  late double screenWidth;
  late double textScaleFactor;
  late double fontSize;
  late BachelorProvider bachelorProvider;

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

  Widget buildBachelorDetailsCard(Bachelor bachelor) {
    return Card(
      color: bachelor.gender == Gender.male
          ? Colors.blue.shade100
          : Colors.pink.shade100,
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: ListTile(
              title: Text(
                "${bachelor.firstName} ${bachelor.lastName}",
                style: TextStyle(
                  color: bachelor.gender == Gender.male
                      ? Colors.blue
                      : Colors.pinkAccent,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScaleFactor,
                ),
              ),
              subtitle: Text(
                bachelor.job != null ? bachelor.job.toString() : "",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  bachelor.avatar,
                  fit: BoxFit.cover,
                ),
              ),
              Opacity(
                opacity: bachelor.isLiked ? 0.6 : 0.2,
                child: GestureDetector(
                  onDoubleTap: () => _toggleLike(bachelor),
                  child: Icon(
                    Icons.favorite,
                    color: bachelor.isLiked ? Colors.red : Colors.white,
                    size: 250,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              parseSearchingForToString(bachelor.searchFor),
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bachelorProvider = Provider.of<BachelorProvider>(context);
    int id = widget.id;
    final bachelor = bachelorProvider.getById(id);

    screenWidth = MediaQuery.of(context).size.width;
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
    fontSize = 16 * textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text("${bachelor.firstName} Details"),
      ),
      body: Center(
        child: Column(
          children: [
            buildBachelorDetailsCard(bachelor),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _toggleLike(bachelor),
                  icon: Icon(
                    Icons.favorite,
                    color: bachelor.isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => GoRouter.of(context).go('/'),
                  child: const Text("Return"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
