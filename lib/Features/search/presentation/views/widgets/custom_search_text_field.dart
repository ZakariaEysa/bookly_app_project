import 'package:BookNest/Features/search/presentation/views/widgets/searched_list_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, this.initialQuery});

  final String? initialQuery;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.initialQuery ?? '');
    if ((widget.initialQuery ?? '').isNotEmpty) {
      setQuery(widget.initialQuery!);
      BlocProvider.of<SearchCubit>(context)
          .fetchSearchedBooks(pageNumber: 0, userQuery: widget.initialQuery!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          setQuery(value);

          BlocProvider.of<SearchCubit>(context)
              .fetchSearchedBooks(pageNumber: 0, userQuery: value);
        },
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {
              setQuery(searchController.text);

              BlocProvider.of<SearchCubit>(context).fetchSearchedBooks(
                  pageNumber: 0, userQuery: searchController.text);
            },
            icon: Opacity(
              opacity: .8,
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12.r),
    ),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
