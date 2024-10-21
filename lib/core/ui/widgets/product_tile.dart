import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/themes/app_pallet.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatefulWidget {
  // final void Function() cartfunc;
  // final void Function() wishfunc;
  final list;
  // final Bloc bloc;
  const ProductTile({
    super.key,
    required this.list,
    // required this.bloc,
    // required this.cartfunc,
    // required this.wishfunc,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
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
    // final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeAddToCartState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Row(
                  children: [
                    Text('Item Added to Cart '),
                    cartIconFilled,
                  ],
                )));
          } else if (state is HomeAddToWishState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Row(
                  children: [
                    Text('Item Wishlisted'),
                    wishIconFilled,
                  ],
                )));
          }
        },
        builder: (context, state) {
          return Container(
            height: 500,
            // width: ,
            decoration: BoxDecoration(
              border: Border.all(color: blueColorg1),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.list.imageUrl.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.list.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                            )),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  homeBloc.add(HomeAddToWishEvent(
                                      wishListedItems: widget.list));
                                },
                                icon: wishIcon),
                            IconButton(
                                onPressed: () {
                                  homeBloc.add(HomeAddToCartEvent(
                                      cartedItems: widget.list));
                                },
                                icon: cartIcon),
                          ],
                        ),
                      ],
                    ),
                    Text('\$ ${widget.list.price.toString()}'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
