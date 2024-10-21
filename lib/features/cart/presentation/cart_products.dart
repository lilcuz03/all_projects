import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/themes/app_pallet.dart';
import 'package:bloc_practise/core/ui/pages/error/error_page.dart';
import 'package:bloc_practise/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practise/features/cart/data/cart_items.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsTile extends StatefulWidget {
  // final void Function() cartfunc;
  // final void Function() wishfunc;
  final list;
  // final Bloc bloc;
  const CartProductsTile({
    super.key,
    required this.list,
    // required this.bloc,
    // required this.cartfunc,
    // required this.wishfunc,
  });

  @override
  State<CartProductsTile> createState() => _CartProductsTileState();
}

class _CartProductsTileState extends State<CartProductsTile> {
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
    // final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => cartBloc,
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessState) {
            final success = state;
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
                              IconButton(onPressed: () {}, icon: wishIcon),
                              // IconButton(
                              //     onPressed: () {

                              //     },
                              //     icon: cartIconFilled),
                              IconButton(
                                  onPressed: () {
                                    cartBloc.add(CartRemoveFromCartEvent(
                                        removedItem:widget.list));
                                  },
                                  icon: deleteIconFilled),
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
          } else {
            return const ErrorPage();
          }
        },
      ),
    );
  }
}
