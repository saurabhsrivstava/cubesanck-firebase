import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/WishList/Bloc/WishList_bloc.dart';
import 'package:cubesnack/Tabbar/WishList/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class ProductLikeView extends StatefulWidget {
  final Products product;
  const ProductLikeView({Key key, this.product}) : super(key: key);

  @override
  _ProductLikeViewState createState() => _ProductLikeViewState();
}

class _ProductLikeViewState extends State<ProductLikeView> {
  WishListBloc bloc;

  @override
  void initState() {
    bloc = WishListBloc(WishListDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("is:: ${this.widget.product.isWishListed}");
    return BlocConsumer(
      builder: (context, state) {
        if (state is WishListLoadingState) {
          return AppLoader(
            height: 40,
            bgColor: Colors.transparent,
          );
        }

        return Container(
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color:
                  this.widget.product.isWishListed ? Colors.black : Colors.grey,
            ),
            onPressed: () =>
                {bloc.add(AddWishListEvent(product: this.widget.product))},
            padding: EdgeInsets.zero,
          ),
        );
      },
      listener: (context, state) {
        if (state is AddFavoriteDoneState) {
          this.widget.product.isWishListed = !this.widget.product.isWishListed;
          Toast.show(
              this.widget.product.isWishListed
                  ? "Added to Favorite"
                  : "Removed from Favorite",
              context);
        }

        if (state is ErrorWishListState) {
          Toast.show("Failed to add to Favorite", context);
        }
      },
      cubit: bloc,
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
