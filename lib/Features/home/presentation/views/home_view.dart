import '../providers/favorites_provider.dart';
import 'widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    FavoritesProvider().getList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}
