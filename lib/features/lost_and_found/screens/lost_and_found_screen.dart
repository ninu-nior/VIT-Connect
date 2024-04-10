import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vit_connect_plus/common/styles/shadows.dart';
import 'package:vit_connect_plus/common/widgets/appbar.dart';
import 'package:vit_connect_plus/common/widgets/rounded_image.dart';
import 'package:vit_connect_plus/features/lost_and_found/widgets/found_card_horizontal.dart';
import 'package:vit_connect_plus/features/lost_and_found/widgets/found_card_vertical.dart';
import 'package:vit_connect_plus/features/lost_and_found/widgets/found_grid_view.dart';
import 'package:vit_connect_plus/features/lost_and_found/widgets/lost_card_vertical.dart';
import 'package:vit_connect_plus/features/lost_and_found/widgets/lost_grid_view.dart';
import 'package:vit_connect_plus/models/found_item.dart';
import 'package:vit_connect_plus/models/lost_item.dart';
import 'package:vit_connect_plus/utils/constants/api_endpoints.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class LostAndFoundScreen extends StatelessWidget {
  const LostAndFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: LFAppBar(),
            bottom: TabBar(labelStyle: TextStyle(fontSize: 12), tabs: [
              Tab(
                icon: Icon(
                  Iconsax.blend,
                  color: MyColors.primary,
                  size: 24,
                ),
                text: "Found",
              ),
              Tab(
                  icon: Icon(
                    Iconsax.box_search,
                    color: MyColors.primary,
                    size: 24,
                  ),
                  text: "Lost")
            ]),
          ),
          body: TabBarView(
            children: [FoundScreen(), LostScreen()],
          )),
    );
  }
}

class FoundItemAdd extends StatefulWidget {
  FoundItemAdd({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<FoundItemAdd> createState() => _FoundItemAddState();
}

class _FoundItemAddState extends State<FoundItemAdd> {
  DateTime selectedDate = DateTime.now();
  File? _image;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final itemNameController = TextEditingController();
  final foundAtController = TextEditingController();
  final contactInfoController = TextEditingController();
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('inside');
      setState(() {
        _image = File(pickedFile.path);
        print(_image);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Iconsax.add_square,
        color: Colors.white,
      ),
      onPressed: () async {
        await showDialog<void>(
            context: context,
            builder: (context) => StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SingleChildScrollView(
                      child: RoundedContainer(
                        width: double.infinity,
                        backgroundColor: Colors.white,
                        radius: 4,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              right: -30,
                              top: -30,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 209, 94, 86),
                                  child: Icon(
                                    Iconsax.clipboard_close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: widget._formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Found Something? Report It",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: OutlinedButton(
                                      onPressed: () => _selectDate(context),
                                      child: const Text('Select date'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: itemNameController,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Iconsax.forward_item),
                                          labelText: "Item Name"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: foundAtController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.location),
                                          labelText: "Found at"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: contactInfoController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.user),
                                          labelText: "Contact Info"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizes.spacebtwitems,
                                  ),
                                  ElevatedButton(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Text('Upload Image'),
                                    ),
                                    onPressed: () async {
                                      await pickImage();
                                      setState(() {});
                                    },
                                  ),
                                  SizedBox(
                                    height: Sizes.spacebtwitems,
                                  ),
                                  if (_image != null)
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.file(_image!))
                                  else
                                    Text('No image selected.'),
                                  SizedBox(
                                    height: Sizes.spaceBtwSections,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  MyColors.primary)),
                                      child: const Text('   Report Item   '),
                                      onPressed: () async {
                                        if (widget._formKey.currentState!
                                            .validate()) {
                                          widget._formKey.currentState!.save();
                                              String date = selectedDate.toString();
                                          var request = http.MultipartRequest(
                                              'POST', Uri.parse(addFoundItem));
                                          

                                          request.fields['name'] =
                                              itemNameController.text;
                                              request.fields['date_found'] = date;
                                          request.fields['place'] =
                                              foundAtController.text;
                                          request.fields['contact'] =
                                              contactInfoController.text;
                                          request.fields['user_id'] =
                                              "SRPsg7VSfgpuU5MjLMKB";

                                          if (_image != null) {
                                            request.files.add(await http
                                                .MultipartFile.fromPath(
                                              'image', // 'image' is the field name on the server that will handle the uploaded file
                                              _image!.path,
                                            ));
                                          }

                                          var response = await request.send();

                                          if (response.statusCode == 200) {
                                            print('Uploaded successfully.');
                                            
                                          } else {
                                            print('Failed to upload.');
                                          }
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
      },
      backgroundColor: MyColors.primary,
    );
  }
}

class LostScreen extends StatelessWidget {
  LostScreen({
    super.key,
  });
  final _formKey2 = GlobalKey<FormState>();
  final String userId = "SRPsg7VSfgpuU5MjLMKB";

  Stream<List<LostItem>> fetchLostItems() async* {
    // Replace with your actual API call
    try {
      var response = await http.get(Uri.parse(retreiveAllLostItems));

      if (response.statusCode == 200) {
        var itemsJson = jsonDecode(response.body) as List;
        yield itemsJson.map((item) => LostItem.fromJson(item)).toList();
        // _foundItemsController
        //     .add(itemsJson.map((item) => FoundItem.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print(e);
      // _foundItemsController.addError(e);
      yield [];
    }
  }
  Stream<List<FoundItem>> fetchUserLostItems(String userId) async* {
    try {
      var response = await http.post(
        Uri.parse(retreiveUserFoundItems),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        var itemsJson = jsonDecode(response.body) as List;
        yield itemsJson.map((item) => FoundItem.fromJson(item)).toList();
        // _foundItemsController
        //     .add(itemsJson.map((item) => FoundItem.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print(e);
      yield [];
      // _foundItemsController.addError(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LostItemAdd(formKey2: _formKey2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: StreamBuilder<List<FoundItem>>(
                stream: fetchUserLostItems(userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        var item = snapshot.data![index];
                        return FoundCardHorizontal(
                          name: item.name,
                          contact: item.contact,
                          date: item.dateFound,
                          location: item.place,
                          imageUrl: item.imageUrl,
                          foundID: item.foundId,
                        );
                      },
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
            Text(""),
            StreamBuilder<List<LostItem>>(
              stream: fetchLostItems(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LostGridView(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        var item = snapshot.data![index];
                        return FoundCardVertical(
                          name: item.name,
                          contact: item.contact,
                          date: item.dateLost,
                          location: item.place,
                          imageUrl: item.imageUrl,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              })
          ],
        
        ),
      ),
    );
  }
}

class FoundScreen extends StatelessWidget {
  FoundScreen({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final String userId = "SRPsg7VSfgpuU5MjLMKB";
  // final StreamController<List<FoundItem>> _foundItemsController =
  //     StreamController<List<FoundItem>>();

  Stream<List<FoundItem>> fetchFoundItems() async* {
    // Replace with your actual API call
    try {
      var response = await http.get(Uri.parse(retreiveAllFoundItems));

      if (response.statusCode == 200) {
        var itemsJson = jsonDecode(response.body) as List;
        yield itemsJson.map((item) => FoundItem.fromJson(item)).toList();
        // _foundItemsController
        //     .add(itemsJson.map((item) => FoundItem.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print(e);
      // _foundItemsController.addError(e);
      yield [];
    }
  }

  Stream<List<FoundItem>> fetchUserFoundItems(String userId) async* {
    try {
      var response = await http.post(
        Uri.parse(retreiveUserFoundItems),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        var itemsJson = jsonDecode(response.body) as List;
        yield itemsJson.map((item) => FoundItem.fromJson(item)).toList();
        // _foundItemsController
        //     .add(itemsJson.map((item) => FoundItem.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print(e);
      yield [];
      // _foundItemsController.addError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FoundItemAdd(formKey: _formKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: StreamBuilder<List<FoundItem>>(
                stream: fetchUserFoundItems(userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        var item = snapshot.data![index];
                        return FoundCardHorizontal(
                          name: item.name,
                          contact: item.contact,
                          date: item.dateFound,
                          location: item.place,
                          imageUrl: item.imageUrl,
                          foundID: item.foundId,
                        );
                      },
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
            Text(""),
            StreamBuilder<List<FoundItem>>(
              stream: fetchFoundItems(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FoundGridView(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        var item = snapshot.data![index];
                        return FoundCardVertical(
                          name: item.name,
                          contact: item.contact,
                          date: item.dateFound,
                          location: item.place,
                          imageUrl: item.imageUrl,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}


class LFAppBar extends StatelessWidget {
  const LFAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Lost And Found"),
          SizedBox(
            height: 6,
          ),
          Text("Lost Something? We've got you.",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: const Color.fromRGBO(158, 158, 158, 1))),
          SizedBox(height: 10),
        ],
      ),
    );
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

class LostItemAdd extends StatefulWidget {
  LostItemAdd({
    super.key,
    required GlobalKey<FormState> formKey2,
  }) : _formKey2 = formKey2;

  final GlobalKey<FormState> _formKey2;

  @override
  State<LostItemAdd> createState() => _LostItemAddState();
}

class _LostItemAddState extends State<LostItemAdd> {
  DateTime selectedDate = DateTime.now();
  File? _image;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final itemNameController = TextEditingController();
  final foundAtController = TextEditingController();
  final contactInfoController = TextEditingController();
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('inside');
      setState(() {
        _image = File(pickedFile.path);
        print(_image);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Iconsax.add_square,
        color: Colors.white,
      ),
      onPressed: () async {
        await showDialog<void>(
            context: context,
            builder: (context) => StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SingleChildScrollView(
                      child: RoundedContainer(
                        width: double.infinity,
                        backgroundColor: Colors.white,
                        radius: 4,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              right: -30,
                              top: -30,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 209, 94, 86),
                                  child: Icon(
                                    Iconsax.clipboard_close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: widget._formKey2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Found Something? Report It",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: OutlinedButton(
                                      onPressed: () => _selectDate(context),
                                      child: const Text('Select date'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: itemNameController,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Iconsax.forward_item),
                                          labelText: "Item Name"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: foundAtController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.location),
                                          labelText: "Found at"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: contactInfoController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.user),
                                          labelText: "Contact Info"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizes.spacebtwitems,
                                  ),
                                  ElevatedButton(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Text('Upload Image'),
                                    ),
                                    onPressed: () async {
                                      await pickImage();
                                      setState(() {});
                                    },
                                  ),
                                  SizedBox(
                                    height: Sizes.spacebtwitems,
                                  ),
                                  if (_image != null)
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.file(_image!))
                                  else
                                    Text('No image selected.'),
                                  SizedBox(
                                    height: Sizes.spaceBtwSections,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  MyColors.primary)),
                                      child: const Text('   Report Item   '),
                                      onPressed: () async {
                                        if (widget._formKey2.currentState!
                                            .validate()) {
                                          widget._formKey2.currentState!.save();
                                          final date =selectedDate.toString();
                                          var request = http.MultipartRequest(
                                              'POST', Uri.parse(addLostItem));
                                            request.fields['date_found'] = date;
                                          request.fields['name'] =
                                              itemNameController.text;
                                          request.fields['place'] =
                                              foundAtController.text;
                                          request.fields['contact'] =
                                              contactInfoController.text;
                                          request.fields['user_id'] =
                                              "SRPsg7VSfgpuU5MjLMKB";

                                          if (_image != null) {
                                            request.files.add(await http
                                                .MultipartFile.fromPath(
                                              'image', // 'image' is the field name on the server that will handle the uploaded file
                                              _image!.path,
                                            ));
                                          }

                                          var response = await request.send();

                                          if (response.statusCode == 200) {
                                            print('Uploaded successfully.');
                                            
                                          } else {
                                            print('Failed to upload.');
                                          }
                                          
                                        }
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
      },
      backgroundColor: MyColors.primary,
    );
  }
}

// final api_endpoint = "http://192.168.232.237:5000/retreive_all_found_items";
//   var responseData;
//   Future<void> getLostItems() async {
//     var response = await http.get(Uri.parse(api_endpoint));
//     if (response.statusCode == 200) {
//       var decodedData = jsonDecode(response.body);
//       print(decodedData);
//     } else {
//       print("Hahaha");
//     }
//   }