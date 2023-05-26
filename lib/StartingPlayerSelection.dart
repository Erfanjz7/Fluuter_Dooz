import 'package:dooz/MultiPlayerPage.dart';
import 'package:flutter/material.dart';
import 'SinglePlayerPage.dart';
import 'SinglePlayerPagePc.dart';

class StartingPlayerSelection extends StatefulWidget {
  @override
  State<StartingPlayerSelection> createState() =>
      _StartingPlayerSelectionState();
}

class _StartingPlayerSelectionState extends State<StartingPlayerSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1477279.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: null,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )),
                        elevation: MaterialStateProperty.all(10),
                        fixedSize: MaterialStateProperty.all(Size(350, 100))),
                    child: Center(
                      child: Text("Who Will Start The Game?"),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SinglePLayerPage()
                    ));
                  });
                },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.teal),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                        elevation: MaterialStateProperty.all(10),
                        fixedSize: MaterialStateProperty.all(Size(200, 50))),
                    child: Center(
                      child: Text("Person"),


                    ))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SinglePlayerPagePc()
                    ));
                  });
                },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.teal),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                        elevation: MaterialStateProperty.all(10),
                        fixedSize: MaterialStateProperty.all(Size(200, 50))),
                    child: Center(
                      child: Text("Computer"),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
