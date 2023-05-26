import 'MultiPlayerPage.dart';
import 'SinglePlayerPage.dart';
import 'StartingPlayerSelection.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dooz()));

class Dooz extends StatefulWidget {
  @override
  State<Dooz> createState() => _DoozState();
}

class _DoozState extends State<Dooz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to ARE DooZ",
          style: TextStyle(color: Colors.white,),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/photo_2023-05-25_00-06-53.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    //elevation: 4,
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    //elevation: MaterialStateProperty.all<>(value)
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StartingPlayerSelection()
                    ));
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Single Player")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    //elevation: 4,
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    //elevation: MaterialStateProperty.all<>(value)
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MultiPLayerPage()
                    ));
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Multi Player")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


