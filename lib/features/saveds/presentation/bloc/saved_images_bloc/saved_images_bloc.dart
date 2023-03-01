import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_images_event.dart';
part 'saved_images_state.dart';

class SavedImagesBloc extends Bloc<SavedImagesEvent, SavedImagesState> {
  SavedImagesBloc() : super(SavedImagesInitial()) {
    on<SavedImagesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
