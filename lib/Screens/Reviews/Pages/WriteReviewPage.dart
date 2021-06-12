import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Screens/Products/Models/MReview.dart';
import 'package:cubesnack/Screens/Reviews/Bloc/index.dart';
import 'package:cubesnack/Screens/Reviews/Views/WriteReviewView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class WriteReviewPage extends StatefulWidget {
  final String productId;
  const WriteReviewPage({Key key, this.productId}) : super(key: key);

  @override
  _WriteReviewPageState createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  ProductReviewBloc bloc;
  MReview review;

  @override
  void initState() {
    super.initState();
    review = MReview();
    bloc = ProductReviewBloc(ProductReviewDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer(
        builder: (context, state) {
          return Stack(
            children: [
              WriteReviewView(
                callBack: _submitPressed,
                review: review,
              ),
              if (state is ProductReviewLoadingState) AppLoader()
            ],
          );
        },
        listener: (context, state) {
          if (state is ProductReviewDoneState) {
            Navigator.pop(context);
            Toast.show("Review submittted Successfully", context);
          }
        },
        cubit: bloc,
      ),
    ));
  }

  _submitPressed() {
    bloc.add(AddProductReviewEvent(
        productId: widget.productId, body: review.toJson()));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
