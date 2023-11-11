import 'package:admin/features/domain/i_home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shopify_flutter/models/src/collection/collection.dart';
import 'package:shopify_flutter/shopify/src/shopify_store.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  ShopifyStore shopifyStore = ShopifyStore.instance;

  @override
  Future<void> getAllCollections({
    required Function(List<Collection>) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      final response = await shopifyStore.getAllCollections();
      onSuccess.call(response);
    } catch (e) {
      onError('Error occurred');
    }
  }
}
