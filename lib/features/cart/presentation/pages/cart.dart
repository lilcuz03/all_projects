import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/routes/app_routes.dart';
import 'package:bloc_practise/core/ui/pages/error/error_page.dart';
import 'package:bloc_practise/core/ui/pages/laoding_page.dart';
import 'package:bloc_practise/core/ui/widgets/gradient_container.dart';
import 'package:bloc_practise/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practise/features/cart/data/cart_items.dart';
import 'package:bloc_practise/features/cart/presentation/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cartBloc,
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartNavigateToHomeState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(toHomeRoute, (route) => false);
          } else if (state is CartNavigateToWishState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(toWishRoute, (route) => false);
          } else if (state is CartRemoveFromCartState) {
            // cartBloc.add(CartInitialEvent());
          }
        },
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const LaodingPage();
          } else if (state is CartSuccessState) {
            final success = state;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Cart'),
                centerTitle: true,
                flexibleSpace: gradientContainer,
                actions: [
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartNavigateToHomeEvent());
                      },
                      icon: homeIcon),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartNavigateToWishEvent());
                      },
                      icon: wishIcon),
                  IconButton(onPressed: () {}, icon: cartIconFilled),
                ],
              ),
              body: ListView.builder(
                  itemCount: success.cartItems.length,
                  itemBuilder: (context, index) =>
                      CartProductsTile(list: success.cartItems[index])),
            );
          } else if (state is CartErrorState) {
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
