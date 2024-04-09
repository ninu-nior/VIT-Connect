import 'package:flutter/material.dart';
import 'package:vit_connect_plus/common/widgets/circular_container.dart';
import 'package:vit_connect_plus/common/widgets/rounded_image.dart';
import 'package:vit_connect_plus/features/healthcare/widgets/hc_appbar.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';

class HeaderAndTabsAP extends StatelessWidget {
  const HeaderAndTabsAP({
    required this.doctorName,
    required this.imageUrl,
    required this.venue,
    required this.type,
    super.key,
    required this.dark,
  });

  final bool dark;
  final String doctorName;
  final String imageUrl;
  final String venue;
  final String type;
  @override
  Widget build(BuildContext context) {
    return PrimaryHeaderContainer(
      dark: dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RoundedImage(
                      width: 300,
                      height: 300,
                      imageUrl: imageUrl,
                      isNetworkImage: true),
                ),

                SizedBox(height: 10),
                // Add TabBar below the text
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(type),
                Text(venue)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer(
      {Key? key, required this.dark, required this.child})
      : super(key: key);

  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdges(
      dark: dark,
      child: Container(
        color: MyColors.white,
        padding: EdgeInsets.all(0),
        //for the shapes we use the stack widget to layout on top of each other
        child: SizedBox(
          height: 450,
          child: Stack(
            children: [
              //to create a circular container, use box decoration
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: dark
                      ? MyColors.black.withOpacity(0.1)
                      : MyColors.primary.withOpacity(0.4),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: dark
                      ? MyColors.black.withOpacity(0.1)
                      : MyColors.primary.withOpacity(0.1),
                ),
              ),
              Column(
                children: [child],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCurvedEdges extends StatelessWidget {
  const CustomCurvedEdges({Key? key, required this.dark, required this.child})
      : super(key: key);

  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //size is basically the size of the custom widget we use this on, in this case it will provide the size of the container it is being used on

    var path = Path();
    //x is zero and y from complete top to bottom, which is basically size.height

    path.lineTo(0, size.height);

    // to start creating the design
    final firstCurve = Offset(0, size.height - 20);
    final lastcurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastcurve.dx, lastcurve.dy);
    final secondfirstcurve = Offset(0, size.height - 20);
    final secondlastcurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondfirstcurve.dx, secondfirstcurve.dy,
        secondlastcurve.dx, secondlastcurve.dy);
    final thirdfirstcurve = Offset(size.width, size.height - 20);
    final thirdlastcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstcurve.dx, thirdfirstcurve.dy,
        thirdlastcurve.dx, thirdlastcurve.dy);
    path.lineTo(size.width, 0);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
