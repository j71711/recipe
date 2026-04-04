part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  CategoryLoaded({
    required this.title,
    required this.recipes,
  
  });

  final String title;
  final List recipes;

}