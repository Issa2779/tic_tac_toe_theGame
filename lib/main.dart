import 'package:flutter/material.dart';
import 'tic_tac_toe.dart';

TicTacToe game = TicTacToe();

void main() => runApp(const Board());

class Board extends StatelessWidget {
  const Board({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(child: Text("Tic Tac Toe Prototype 1")),
          ),
          body: const TheBoard(),
        ),
      ),
    );
  }
}
class TheBoard extends StatefulWidget {
  const TheBoard({super.key});
  @override
  State<TheBoard> createState() => _TheBoardState();
}

class _TheBoardState extends State<TheBoard> {

  List<int> location = [1,2,3,4,5,6,7,8,9];
  static const double sizeFont = 50;
  String turnName = 'x';
  int turn = 1;

  void applyInput(int index,int row, int col){

    if(game.setInput(location[index], turnName)){
      print('DEBUG: No Change'); //Alert Dialog that the user needs to input in a different location
    }
    else{
      game.checkResult('Player $turn'); //A code that will stop the game once someone wins
      if(turn == 1){
        turn = 2;
      }
      else{
        turn = 1;
      }
      setState(() {
        game.getInput(row, col);
        turn;
      });
      makeTurn(turnName);
    }
  }
  void makeTurn(String turnName){
    if(turnName == 'x'){
      this.turnName = 'o';
      print(this.turnName); //Debug
    }
    else if(turnName == 'o'){
      this.turnName = 'x';
      print(this.turnName); //Debug
    }
  }

  Expanded buildRow1() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(0,0,0);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child:  Center(child: Text(game.getInput(0, 0), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(1,0,1);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(0, 1), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(2,0,2);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(0, 2), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Expanded buildRow2() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(3,1,0);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(1, 0), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(4,1,1);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(1, 1), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(5,1,2);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(1, 2), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Expanded buildRow3() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(6,2,0);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(2, 0), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(7,2,1);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(2, 1), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyInput(8,2,2);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: Center(child: Text(game.getInput(2, 2), style: const TextStyle(fontSize: sizeFont),),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Player $turn", style: const TextStyle(fontSize: sizeFont - 25),),),
          buildRow1(),
          buildRow2(),
          buildRow3(),
        ],
      ),
    );
  }
}