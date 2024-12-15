// import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
// import 'package:flutter/material.dart';
// import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
//
// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key, required this.books});
//
//   final List<BookEntity> books;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: BookListViewItem(image: books[index].image ?? "",
//             author: books[index].authorName ?? "",
//             title: books[index].title,),
//         );
//       },
//     );
//   }
// }
