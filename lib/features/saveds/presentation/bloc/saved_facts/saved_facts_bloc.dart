import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_facts_event.dart';
part 'saved_facts_state.dart';

class SavedFactsBloc extends Bloc<SavedFactsEvent, SavedFactsState> {
  SavedFactsBloc() : super(SavedFactsInitial()) {
    on<SavedFactsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
