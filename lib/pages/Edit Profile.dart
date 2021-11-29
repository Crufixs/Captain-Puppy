import 'package:fap/components/EditProfile_Modify.dart';
import 'package:fap/components/TextField_Modify.dart';
import 'package:fap/components/Button.dart';
import 'package:fap/components/Slider.dart';
import 'package:fap/components/OptionSelect.dart';
import 'package:fap/model/Pet.dart';
import 'package:fap/model/User.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  // final String label;
  // final String value;
  // final ValueChanged<String> onChanged;
  //
  // const EditProfile({
  //   Key? key,
  //   required this.label,
  //   required this.value,
  //   required this.onChanged,
  // }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // User user = UserDetails.userRecord;
  double weightValue = User.pet.weight;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController petNameController = new TextEditingController();
  TextEditingController petAgeController = new TextEditingController();
  TextEditingController petBreedController = new TextEditingController();
  TextEditingController petWeightController = new TextEditingController();
  TextEditingController petGenderController = new TextEditingController();
  TextEditingController petAboutController = new TextEditingController();
  // List<Text> controllers = [userNameController.text];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
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
                userNameInput(),
                const SizedBox(height: 20),
                petNameInput(),
                const SizedBox(height: 20),
                Row(
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
                              OptionSelect(),
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
                            weightValue = newValue;
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

  saveButton() => Button(
      color: firstColor,
      text: 'Save Changes',
      vPadding: 10,
      hPadding: 15,
      onClicked: () {
        // Text(TextFieldModify.textController.value);
        // saveChanges();
        print(userNameController.text +
            petNameController.text +
            petAgeController.text +
            petBreedController.text +
            petWeightController.text +
            petGenderController.text +
            petAboutController.text);
      });

  // void saveChanges(){
  //   Navigator.of(context).pop(userNameController.text);
  //   Navigator.of(context).pop(petNameController.text);
  //   Navigator.of(context).pop(petAgeController.text);
  //   Navigator.of(context).pop(petBreedController.text);
  //   Navigator.of(context).pop(petWeightController.text);
  //   Navigator.of(context).pop(petGenderController.text);
  //   Navigator.of(context).pop(petAboutController.text);
  // }

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
            // onChanged: (value) => setState(() {
            //   this.textController = value;
            // });
            controller: userNameController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // labelText: 'Your Name',
              hintText: User.userName,
              // icon: Icon(Icons.mail),
              // prefixIcon: Icon(Icons.account_box),
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
            textInputAction: TextInputAction.done,
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
            controller: petNameController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // labelText: 'Pet\'s Name',
              hintText: User.pet.petName,
              // prefixIcon: Icon(Icons.pets),
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
          TextField(
            controller: petAgeController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // prefixIcon: Icon(Icons.pets),
              // labelText: 'Pet\'s Age',
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
            controller: petBreedController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // labelText: 'Pet\'s Breed',
              hintText: User.pet.breed,
              // icon: Icon(Icons.mail),
              // prefixIcon: Icon(Icons.pets),
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
            'Pet\'s Weight',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: petWeightController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // prefixIcon: Icon(Icons.pets),
              // labelText: 'Pet\'s Weight',
              // hintText: '${User.pet.weight}',
              hintText: weightValue.toString(),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            // onChanged: (text) => {weightValue.toString()},
          ),
        ],
      );

  petGenderInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pet\'s Gender',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: petGenderController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // labelText: 'Pet\'s Gender',
              hintText: User.pet.gender,
              // prefixIcon: Icon(Icons.pets),
              suffixIcon: petGenderController.text
                      .isEmpty //icon only appears when clicked on the text field
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        petGenderController
                            .clear(); //clears the text inside the tf
                      },
                    ),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
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
            controller: petAboutController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              // labelText: 'About Your Pet',
              hintText: User.pet.about,
              // prefixIcon: Icon(Icons.pets),
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
