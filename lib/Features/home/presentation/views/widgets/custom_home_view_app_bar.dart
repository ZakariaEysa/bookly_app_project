import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../search/presentation/views/widgets/custom_search_text_field.dart';

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
      padding: const EdgeInsetsDirectional.only(top: 40, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(
          //   AssetsData.logo,
          //   width: 150,
          // ),
          SizedBox(
            width: 300,
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
                hintText: ' Search Here ...',
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.trim().isNotEmpty) {
                      GoRouter.of(context)
                          .push('/searchView?query=${searchController.text}');
                    }
                  },
                  icon: const Opacity(
                    opacity: .8,
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 22,
                    ),
                  ),
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),

          const Icon(
            FontAwesomeIcons.heart,
            size: 22,
          ),
        ],
      ),
    );
  }
}
