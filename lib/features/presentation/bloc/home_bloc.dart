import 'package:admin/features/domain/i_home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopify_flutter/models/src/collection/collection.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<CollectionFetchEvent>((event, emit) async {
      emit(FetchCollectionLoading());
      await repository.getAllCollections(onSuccess: (data) {
        emit(FetchCollectionLoaded(data));
      }, onError: (error) {
        emit(FetchCollectionFailed(error));
      });
    });
  }
}

abstract class HomeEvent {}

class CollectionFetchEvent extends HomeEvent {
  CollectionFetchEvent();
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class FetchCollectionLoading extends HomeState {}

class FetchCollectionLoaded extends HomeState {
  final List<Collection> collectionList;

  FetchCollectionLoaded(this.collectionList);
}

class FetchCollectionFailed extends HomeState {
  final String error;

  FetchCollectionFailed(this.error);
}
