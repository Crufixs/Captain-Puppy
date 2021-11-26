import 'package:fap/components/User.dart';
import 'package:fap/components/User_Details.dart';
import 'package:fap/components/Profile_Modify.dart';
import 'package:fap/components/EditProfile_Modify.dart';
import 'package:fap/components/TextField_Modify.dart';
import 'package:fap/components/Button.dart';
import 'package:fap/components/Slider.dart';
import 'package:fap/components/OptionSelect.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = UserDetails.userRecord;

  @override
  Widget build(BuildContext context) {
    final color =
        Theme
            .of(context)
            .colorScheme
            .primary;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                EditProfileModify(
                  petImage: user.petImage,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 15),
                TextFieldModify(
                    label: 'Your Name',
                    value: user.userName,
                    onChanged: (userName) {}
                ),
                const SizedBox(height: 20),
                TextFieldModify(
                    label: 'Pet\'s Name',
                    value: user.petName,
                    onChanged: (petName) {}
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          child: TextFieldModify(
                            // NUMBER FIELD TO DAPAT
                              label: 'Pet\'s Age',
                              value: user.petName,
                              onChanged: (petName) {}
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: TextFieldModify(
                            label: 'Pet\'s Breed',
                            value: user.breed,
                            onChanged: (breed) {}
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          child: TextFieldModify(
                            // NUMBER FIELD TO DAPAT + SLIDER T^T
                              label: 'Pet\'s Weight',
                              value: user.userName,
                              onChanged: (userName) {}
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Pet\'s Gender',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            OptionSelect(),
                          ],
                        ),
                        // child: TextFieldModify(
                        //     label: 'Pet\'s Gender',
                        //     value: user.gender,
                        //     onChanged: (gender) {}
                        // ),
                      ),
                    ),
                  ],
                ),
                // OptionSelect(),
                SliderLabel(),

                const SizedBox(height: 25),
                saveButton(),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveButton() => Button(
    text: 'Save Changes',
    onClicked: () {}
  );
}
