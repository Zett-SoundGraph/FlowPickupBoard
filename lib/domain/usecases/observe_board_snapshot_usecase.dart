import 'package:injectable/injectable.dart';

import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/domain/repositories/board_repository.dart';

@injectable
class ObserveBoardSnapshotUsecase {
  const ObserveBoardSnapshotUsecase(this._repository);

  final BoardRepository _repository;

  Stream<BoardSnapshot> call() => _repository.observeBoardSnapshot();
}
