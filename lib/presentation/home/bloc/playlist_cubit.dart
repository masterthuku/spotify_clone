import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_playlist.dart';
import 'package:spotify/presentation/home/bloc/playlist_state.dart';
import 'package:spotify/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlaylistUseCase>().call();
    returnedSongs.fold((ifLeft) {
      emit(PlaylistLoadFailure());
    }, (data) {
      emit(PlayListLoaded(songs: data));
    });
  }
}
