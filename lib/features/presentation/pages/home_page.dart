import 'package:admin/core/injection/injection.dart';
import 'package:admin/core/util/extension.dart';
import 'package:admin/core/widget/app_button.dart';
import 'package:admin/features/presentation/bloc/drop_down_cubit.dart';
import 'package:admin/features/presentation/bloc/home_bloc.dart';
import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_flutter/models/src/collection/collection.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final homeBloc = getIt<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
        create: (context) => DropdownCubit(),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc..add(CollectionFetchEvent()),
          builder: (context, state) {
            if (state is FetchCollectionLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is FetchCollectionFailed) {
              return ErrorWidget(state.error);
            } else if (state is FetchCollectionLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    BlocBuilder<DropdownCubit, Collection?>(
                      builder: (context, collection) {
                        return DropdownButtonFormField(
                          value: collection,
                          isDense: true,
                          onChanged: (newValue) {
                            context
                                .read<DropdownCubit>()
                                .updateDropdownValue(newValue!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Select brand',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.red.shade200,
                                width: 5,
                              ),
                            ),
                          ),
                          items: state.collectionList.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.title),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    24.verticalSpace,
                    TapDebouncer(
                      onTap: () async {
                        final collection = context.read<DropdownCubit>().state;
                        if (collection != null) {
                          _fireStore.collection('brand').add({
                            'brandId': collection.id,
                            'title': collection.title,
                            'imageUrl': collection.imageUrl,
                          }).then((value) => context
                              .showSuccessSnackBar('Added Successfully'));
                        } else {
                          context.showErrorSnackBar('Select brand');
                        }
                      },
                      builder: (BuildContext context,
                          Future<void> Function()? onTap) {
                        return AppButton(
                          onTap: onTap!,
                          buttonText: 'Add to Brand',
                        );
                      },
                    ),
                    24.verticalSpace,
                    Expanded(
                      child: StreamBuilder(
                        stream: _fireStore.collection('brand').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final brand = snapshot.data?.docs;
                            return ListView.builder(
                              itemCount: brand?.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(brand?[index]['title']),
                                );
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
