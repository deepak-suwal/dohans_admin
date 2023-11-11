import 'package:shopify_flutter/models/src/collection/collection.dart';

abstract class IHomeRepository {
  Future<void> getAllCollections({
    required Function(List<Collection>) onSuccess,
    required Function(String) onError,
  });
}
