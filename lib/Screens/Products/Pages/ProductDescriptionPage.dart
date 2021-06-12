import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/CommonViews/WebNavigationBar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/ProductDescriptionBuilder.dart';
import 'package:cubesnack/Screens/Products/Views/ProductDetailBuilder.dart';
import 'package:cubesnack/Tabbar/Home/Bloc/index.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class ProductDescriptionPage extends StatefulWidget {
  final String id;

  const ProductDescriptionPage({Key key, this.id}) : super(key: key);

  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc(DefaultHomeState());
    bloc.add(LoadProductDetailsEvent(id: this.widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: PlatformInfo.isDesktop(context)
            ? WebNavigationBar()
            : Navbar(
          title: "productDetails",
          isSearch: true,
          isCart: true,
        ),
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocConsumer(
            builder: (context, state) {
              Products product;
              if (state is HomeLoadingState) {
                return AppLoader();
              }
              if (state is ProductDescriptionDoneState ||
                  state is AddingCartDoneState) {
                product = state.product;
              }
              return product != null
                  ? (PlatformInfo.isDesktop(context)
                  ? ProductDetailBuilder(
                product: product,
              )
                  : ProductDescriptionBuilder(
                product: product,
              ))
                  : AppLoader();
            },
            listener: (context, state) {
              if (state is ErrorHomeState) {
                AppAlert.showAlert(
                    context: context,
                    title: "error",
                    message: state.errorMessage);
              }
              if (state is AddingCartDoneState) {
                Toast.show("Item added", context);
              }
            },
            cubit: bloc,
          ),
        ),
      ),
    );
  }
}
