import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_flutter/models/src/collection/collection.dart';

class DropdownCubit extends Cubit<Collection?> {
  DropdownCubit() : super(null); // Initial state with an empty string

  void updateDropdownValue(Collection collection) {
    emit(collection);
  }
}
