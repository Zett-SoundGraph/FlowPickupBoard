import 'package:injectable/injectable.dart';

import 'package:pickup_board/domain/repositories/menu_image_repository.dart';

@injectable
class GetTranslationUsecase {
  const GetTranslationUsecase(this._repository);

  final MenuImageRepository _repository;

  String? call({required String languageId, required String lang}) =>
      _repository.translate(languageId, lang);
}
