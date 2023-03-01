part of 'saved_images_bloc.dart';

abstract class SavedImagesState extends Equatable {
  const SavedImagesState();
  
  @override
  List<Object> get props => [];
}

class SavedImagesInitial extends SavedImagesState {}
