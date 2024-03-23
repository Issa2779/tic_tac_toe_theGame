class TicTacToe {
  static List<List<String>> _board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  static const String _x = 'x';
  static const String _o = 'o';
  static late String _result;
  TicTacToe();

  void resetGame() {
    _board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
  }

  String getInput(int row, int col) {
    return _board[row][col];
  }

  String getResult() {
    return _result;
  }

  bool setInput(int input, String xo) {
    switch (input) {
      case 1:
        return _inputValidate(xo, 0, 0);
      case 2:
        return _inputValidate(xo, 0, 1);
      case 3:
        return _inputValidate(xo, 0, 2);
      case 4:
        return _inputValidate(xo, 1, 0);
      case 5:
        return _inputValidate(xo, 1, 1);
      case 6:
        return _inputValidate(xo, 1, 2);
      case 7:
        return _inputValidate(xo, 2, 0);
      case 8:
        return _inputValidate(xo, 2, 1);
      case 9:
        return _inputValidate(xo, 2, 2);
      default:
        break;
    }
    return true;
  }

  bool _inputValidate(String xo, int row, int col) {
    if (_board[row][col] == _x || _board[row][col] == _o) {
      return true;
    } else {
      _board[row][col] = xo;
      return false;
    }
  }

  bool checkResult() {
    int countX = 0;
    int countO = 0;

    // Check Diagonal _x and O left to right
    for (int i = 0; i < _board.length; i++) {
      if (_board[i][i] == _x) {
        countX++;
        if (countX == 3) {
          //showAlertWinner(context,'Player 1 Wins', '_result');
          _result = 'Player 1 Wins';
          return false;
        }
      } else if (_board[i][i] == _o) {
        countO++;
        if (countO == 3) {
          _result = 'Player 2 Wins';
          return false;
        }
      }
    }
    countX = 0;
    countO = 0;

    // Check Diagonal _x and O right to left
    for (int i = 0, j = 2; i < _board.length; i++, j--) {
      if (_board[i][j] == _x) {
        countX++;
        if (countX == 3) {
          _result = 'Player 1 Wins';
          return false;
        }
      } else if (_board[i][j] == _o) {
        countO++;
        if (countO == 3) {
          _result = 'Player 2 Wins';
          return false;
        }
      }
    }

    countX = 0;
    countO = 0;
    // Check Horizontal O and _x
    for (int i = 0; i < _board.length; i++) {
      for (int j = 0; j < _board[i].length; j++) {
        if (_board[i][j] == _x) {
          countX++;
          if (countX == 3) {
            _result = 'Player 1 Wins';
            return false;
          }
        } else if (_board[i][j] == _o) {
          countO++;
          if (countO == 3) {
            _result = 'Player 2 Wins';
            return false;
          }
        }
      }
      countX = 0;
      countO = 0;
    }
    // Check vertical _x and O
    for (int j = 0; j < _board.length; j++) {
      for (int i = 0; i < _board.length; i++) {
        if (_board[i][j] == _x) {
          countX++;
          if (countX == 3) {
            _result = 'Player 1 Wins';
            return false;
          }
        } else if (_board[i][j] == _o) {
          countO++;
          if (countO == 3) {
            _result = 'Player 2 Wins';
            return false;
          }
        }
      }
      countX = 0;
      countO = 0;
    }
    // Check if draw
    int countD = 0;

    for (int i = 0; i < _board.length; i++) {
      for (int j = 0; j < _board[i].length; j++) {
        if (_board[i][j] == _x || _board[i][j] == _o) {
          countD++;
        }
      }
    }
    if (countD == 9) {
      _result = 'It is a Draw';
      return false;
    }

    return true;
  }
}