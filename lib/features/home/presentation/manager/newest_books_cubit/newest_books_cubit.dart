import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNum = 0}) async {
    if(pageNum==0){
      emit(NewestBooksLoading());
    } else{
      emit(NewestBooksPaginationLoading());
    }


    var result = await newestBooksUseCase.call(pageNum);

    result.fold((failure) {
      if(pageNum==0){
        emit(NewestBooksFailure(failure.message));
      }else{
        emit(NewestBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
