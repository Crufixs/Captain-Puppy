import 'package:fap/model//User.dart';
import 'package:fap/model/User_Details.dart';
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
  // User user = UserDetails.userRecord;

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
                  petImage: User.pet.petImage,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 15),
                TextFieldModify(
                    label: 'Your Name',
                    value: User.userName,
                    onChanged: (userName) {}
                ),
                const SizedBox(height: 20),
                TextFieldModify(
                    label: 'Pet\'s Name',
                    value: User.pet.petName,
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
                              value: User.pet.petName,
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
                            value: User.pet.breed,
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
                              value: User.userName,
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
      vPadding: 5,
      hPadding: 5,
      onClicked: () {}
  );

}

