import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:vit_connect_plus/common/styles/shadows.dart';
import 'package:vit_connect_plus/common/widgets/rounded_image.dart';
import 'package:vit_connect_plus/utils/constants/api_endpoints.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';
import 'dart:convert'; // Import dart:convert to use jsonEncode
class FoundCardHorizontal extends StatefulWidget {
  final String name;
  final String date;
  final String location;
  final String contact;
  final String imageUrl;
  final String foundID;
  const FoundCardHorizontal(
      {super.key,
      required this.name,
      required this.date,
      required this.location,
      required this.contact,
      required this.imageUrl,
      required this.foundID});

  @override
  State<FoundCardHorizontal> createState() => _FoundCardHorizontalState();
}

class _FoundCardHorizontalState extends State<FoundCardHorizontal> {
Future<void> sendPostRequest() async {
  // Define your endpoint URL
  try {
    // Convert your data to JSON format
    Map<String, dynamic> requestData = {
      'found_id': widget.foundID
    };
    String jsonData = jsonEncode(requestData);

    // Send a POST request to the endpoint with JSON data
    final http.Response response = await http.post(
      Uri.parse(deleteFoundItem),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', // Set the Content-Type header
      },
      body: jsonData,
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Request was successful
      print('POST request successful!');
    } else {
      // Request failed
      print(
          'Failed to send POST request. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // An error occurred while sending the request
    print('Error sending POST request: $error');
  }
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: dark ? MyColors.darkerGrey : Colors.white,
        ),
        child: Row(
          children: [
            //thumbnail:wishlist button and discount tag
            RoundedContainer(
              height: 180,
              padding: EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  RoundedImage(
                    isNetworkImage: true,
                    imageUrl: widget.imageUrl,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: MyColors.secondary.withOpacity(0.99),
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: Text('1 day',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: MyColors.black)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizes.spacebtwitems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeFactor: 1.5),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.date,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: MyColors.darkerGrey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.location,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.contact,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  OutlinedButton(
                    onPressed: ()async {
                     await sendPostRequest();
                      setState(() {
                        // Update the UI
                      });
                    },
                    child: const Text('Returned it?'),
                  ),
                ],
              ),
            )
          ],
          //details
          //
        ));
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = 16,
      this.child,
      this.showBorder = false,
      this.borderColor = Colors.white70,
      this.backgroundColor = Colors.white,
      this.padding,
      this.margin});
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
