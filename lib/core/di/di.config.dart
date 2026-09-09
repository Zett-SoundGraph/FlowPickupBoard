// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/board_repository_impl.dart' as _i779;
import '../../data/repositories/menu_repository_impl.dart' as _i668;
import '../../data/sources/mock/mock_board_data_source.dart' as _i140;
import '../../data/sources/remote/menu_sheet_data_source.dart' as _i25;
import '../../data/sources/remote/mqtt_board_data_source.dart' as _i870;
import '../../domain/repositories/board_repository.dart' as _i872;
import '../../domain/repositories/menu_image_repository.dart' as _i1028;
import '../../domain/usecases/get_menu_image_usecase.dart' as _i10;
import '../../domain/usecases/get_translation_usecase.dart' as _i67;
import '../../domain/usecases/index.dart' as _i447;
import '../../domain/usecases/observe_board_snapshot_usecase.dart' as _i684;
import '../../presentation/cubit/pickup_board/pickup_board_cubit.dart' as _i237;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.singleton<_i25.IMenuSheetDataSource>(() => _i25.MenuSheetDataSource());
  gh.singleton<_i1028.MenuImageRepository>(
    () => _i668.MenuRepositoryImpl(gh<_i25.IMenuSheetDataSource>()),
  );
  gh.factory<_i10.GetMenuImageUsecase>(
    () => _i10.GetMenuImageUsecase(gh<_i1028.MenuImageRepository>()),
  );
  gh.factory<_i67.GetTranslationUsecase>(
    () => _i67.GetTranslationUsecase(gh<_i1028.MenuImageRepository>()),
  );
  gh.singleton<_i140.IBoardDataSource>(() => _i870.MqttBoardDataSource());
  gh.singleton<_i872.BoardRepository>(
    () => _i779.BoardRepositoryImpl(gh<_i140.IBoardDataSource>()),
  );
  gh.factory<_i684.ObserveBoardSnapshotUsecase>(
    () => _i684.ObserveBoardSnapshotUsecase(gh<_i872.BoardRepository>()),
  );
  gh.factory<_i237.PickupBoardCubit>(
    () => _i237.PickupBoardCubit(
      gh<_i447.ObserveBoardSnapshotUsecase>(),
      gh<_i447.GetMenuImageUsecase>(),
      gh<_i447.GetTranslationUsecase>(),
    ),
  );
  return getIt;
}
