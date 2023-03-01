part of 'saved_facts_bloc.dart';

abstract class SavedFactsState extends Equatable {
  const SavedFactsState();
  
  @override
  List<Object> get props => [];
}

class SavedFactsInitial extends SavedFactsState {}
