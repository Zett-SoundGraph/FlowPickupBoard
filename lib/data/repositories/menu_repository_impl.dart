import 'package:injectable/injectable.dart';

import 'package:pickup_board/data/sources/remote/menu_sheet_data_source.dart';
import 'package:pickup_board/domain/repositories/menu_image_repository.dart';

@Singleton(as: MenuImageRepository)
class MenuRepositoryImpl implements MenuImageRepository {
  const MenuRepositoryImpl(this._dataSource);

  final IMenuSheetDataSource _dataSource;

  @override
  Future<void> load() => _dataSource.load();

  @override
  String? imageUrlFor(String skuNo) => _dataSource.imageUrlFor(skuNo);

  @override
  String? translate(String languageId, String lang) => _dataSource.translate(languageId, lang);
}
