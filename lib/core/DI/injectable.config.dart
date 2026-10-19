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

import '../../features/categories/presentation/cubit/categories_cubit.dart'
    as _i802;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/data/sources/home_data_source.dart' as _i249;
import '../../features/home/data/sources/home_data_source_impl.dart' as _i254;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use%20cases/get_news_use_case.dart' as _i180;
import '../../features/home/domain/use%20cases/get_sources_use_case.dart'
    as _i667;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/search/data/repo/search_repo_impl.dart' as _i396;
import '../../features/search/data/sources/search_data_source.dart' as _i481;
import '../../features/search/data/sources/search_data_source_impl.dart'
    as _i317;
import '../../features/search/domain/repo/search_repo.dart' as _i1033;
import '../../features/search/domain/use_cases/search_use_case.dart' as _i601;
import '../../features/search/presentation/cubit/search_cubit.dart' as _i341;
import '../api/api_manager.dart' as _i1047;
import '../cache/cache.dart' as _i228;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i802.CategoriesCubit>(() => _i802.CategoriesCubit());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i228.HiveCacheHelper>(() => _i228.HiveCacheHelper());
    gh.factory<_i249.HomeDataSource>(
      () => _i254.HomeDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i481.SearchDataSource>(
      () => _i317.SearchDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i280.HomeRepo>(
      () => _i1024.HomeRepoImpl(gh<_i249.HomeDataSource>()),
    );
    gh.factory<_i180.GetNewsUseCase>(
      () => _i180.GetNewsUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i667.GetSourcesUseCase>(
      () => _i667.GetSourcesUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i1033.SearchRepo>(
      () =>
          _i396.SearchRepoImpl(searchDataSource: gh<_i481.SearchDataSource>()),
    );
    gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(
        gh<_i667.GetSourcesUseCase>(),
        gh<_i180.GetNewsUseCase>(),
      ),
    );
    gh.factory<_i601.SearchUseCase>(
      () => _i601.SearchUseCase(gh<_i1033.SearchRepo>()),
    );
    gh.factory<_i341.SearchCubit>(
      () => _i341.SearchCubit(searchUseCase: gh<_i601.SearchUseCase>()),
    );
    return this;
  }
}
