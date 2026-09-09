import 'package:injectable/injectable.dart';

import 'package:pickup_board/data/sources/mock/mock_board_data_source.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/domain/repositories/board_repository.dart';

@Singleton(as: BoardRepository)
class BoardRepositoryImpl implements BoardRepository {
  const BoardRepositoryImpl(this._dataSource);

  final IBoardDataSource _dataSource;

  @override
  Stream<BoardSnapshot> observeBoardSnapshot() =>
      _dataSource.observeBoardSnapshot();
}
