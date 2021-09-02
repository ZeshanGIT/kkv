import 'package:get_it/get_it.dart';
import 'package:kkv/services/navigator_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
