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
            title: const Center(child: Text("Tic Tac Toe Prototype 2")),
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
  List<int> location = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  static const double sizeFont = 50;
  bool disableGestures = false;
  String turnName = 'x';
  int turn = 1;

  void applyInput(int index, int row, int col) {
    if (game.setInput(location[index], turnName)) {
      showAlert("Please pick another field", "Warning");
    } else {
      if (!game.checkResult()) {
        showAlertWinner(context, game.getResult(), 'Result');

      } else if (turn == 1) {
        turn = 2;
        makeTurn(turnName);
      } else{
        turn = 1;
        makeTurn(turnName);
      }
      setState(() {
        game.getInput(row, col);
        turn;
      });
    }
  }
  void makeTurn(String turnName) {
    if (turnName == 'x') {
      this.turnName = 'o';
    } else if (turnName == 'o') {
      this.turnName = 'x';
    }
  }
  void showAlertWinner(BuildContext context, String content, String title) {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    turn = 1;
                    turnName = 'x';
                    game.resetGame();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Restart'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    disableGestures = true;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }
  void showAlert(String content,String title){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  Expanded buildGesture(int index, int row, int col) {
    return Expanded(
      child: IgnorePointer(
        ignoring: disableGestures,
        child: GestureDetector(
          onTap: () {
            applyInput(index, row, col);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Text(
                  game.getInput(row, col),
                  style: const TextStyle(fontSize: sizeFont),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildRow1() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGesture(0, 0, 0),
          buildGesture(1, 0, 1),
          buildGesture(2, 0, 2),
        ],
      ),
    );
  }

  Expanded buildRow2() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGesture(3, 1, 0),
          buildGesture(4, 1, 1),
          buildGesture(5, 1, 2),
        ],
      ),
    );
  }

  Expanded buildRow3() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGesture(6, 2, 0),
          buildGesture(7, 2, 1),
          buildGesture(8, 2, 2),
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
          Center(
            child: Text(
              "Player $turn",
              style: const TextStyle(fontSize: sizeFont - 25),
            ),
          ),
          buildRow1(),
          buildRow2(),
          buildRow3(),
        ],
      ),
    );
  }
}
