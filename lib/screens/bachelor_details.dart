import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/tools/search_for_helper.dart';
import 'package:finder/enums/gender.dart';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview({super.key, required this.bachelor});
  final Bachelor bachelor;

  @override
  State<BachelorPreview> createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  late Bachelor bachelor;

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
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
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
      elevation: 4,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 500,
          child: ListTile(
            title: Text(
              bachelor.firstName,
              style: TextStyle(
                  color: bachelor.gender == Gender.male
                      ? Colors.blue
                      : Colors.pinkAccent,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            subtitle: Text(
              bachelor.lastName,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
              ),
            ),
            trailing: Text(bachelor.job != null ? bachelor.job.toString() : ""),
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 200,
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
          child: Text(parseSearchingForToString(bachelor.searchFor)),
        )
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
