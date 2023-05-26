import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:finder/enums/gender.dart';

class BachelorDetails extends StatefulWidget {
  const BachelorDetails({super.key, required this.bachelor});
  final Bachelor bachelor;

  @override
  State<BachelorDetails> createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  late Bachelor bachelor;
  late double screenWidth = MediaQuery.of(context).size.width;

  @override
  void initState() {
    bachelor = widget.bachelor;
    super.initState();
  }

  void _toggleLike() {
    setState(() {
      bachelor.isLiked = !bachelor.isLiked;

      if (bachelor.isLiked) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "You liked ${bachelor.firstName.toString()}'s profile! ",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: screenWidth * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(
            seconds: 2,
          ),
          backgroundColor: Colors.red.shade600,
        ));
      }
    });
  }

  Widget buildBachelorDetailsCard() {
    return Card(
      color: bachelor.gender == Gender.male
          ? Colors.blue.shade100
          : Colors.pink.shade100,
      elevation: 4,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(25),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.45),
          child: ListTile(
            title: Text(
              "${bachelor.firstName} ${bachelor.lastName}",
              style: TextStyle(
                  color: bachelor.gender == Gender.male
                      ? Colors.blue
                      : Colors.pinkAccent,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.02),
            ),
            subtitle: Text(
              bachelor.job != null ? bachelor.job.toString() : "",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.02,
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
                opacity: bachelor.isLiked ? 0.5 : 0.2,
                child: GestureDetector(
                  onDoubleTap: _toggleLike,
                  child: Icon(
                    Icons.favorite,
                    color: bachelor.isLiked ? Colors.red : Colors.white,
                    size: 250,
                  ),
                )),
          ],
        ),
        Container(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              parseSearchingForToString(bachelor.searchFor),
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.02,
              ),
            ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${bachelor.firstName.toString()} Details"),
        ),
        body: Center(
            child: Column(
          children: [
            buildBachelorDetailsCard(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _toggleLike,
                    icon: Icon(Icons.favorite,
                        color: bachelor.isLiked ? Colors.red : Colors.grey)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Return"),
                )
              ],
            )
          ],
        )));
  }
}
