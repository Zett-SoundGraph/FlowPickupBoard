import 'package:injectable/injectable.dart';

import 'package:pickup_board/domain/repositories/menu_image_repository.dart';

@injectable
class GetMenuImageUsecase {
  const GetMenuImageUsecase(this._repository);

  final MenuImageRepository _repository;

  String? call(String skuNo) => _repository.imageUrlFor(skuNo);
}
