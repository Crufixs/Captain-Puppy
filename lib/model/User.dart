//define all the fields
import 'dart:convert';

import 'Note.dart';
import 'Pet.dart';
import 'expenses.dart';

class User {
  static String? userName;
  static late Pet pet;
  static List<Note> notes = [];
  static List<Expense> expenses = [];

  // const User({
  //   required this.userName,
  //   required this.pet
  // });

  static Map<String, dynamic> toJson() {
    // String encodedNotes = "";
    List mapNotes = [];

    for (int i = 0; i < notes.length; i++) {
      mapNotes.add(notes[i].toJson());
    }
    // encodedNotes = jsonEncode(mapNotes);

    return {
      'userName': userName,
      'petName': pet.petName,
      'breed': pet.breed,
      'gender': pet.gender,
      'age': pet.age,
      'weight': pet.weight,
      'about': pet.about,
      'petImage': pet.petImage,
      'notes': mapNotes,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    userName = json['userName'];

    Pet retrievedPet = Pet(
      petName: json['petName'],
      breed: json['breed'],
      gender: json['gender'],
      age: json['age'],
      weight: json['weight'],
      about: json['about'],
      petImage: json['petImage'],
    );
    pet = retrievedPet;

    var decodedNotes = json['notes'];
    for (int i = 0; i < decodedNotes.length; i++) {
      notes.add(
        new Note(decodedNotes[i]['title'], decodedNotes[i]['content'],
            decodedNotes[i]['date']),
      );
    }
  }
}
