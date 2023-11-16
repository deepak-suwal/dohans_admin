import 'package:admin/features/data/model/brand_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandCubit extends Cubit<BrandModel?> {
  BrandCubit() : super(null); // Initial state with an empty string

  void updateDropdownValue(BrandModel brandModel) {
    emit(brandModel);
  }
}
