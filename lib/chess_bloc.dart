import 'package:flame_chess/domain/entities/square.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChessBloc extends Cubit<ChessState> {
  ChessBloc() : super(ChessState(selectedSquare: null));

  void selectSquare(Square square) {
    emit(ChessState(selectedSquare: square));
  }
}

class ChessState {
  final Square? selectedSquare;

  ChessState({required this.selectedSquare});
}
