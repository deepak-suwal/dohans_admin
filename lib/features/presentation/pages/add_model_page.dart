import 'package:admin/core/injection/injection.dart';
import 'package:admin/core/util/extension.dart';
import 'package:admin/core/widget/app_button.dart';
import 'package:admin/features/data/model/brand_model.dart';
import 'package:admin/features/data/model/device_model.dart';
import 'package:admin/features/presentation/bloc/drop_down_cubit.dart';
import 'package:admin/features/presentation/bloc/home_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_flutter/models/src/collection/collection.dart';

@RoutePage()
class AddModelPage extends StatelessWidget {
  final List<Collection> collectionList;

  AddModelPage({super.key, required this.collectionList});

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final homeBloc = getIt<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    String? brandId;
    String? deviceId;
    return BlocProvider(
      create: (context) => DropdownCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              StreamBuilder(
                stream: _fireStore.collection('brand').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    final brand = snapshot.data?.docs;

                    final list = brand
                        ?.map((e) => BrandModel.fromJson(e.data()))
                        .toList();

                    return DropdownButtonFormField(
                      value: null,
                      isDense: true,
                      onChanged: (newValue) {
                        brandId = newValue?.brandId;
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Brand',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.red.shade200,
                            width: 5,
                          ),
                        ),
                      ),
                      items: list?.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.brandName),
                        );
                      }).toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              24.verticalSpace,
              StreamBuilder(
                stream: _fireStore.collection('devices').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    final devices = snapshot.data?.docs;

                    final list = devices
                        ?.map((e) => DeviceModel.fromJson(e.data()))
                        .toList();

                    return DropdownButtonFormField(
                      value: null,
                      isDense: true,
                      onChanged: (newValue) {
                        deviceId = newValue?.deviceId;
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Device',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.red.shade200,
                            width: 5,
                          ),
                        ),
                      ),
                      items: list?.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.deviceName),
                        );
                      }).toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              24.verticalSpace,
              BlocBuilder<DropdownCubit, Collection?>(
                builder: (context, collection) {
                  return Column(
                    children: [
                      DropdownButtonFormField(
                        value: collection,
                        isDense: true,
                        onChanged: (newValue) {
                          context
                              .read<DropdownCubit>()
                              .updateDropdownValue(newValue!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Select Model',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.red.shade200,
                              width: 5,
                            ),
                          ),
                        ),
                        items: collectionList.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.title),
                          );
                        }).toList(),
                      ),
                      24.verticalSpace,
                      AppButton(
                        onPressed: () async {
                          final collection =
                              context.read<DropdownCubit>().state;
                          if (brandId == null) {
                            context.showErrorSnackBar('Select brand');
                          } else if (deviceId == null) {
                            context.showErrorSnackBar('Select device');
                          } else if (collection == null) {
                            context.showErrorSnackBar('Select model');
                          } else {
                            _fireStore.collection('model').add({
                              'deviceId': deviceId,
                              'collectionId': collection.id,
                              'collectionName': collection.title,
                              'imageUrl': collection.imageUrl,
                            }).then((value) => context
                                .showSuccessSnackBar('Added Successfully'));
                          }
                        },
                        buttonText: 'Add to Model',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
