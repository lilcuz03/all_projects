import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/routes/app_routes.dart';
import 'package:bloc_practise/core/ui/pages/error/error_page.dart';
import 'package:bloc_practise/core/ui/pages/laoding_page.dart';
import 'package:bloc_practise/core/ui/widgets/gradient_container.dart';
import 'package:bloc_practise/core/ui/widgets/product_tile.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          // if (state is HomeAddToCartState) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Item Added to Cart')));
          // } else if (state is HomeAddToWishState) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(const SnackBar(content: wishIcon));
          // } 
           if (state is HomeNavigateToCartState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(toCartRoute, (route) => false);
          } else if (state is HomeNavigateToWishState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(toWishRoute, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const LaodingPage();
          } else if (state is HomeSuccessState) {
            final success = state;
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Tafadzwa'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeNavigateToCartIconEvent());
                        },
                        icon: homeIconFilled),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeNavigateToWishIconEvent());
                        },
                        icon: wishIcon),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeNavigateToCartIconEvent());
                        },
                        icon: cartIcon),
                  ],
                  flexibleSpace: gradientContainer,
                ),
                body: ListView.builder(
                    itemCount: success.dataModel.length,
                    itemBuilder: (context, index) => ProductTile(
                          list: success.dataModel[index],
                        )));
          } else if (state is HomeErrorState) {
            return const ErrorPage();
          } else {
            return const ErrorPage(
              text: 'Jinks',
            );
          }
        },
      ),
    );
  }
}
