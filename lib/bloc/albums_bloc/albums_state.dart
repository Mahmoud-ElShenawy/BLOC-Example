part of 'albums_bloc.dart';

abstract class AlbumsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

@immutable
class AlbumsLoaded extends AlbumsState {
  final List<AlbumsModel> albums;
  AlbumsLoaded({required this.albums});
}

class AlbumsListError extends AlbumsState {
  final dynamic error;
  AlbumsListError({this.error});
}
