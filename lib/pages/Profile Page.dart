// import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/model/Pet.dart';
import 'package:fap/pages/Edit%20Profile.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:fap/model/User.dart';
import 'package:fap/model/User_Details.dart';
import 'package:fap/components/Profile_Modify.dart';
import 'package:fap/components/Button.dart';
import 'package:fap/components/Information.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
            // ListView
            // physics: BouncingScrollPhysics(),
              children: [
                ProfileModify(
                  petImage: User.pet.petImage,
                // onClicked: () async {},
                ),
                const SizedBox(height: 15),
                petName(),
                const SizedBox(height: 20),
                Center(
                child: editButton(),
                ),
                // Button(
                //
                // ),
                const SizedBox(height: 10),
                Information(),
                const SizedBox(height: 15),
                petAbout(),
              ],
            ),
          ),
        ),
      ),
        // bottomNavigationBar: CustomNavBar(currentIndex: 2, context: context),
    );
  }

  petName() {
    return Column(
      children: [
        Text(
          User.pet.petName,
          style: constants.TextTitle,
        ),
        //const SizedBox(height: 1),
        Text(
          User.pet.breed,
          style: TextStyle(
            color: constants.firstColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  editButton() => Button(
    color: constants.secondColor,
    hPadding: 5,
        vPadding: 5,
        text: 'Edit Profile',
        onClicked: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()),
          );
        },
      );

  petAbout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            User.pet.about,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
