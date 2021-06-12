import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/LikeShare.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSider extends StatefulWidget {
  final List<MImage> images;
  final Products product;

  const ProductImageSider({Key key, this.images, this.product})
      : super(key: key);

  @override
  _ProductImageSiderState createState() => _ProductImageSiderState();
}

class _ProductImageSiderState extends State<ProductImageSider> {
  final PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 2,
          width: size.width,
          margin: EdgeInsets.only(bottom: 30),
          child: PageView(
            children: <Widget>[
              ...this.widget.images.map((e) => Image.network(e.image)).toList()
            ],
            controller: controller,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                    controller: controller,
                    // PageController
                    count: this.widget.images?.length ?? 0,
                    effect: WormEffect(
                        paintStyle: PaintingStyle.stroke,
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: AppColors.blue),
                    // your preferred effect
                    onDotClicked: (index) {}),
              ),
            ),
            Expanded(
              child: PlatformInfo.isMobile(context)
                  ? LikeShare(
                      product: this.widget.product,
                    )
                  : Container(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
