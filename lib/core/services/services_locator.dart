import 'package:get_it/get_it.dart';
import 'package:zyntra/core/services/api_services.dart';
import 'package:zyntra/core/services/storage_data.dart';
import 'package:zyntra/features/asky/data/repos/asky_repo_imp.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<StorageData>(StorageData());

  getIt.registerSingleton<ApiServices>(ApiServices());

  getIt.registerSingleton<AskyRepoImp>(AskyRepoImp(getIt.get<ApiServices>()));
}
