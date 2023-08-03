import 'package:api/model/api.dart';
import 'package:api/screen/detail_of_product/components/counter_and_favorite_icon.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerFactory<CartCounterAndFavoriteIcon>(
      () => CartCounterAndFavoriteIcon(
            product: locator(),
          ));
}
