import 'package:flutter/material.dart';
import 'main.dart';

class MultiPLayerPage extends StatefulWidget {
  @override
  State<MultiPLayerPage> createState() => _MultiPLayerPageState();
}



List<int> square = List.filled(9, 0);
String Winner = "";
int counter = 0;

String text1 = "";
String text3 = "";
String text2 = "";
String text4 = "";
String text5 = "";
String text6 = "";
String text7 = "";
String text8 = "";
String text9 = "";
bool isButtonActive1 = true;
bool isButtonActive2 = true;
bool isButtonActive3 = true;
bool isButtonActive4 = true;
bool isButtonActive5 = true;
bool isButtonActive6 = true;
bool isButtonActive7 = true;
bool isButtonActive8 = true;
bool isButtonActive9 = true;
int currentNumber = 0;

void allDisable(){
  isButtonActive1 = false;
  isButtonActive2 = false;
  isButtonActive3 = false;
  isButtonActive4 = false;
  isButtonActive5 = false;
  isButtonActive6 = false;
  isButtonActive7 = false;
  isButtonActive8 = false;
  isButtonActive9 = false;
}

class _MultiPLayerPageState extends State<MultiPLayerPage> {
  void reestart(){
    setState(() {
      isButtonActive1 = true;
      isButtonActive2 = true;
      isButtonActive3 = true;
      isButtonActive4 = true;
      isButtonActive5 = true;
      isButtonActive6 = true;
      isButtonActive7 = true;
      isButtonActive8 = true;
      isButtonActive9 = true;
      text1 = "";
      text2 = "";
      text3 = "";
      text4 = "";
      text5 = "";
      text6 = "";
      text6 = "";
      text7 = "";
      text8 = "";
      text9 = "";
      square[0] = 0;
      square[1] = 0;
      square[2] = 0;
      square[3] = 0;
      square[4] = 0;
      square[5] = 0;
      square[6] = 0;
      square[7] = 0;
      square[8] = 0;
      counter = 0;
      currentNumber = 0;
      Winner = "";
    });
  }
  void winnerhecker(){
    if((square[0] == square[1] && square[0] == square[2] && square[0] == 2) ||
        (square[3] == square[4] && square[3] == square[5] && square[3] == 2) ||
        (square[6] == square[7] && square[6] == square[8] && square[6] == 2) ||
        (square[0] == square[3] && square[0] == square[6] && square[0] == 2) ||
        (square[1] == square[4] && square[1] == square[7] && square[1] == 2) ||
        (square[2] == square[5] && square[2] == square[8] && square[2] == 2) ||
        (square[0] == square[4] && square[0] == square[8] && square[0] == 2) ||
        (square[2] == square[4] && square[2] == square[6] && square[2] == 2))
    {
      allDisable();
      Winner = "X is winner!";
    }
    else if ((square[0] == square[1] && square[0] == square[2] && square[0] == 1) ||
        (square[3] == square[4] && square[3] == square[5] && square[3] == 1) ||
        (square[6] == square[7] && square[6] == square[8] && square[6] == 1) ||
        (square[0] == square[3] && square[0] == square[6] && square[0] == 1) ||
        (square[1] == square[4] && square[1] == square[7] && square[1] == 1) ||
        (square[2] == square[5] && square[2] == square[8] && square[2] == 1) ||
        (square[0] == square[4] && square[0] == square[8] && square[0] == 1) ||
        (square[2] == square[4] && square[2] == square[6] && square[2] == 1))
    {
      allDisable();
      Winner = "O is winner!";
    }
    else if(square[0] != 0 && square[1] != 0 && square[2] != 0 && square[3] != 0 && square[4] != 0 && square[5] != 0 &&
        square[6] != 0 && square[7] != 0 && square[8] != 0){
      Winner = "Tie Game, Better Luck Next Time!";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Single Player Mode!",
          style: TextStyle(color: Colors.white , fontSize: 19),
        ),
        centerTitle: true,
        leading: IconButton(
          icon : Icon (Icons.arrow_back_ios_sharp , color: Colors.white,) ,onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Dooz()
          ));
        },
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon : Icon (Icons.restart_alt , color: Colors.white,) ,onPressed: reestart,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/HD-wallpaper-orange-poster-gradient-white-yellow-thumbnail.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              height: 700,
              width: 400,
              child :  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive1? (){
                              setState(() {
                                isButtonActive1 = false;
                                currentNumber = 1;
                                if(counter % 2 == 0){
                                  text1 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text1 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive4? (){
                              setState(() {
                                isButtonActive4 = false;
                                currentNumber = 4;
                                if(counter % 2 == 0){
                                  text4 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text4 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive7? (){
                              setState(() {
                                isButtonActive7 = false;
                                currentNumber = 7;
                                if(counter % 2 == 0){
                                  text7 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text7 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text7),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive2? (){
                              setState(() {
                                isButtonActive2 = false;
                                currentNumber = 2;
                                if(counter % 2 == 0){
                                  text2 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text2 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text2),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive5? (){
                              setState(() {
                                isButtonActive5 = false;
                                currentNumber = 5;
                                if(counter % 2 == 0){
                                  text5 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text5 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text5),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive8? (){
                              setState(() {
                                isButtonActive8 = false;
                                currentNumber = 8;
                                if(counter % 2 == 0){
                                  text8 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text8 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive3? (){
                              setState(() {
                                isButtonActive3 = false;
                                currentNumber = 3;
                                if(counter % 2 == 0){
                                  text3 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text3 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text3),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive6? (){
                              setState(() {
                                isButtonActive6 = false;
                                currentNumber = 6;
                                if(counter % 2 == 0){
                                  text6 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text6 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text6),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: isButtonActive9? (){
                              setState(() {
                                isButtonActive9 = false;
                                currentNumber = 9;
                                if(counter % 2 == 0){
                                  text9 = "X";
                                  square[currentNumber - 1] = 2;
                                }
                                else{
                                  text9 = "O";
                                  square[currentNumber - 1] = 1;
                                }
                                counter = counter + 1;
                                winnerhecker();
                              });
                            } : null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                                fixedSize: MaterialStateProperty.all(Size(100, 100))),
                            child: Center(
                              child: Text(text9),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text(Winner)
          ],
        ),
      ),

    );
  }
}
