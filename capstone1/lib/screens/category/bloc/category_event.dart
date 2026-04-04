part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class LoadCategoryEvent extends CategoryEvent {
  LoadCategoryEvent({
    required this.title,
    required this.recipes,
   
  });

  final String title;
  final List recipes;

}