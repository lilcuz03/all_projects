

import 'package:bloc_practise/core/icons/app_icons.dart';
import 'package:bloc_practise/core/themes/app_pallet.dart';
import 'package:bloc_practise/core/ui/pages/error/error_page.dart';
import 'package:bloc_practise/features/wish/bloc/wish_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishProductTile extends StatefulWidget {
  // final void Function() Wishfunc;
  // final void Function() wishfunc;
  final list;
  // final Bloc bloc;
  const WishProductTile({
    super.key,
    required this.list,
    // required this.bloc,
    // required this.Wishfunc,
    // required this.wishfunc,
  });

  @override
  State<WishProductTile> createState() => _WishProductTileState();
}

class _WishProductTileState extends State<WishProductTile> {
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
    // final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => wishBloc,
      child: BlocConsumer<WishBloc, WishState>(
        listenWhen: (previous, current) => current is WishActionState,
        buildWhen: (previous, current) => current is! WishActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WishSuccessState) {
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
                              IconButton(onPressed: () {}, icon: cartIcon),
                              // IconButton(
                              //     onPressed: () {

                              //     },
                              //     icon: WishIconFilled),
                              IconButton(
                                  onPressed: () {
                                    wishBloc.add(WishUnlikeWishEvent(
                                        wishItem: widget.list));
                                  },
                                  icon: wishIconFilled),
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
