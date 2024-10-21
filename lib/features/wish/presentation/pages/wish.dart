import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/routes/app_routes.dart';
import 'package:bloc_practise/core/ui/pages/error/error_page.dart';
import 'package:bloc_practise/core/ui/pages/laoding_page.dart';
import 'package:bloc_practise/core/ui/widgets/gradient_container.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:bloc_practise/features/wish/bloc/wish_bloc.dart';
import 'package:bloc_practise/features/wish/presentation/widgets/wish_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wish extends StatefulWidget {
  const Wish({super.key});

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish> {
  final WishBloc wishBloc = WishBloc();
  @override
  void initState() {
    wishBloc.add(WishInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    wishBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => wishBloc,
      child: BlocConsumer<WishBloc, WishState>(
        listenWhen: (previous, current) => current is WishActionState,
        buildWhen: (previous, current) => current is! WishActionState,
        listener: (context, state) {
          if (state is WishNavigateToHomeState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              toHomeRoute,
              (route) => false,
            );
          } else if (state is WishNavigateToCartState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              toCartRoute,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is WishLoadingState) {
            return const LaodingPage();
          } else if (state is WishSuccessState) {
            final success = state;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Wish'),
                flexibleSpace: gradientContainer,
                actions: [
                  IconButton(
                    onPressed: () {
                      wishBloc.add(WishNavigateToHomeEvent());
                    },
                    icon: homeIcon,
                  ),
                  IconButton(
                    onPressed: () {
                    
                    },
                    icon: wishIconFilled,
                  ),
                  IconButton(
                    onPressed: () {
                      wishBloc.add(WishNavigateCartEvent());
                    },
                    icon: cartIcon,
                  ),
                ],
              ),
              body: ListView.builder(
                  itemBuilder: (context, index) => WishProductTile(
                        list: success.wishItems[index],
                      )),
            );
          } else if (state is WishErrorState) {
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
