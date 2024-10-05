import 'package:spotify/domain/entitites/song/song.dart';

abstract class PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlayListLoaded extends PlaylistState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlaylistLoadFailure extends PlaylistState {}
