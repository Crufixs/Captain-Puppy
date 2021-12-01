import 'dart:convert';
import 'dart:io';

import 'package:fap/components/EditProfile_Modify.dart';
import 'package:fap/components/Button.dart';
import 'package:fap/model/User.dart';
import 'package:fap/services/import_image.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home Page.dart';

class EditProfile extends StatefulWidget {
  EditProfile({required this.isNew});
  final bool isNew;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  double weightValue = User.pet.weight;
  String? value;
  String selectedGender = User.pet.gender;
  final _formKey = GlobalKey<FormState>();

  _EditProfileState() {
    imgPath = User.pet.petImage;
  }
  TextEditingController userNameController =
      new TextEditingController(text: User.userName);
  TextEditingController petNameController =
      new TextEditingController(text: User.pet.petName);
  TextEditingController petAgeController =
      new TextEditingController(text: User.pet.age.toString());
  TextEditingController petBreedController =
      new TextEditingController(text: User.pet.breed);
  TextEditingController petWeightController =
      new TextEditingController(text: User.pet.weight.toString());
  TextEditingController petAboutController =
      new TextEditingController(text: User.pet.about);

  bool isNew = false;
  String headerMessage = "Edit Profile";
  @override
  void initState() {
    super.initState();
    isNew = widget.isNew;
    if (isNew) {
      headerMessage = "Create Profile";
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    petNameController.dispose();
    petAgeController.dispose();
    petBreedController.dispose();
    petWeightController.dispose();
    petAboutController.dispose();
    super.dispose();
  }

  void saveChanges() async {
    User.userName = userNameController.text;
    User.pet.petName = petNameController.text;
    User.pet.age = int.parse(petAgeController.text);
    User.pet.breed = petBreedController.text;
    User.pet.weight = double.parse(petWeightController.text);
    User.pet.gender = selectedGender;
    User.pet.about = petAboutController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(User.toJson());
    prefs.setString('userData', json);
  }

  late String imgPath;

  void getImage() async {
    ImageImportBrain imb = ImageImportBrain();
    ImageSource? source = await imb.showImageSource(context);
    File? img = await imb.pickImage(source!);
    imgPath = img!.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: () => {
                        Navigator.of(context).pop(),
                      },
                    ),
                    Text(
                      headerMessage,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                EditProfileModify(
                  petImage: imgPath,
                  isEdit: true,
                  onClicked: () async {
                    setState(() {
                      getImage();
                    });
                  },
                ),
                const SizedBox(height: 15),
                userNameInput(),
                const SizedBox(height: 20),
                petNameInput(),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: petAgeInput(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: petBreedInput(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: petWeightInput(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pet\'s Gender',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 225,
                                height: 59,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      hintText: value,
                                      border: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(10),
                                          )),
                                  // children: [
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      // validator: (value) {
                                      //   if (value == null) {
                                      //     return 'Choose at least one.';
                                      //   }
                                      // },
                                      value: selectedGender,
                                      iconSize: 25,
                                      icon: Icon(Icons.arrow_drop_down,
                                          color: Colors.black),
                                      items: ['Male', 'Female']
                                          .map(itemSelect)
                                          .toList(),
                                      onChanged: (value) => setState(() {
                                        selectedGender = value.toString();
                                      }),
                                    ),
                                  ),
                                  // ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Slider(
                        value: weightValue.toDouble(),
                        min: 1.0,
                        max: 150.0,
                        activeColor: thirdColor,
                        inactiveColor: thirdTransparentColor,
                        onChanged: (double newValue) {
                          setState(() {
                            weightValue = newValue.round().toDouble();
                            petWeightController.text = weightValue.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                petAboutInput(),
                const SizedBox(height: 40),
                saveButton(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> itemSelect(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  saveButton() => Button(
        text: 'Save Changes',
        vPadding: 10,
        hPadding: 15,
        onClicked: () {
          if (_formKey.currentState!.validate()) {
            saveChanges();
            User.pet.petImage = imgPath;
            if (isNew) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          }
        },
        color: secondColor,
      );

  userNameInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text.';
              }
              return null;
            },
            controller: userNameController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: User.userName,
              suffixIcon: userNameController.text
                      .isEmpty //icon only appears when clicked on the text field
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        userNameController
                            .clear(); //clears the text inside the tf
                      },
                    ),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );

  petNameInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pet\'s Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text.';
              }
              return null;
            },
            controller: petNameController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: User.pet.petName,
              suffixIcon: petNameController.text
                      .isEmpty //icon only appears when clicked on the text field
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        petNameController
                            .clear(); //clears the text inside the tf
                      },
                    ),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      );

  petAgeInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pet\'s Age',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a number.';
              } else if (double.tryParse(value) == null) {
                return 'Wrong input.';
              }
              return null;
            },
            controller: petAgeController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: '${User.pet.age}',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      );

  petBreedInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pet\'s Breed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text.';
              }
              return null;
            },
            controller: petBreedController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: User.pet.breed,
              suffixIcon: petBreedController.text
                      .isEmpty //icon only appears when clicked on the text field
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        petBreedController
                            .clear(); //clears the text inside the tf
                      },
                    ),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      );

  petWeightInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pet\'s Weight (in kg)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a number.';
              } else if (double.tryParse(value) == null) {
                return 'Wrong input.';
              }
              return null;
            },
            controller: petWeightController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: weightValue.toString(),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text) => {weightValue.toString()},
          ),
        ],
      );

  petAboutInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Your Pet',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text.';
              }
              return null;
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: petAboutController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: User.pet.about,
              suffixIcon: petAboutController.text
                      .isEmpty //icon only appears when clicked on the text field
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        petAboutController
                            .clear(); //clears the text inside the tf
                      },
                    ),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      );
}
