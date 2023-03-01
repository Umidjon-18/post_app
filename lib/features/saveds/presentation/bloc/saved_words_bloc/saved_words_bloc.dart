import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_words_event.dart';
part 'saved_words_state.dart';

class SavedWordsBloc extends Bloc<SavedWordsEvent, SavedWordsState> {
  SavedWordsBloc() : super(SavedWordsInitial()) {
    on<SavedWordsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
