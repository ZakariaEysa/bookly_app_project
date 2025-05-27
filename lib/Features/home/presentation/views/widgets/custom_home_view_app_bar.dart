import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../search/presentation/views/widgets/custom_search_text_field.dart';
import '../../providers/favorites_provider.dart';

class CustomHomeViewAppBar extends StatefulWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  State<CustomHomeViewAppBar> createState() => _CustomHomeViewAppBarState();
}

class _CustomHomeViewAppBarState extends State<CustomHomeViewAppBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(
          //   AssetsData.logo,
          //   width: 150,
          // ),
          SizedBox(
            width: 300.w,
            child: TextField(
              controller: searchController,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  GoRouter.of(context).push('/searchView?query=$value');
                }
              },
              decoration: InputDecoration(
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                hintText: ' Search For Books ...',
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.trim().isNotEmpty) {
                      GoRouter.of(context)
                          .push('/searchView?query=${searchController.text}');
                    }
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
              textInputAction: TextInputAction.search,
            ),
          ),

          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                '/favoriteList',
              );
            },
            child: Icon(
              FontAwesomeIcons.heart,
              size: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}
