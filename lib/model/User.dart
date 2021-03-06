import 'package:fap/model/expenses.dart';
import 'package:fap/services/expenses_brain.dart';
import 'Note.dart';
import 'Pet.dart';
import 'expenses.dart';

class User {
  static late String userName;
  static late Pet pet;
  static List<Note> notes = [];
  static List<Expense> expenses = [];
  static bool? isDarkMode;

  static Map<String, dynamic> toJson() {
    List mapNotes = [];
    List mapDog = [];

    for (int i = 0; i < notes.length; i++) {
      mapNotes.add(notes[i].toJson());
    }
    for (int i = 0; i < expenses.length; i++) {
      mapDog.add(expenses[i].toJson());
    }

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
      'expenses': mapDog,
      'isDarkMode': isDarkMode,
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

    var decodedExpenses = json['expenses'];
    for (int i = 0; i < decodedExpenses.length; i++) {
      expenses.add(new Expense(
          decodedExpenses[i]['index'],
          decodedExpenses[i]['productName'],
          ExpensesBrain.stringToType(decodedExpenses[i]['productType']),
          decodedExpenses[i]['cost'],
          decodedExpenses[i]['date']));
    }

    isDarkMode = json['isDarkMode'];
  }
}
