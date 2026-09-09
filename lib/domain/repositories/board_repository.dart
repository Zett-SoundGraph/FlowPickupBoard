import 'package:pickup_board/domain/entities/index.dart';

abstract interface class BoardRepository {
  Stream<BoardSnapshot> observeBoardSnapshot();
}
