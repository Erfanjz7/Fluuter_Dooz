import 'package:dooz/MultiPlayerPage.dart';
import 'package:flutter/material.dart';
import 'SinglePlayerPage.dart';
import 'SinglePlayerPagePc.dart';
class StartingPlayerSelection extends StatefulWidget {
  @override
  State<StartingPlayerSelection> createState() => _StartingPlayerSelectionState();
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
              image: AssetImage('assets/images/nature-2384_640.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select The Starter:")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: (){
                  setState((){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SinglePLayerPage()
                    ));
                  });
                },child: Center(
                  child: Text("Person"),
                ))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SinglePlayerPagePc()
                    ));
                  });
                }, child: Center(
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
