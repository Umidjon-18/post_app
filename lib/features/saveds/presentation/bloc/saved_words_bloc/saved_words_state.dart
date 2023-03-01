part of 'saved_words_bloc.dart';

abstract class SavedWordsState extends Equatable {
  const SavedWordsState();
  
  @override
  List<Object> get props => [];
}

class SavedWordsInitial extends SavedWordsState {}
