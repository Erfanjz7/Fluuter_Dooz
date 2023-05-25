import 'package:dooz/SinglePlayerPage.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SinglePLayerPage extends StatefulWidget {
  @override
  State<SinglePLayerPage> createState() => _SinglePLayerPageState();
}

enum Player { computer, person }

enum Result { computer, person, tie, continuous }

List<int> square = List.filled(9, 0);
Player player = Player.person;

int computerMove() {
  int bestScore = -2;
  int bestMove = -1; //todo
  for (int i = 0; i <= 8; i++) {
    if (square[i] == 0) {
      square[i] = 1;
      int score = miniMax(square, false);
      square[i] = 0;

      if (score > bestScore) {
        bestScore = score;
        bestMove = i;
      }
    }
  }
  return bestMove + 1;
}

int miniMax(List tempSquares, bool isMaximizing) {
//checkWinner and calculate score
  Result result = checkWinner();
  if (result != Result.continuous) {
    if (result == Result.computer) {
      return 1;
    } else if (result == Result.person) {
      return -1;
    } else {
      return 0;
    }
  }
  int bestScore;
  if (isMaximizing) {
    bestScore = -2;
    for (int i = 0; i <= 8; i++) {
      if (tempSquares[i] == 0) {
        tempSquares[i] = 1;
        int score = miniMax(tempSquares, false);
        tempSquares[i] = 0;
        if (score > bestScore) {
          bestScore = score;
        }
      }
    }
  } else {
    bestScore = 2;
    for (int i = 0; i <= 8; i++) {
      if (tempSquares[i] == 0) {
        tempSquares[i] = 2;
        int score = miniMax(tempSquares, true);
        tempSquares[i] = 0;
        if (score < bestScore) {
          bestScore = score;
        }
      }
    }
  }
  return bestScore;
}

Player changePosition(Player x) {
  if (x == Player.person) {
    return Player.computer;
  } else {
    return Player.person;
  }
}

Result checkWinner() {
  if (square[0] == square[1] &&
      square[0] == square[2] &&
      square[0] != 0) {
    if (square[0] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[3] == square[4] &&
      square[3] == square[5] &&
      square[3] != 0) {
    if (square[3] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[6] == square[7] &&
      square[6] == square[8] &&
      square[6] != 0) {
    if (square[6] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[0] == square[3] &&
      square[0] == square[6] &&
      square[0] != 0) {
    if (square[0] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[1] == square[4] &&
      square[1] == square[7] &&
      square[1] != 0) {
    if (square[1] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[2] == square[5] &&
      square[2] == square[8] &&
      square[2] != 0) {
    if (square[2] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[0] == square[4] &&
      square[0] == square[8] &&
      square[0] != 0) {
    if (square[0] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[2] == square[4] &&
      square[2] == square[6] &&
      square[2] != 0) {
    if (square[2] == 1) {
      return Result.computer;
    } else {
      return Result.person;
    }
  } else if (square[0] != 0 &&
      square[1] != 0 &&
      square[2] != 0 &&
      square[3] != 0 &&
      square[4] != 0 &&
      square[5] != 0 &&
      square[6] != 0 &&
      square[7] != 0 &&
      square[8] != 0) {
    return Result.tie;
  } else {
    return Result.continuous;
  }
}

String text1 = "";
String text2 = "";
String text3 = "";
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
int pcCurrentnumber = 0;

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
String Winner = "";
void WinnerChecker(){
  Result temp=checkWinner();
  if(Result.continuous!=temp){
    if(Result.person==temp){
      allDisable();
      Winner = "Winner Is X!";
    }else if(Result.computer==temp){
      allDisable();
      Winner = "Winnr Is O";
    }else{
      allDisable();
      Winner = "Tie Game. Better Luck Next Time!";
    }
  }
}
void pcTurn(int a){
  if(a != pcCurrentnumber) {
    if(pcCurrentnumber == 1){
      text1 = "O";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    if(pcCurrentnumber == 2){
      text2 = "O";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 3){
      text3 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 4){
      text4 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 5){
      text5 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 6){
      text6 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 7){
      text7 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 8){
      text8 = "0";
      square[pcCurrentnumber-1]=1;
      WinnerChecker();
      player = changePosition(player);
    }
    else if(pcCurrentnumber == 9) {
      text9 = "0";
      square[pcCurrentnumber - 1] = 1;
      WinnerChecker();
      player = changePosition(player);
    }
   }
  }


class _SinglePLayerPageState extends State<SinglePLayerPage> {
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
      print("babe");
      print(square.toString());
      square[0] = 0;
      square[1] = 0;
      square[2] = 0;
      square[3] = 0;
      square[4] = 0;
      square[5] = 0;
      square[6] = 0;
      square[7] = 0;
      square[8] = 0;
      print(square.toString());
      currentNumber = 0;
      pcCurrentnumber = 0;
      player = Player.person;
      Winner = "";
    });
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
          backgroundColor: Colors.black,
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
                  image: AssetImage('assets/images/HD-wallpaper-half-white-black-thumbnail.jpg'),
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
                          if (player == Player.person) {
                          text1 = "X";
                          } else {
                          text1 = "O";
                          }
                         player = changePosition(player);
                         isButtonActive1 = false;
                         currentNumber = 1;
                         square[currentNumber - 1] = 2;
                         WinnerChecker();
                         pcCurrentnumber = computerMove();
                         if(player == Player.computer){
                           pcTurn(1);
                         }
                        });
                        } : null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                         foregroundColor: MaterialStateProperty.all(Colors.white),
                         shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                         )),
                         textStyle: MaterialStateProperty.all(TextStyle(
                         fontSize: 16,
                         color: Colors.white,
                        )),
                         elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text4 = "X";
                            } else {
                              text4 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive4 = false;
                            currentNumber = 4;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(4);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text7 = "X";
                            } else {
                              text7 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive7 = false;
                            currentNumber = 7;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer) {
                              pcTurn(7);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text2 = "X";
                            } else {
                              text2 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive2 = false;
                            currentNumber = 2;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                             pcTurn(2);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text5 = "X";
                            } else {
                              text5 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive5 = false;
                            currentNumber = 5;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(5);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text8 = "X";
                            } else {
                              text8 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive8 = false;
                            currentNumber = 8;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(8);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text3 = "X";
                            } else {
                              text3 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive3 = false;
                            currentNumber = 3;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(3);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text6 = "X";
                            } else {
                              text6 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive6 = false;
                            currentNumber = 6;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(6);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
                            if (player == Player.person) {
                              text9 = "X";
                            } else {
                              text9 = "O";
                            }
                            player = changePosition(player);
                            isButtonActive9 = false;
                            currentNumber = 9;
                            square[currentNumber - 1] = 2;
                            WinnerChecker();
                            Result temp=checkWinner();
                            if(Result.continuous!=temp){
                              if(Result.person==temp){
                                //person
                              }else if(Result.computer==temp){
                                //computer
                              }else{
                                //tie
                              }
                            }
                            pcCurrentnumber = computerMove();
                            if(player == Player.computer){
                              pcTurn(9);
                            }
                          });
                        } : null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(

                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                            elevation: MaterialStateProperty.all(10),
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
