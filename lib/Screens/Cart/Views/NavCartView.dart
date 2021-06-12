import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/Authentication.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCartView extends StatelessWidget {
  const NavCartView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        int cartCount = 0;
        if (state is CartDoneState) {
          cartCount = state.items.length;
        }
        if (state is CartLoadingState) {
          return AppLoader(
            bgColor: Colors.transparent,
            height: 20,
            weidth: 20,
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: AppColors.lightGrey),
              onPressed: () {
                if (cartCount == 0) return;
                Navigator.pushNamed(context, AppRoutes.cart);
              },
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.darkBlue)),
                child: AppTitle(
                  title: "$cartCount",
                  color: Colors.white,
                  fontSize: AppFont.title1,
                ),
              ),
            ),
          ],
        );
      },
      cubit: UserSession.shared.bloc..add(LoadCartEvent()),
    );
  }
}
