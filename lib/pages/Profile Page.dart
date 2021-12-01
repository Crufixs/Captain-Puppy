// import 'package:fap/components/CustomNavBar.dart';
import 'dart:io';

import 'package:fap/model/Pet.dart';
import 'package:fap/pages/Edit%20Profile.dart';
import 'package:fap/utilities/constants.dart';
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

//ROAR
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // access the User_Details
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            // ListView
            // physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Stack(
                  // Overlap multiple widgets on top of each other
                  children: [
                    profileImage(),
                    Positioned(
                      // Positions the edit icon
                      bottom: 0,
                      left: 110,
                      child: ElevatedButton(
                        child: editIcon(Theme.of(context).colorScheme.primary),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () => Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => EditProfile(isNew: false),
                              ),
                            )
                            .then(
                              (value) => setState(() {}),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              petName(),
              const SizedBox(height: 20),
              // Center(
              //   child: editButton(),
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genderEnter(),
                  ageEnter(),
                  weightEnter(),
                ],
              ),
              const SizedBox(height: 15),
              petAbout(),
            ],
          ),
        ),
      ),
    );
    // bottomNavigationBar: CustomNavBar(currentIndex: 2, context: context),
  }

  profileImage() {
    final image = Image.file(new File(User.pet.petImage));
    return ClipOval(
      child: Material(
        // must be implemented for ClipOval
        color: Colors.transparent,
        child: Ink.image(
          // widget that shows an image obtained from an ImageProvider
          image: image.image,
          fit: BoxFit.cover,
          width: 170,
          height: 170,
        ),
      ),
    );
  }

  editIcon(Color color) => circleContainer(
        color: Colors.white,
        all: 3,
        child: circleContainer(
          color: firstColor,
          all: 8, // padding
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  circleContainer(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          child: child,
          color: color,
          padding: EdgeInsets.all(all),
        ),
      );

  petName() {
    return Column(
      children: [
        Text(
          User.pet.petName,
          style: TextTitle,
        ),
        //const SizedBox(height: 1),
        Text(
          User.pet.breed,
          style: TextStyle(
            color: firstColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  genderEnter() {
    return Row(children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              User.pet.gender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Gender',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  ageEnter() {
    return Row(//MaterialButton
        // onPressed: () {},
        children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              User.pet.age.toString() + ' ' + 'y/o',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  weightEnter() {
    return Row(//MaterialButton
        children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              User.pet.weight.toString() + ' ' + 'kg',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  petAbout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
