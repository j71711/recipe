import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<LoadCategoryEvent>((event, emit) {
      emit(
        CategoryLoaded(
          title: event.title,
          recipes: event.recipes,
      
        ),
      );
    });
  }
}