import 'package:fap/model/breed.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseServices {

  static final _dbName = 'captain_puppy_database.db';
  static final _dbVersion = 1;
  static var _database;

  Future<Database> getDatabase () async{
    if(_database!=null) {
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

   _initiateDatabase() async{
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
        join(await getDatabasesPath(), _dbName),
      onCreate: (db, version){
          return db.execute(
            'CREATE TABLE breed(breed_id INT PRIMARY KEY, name TEXT, life_span TEXT, temperament TEXT, weight TEXT, height TEXT, image_url TEXT);'
                'Cre'
          );
      },
      version: _dbVersion,
    );
  }

  Future<void> insertBreed(Breed breed) async {
    final db = await getDatabase();
    await db.insert(
      'breed',
      breed.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> isDatabaseExisting() async {
    String path = join(await getDatabasesPath(), _dbName);
    Future<bool> isDBExisting = databaseExists(path);

    return isDBExisting;
  }

  Future<List<Breed>> generateBreedList() async{
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('breed');
    print(maps.length.toString() + "HEHEHEHE");

    List<Breed> breedList = [];
    for(int i=0; i<maps.length; i++){
      Breed breed = Breed(
          id: maps[i]['breed_id'],
          name: maps[i]['name'],
          lifeSpan: maps[i]['life_span'],
          temperament: maps[i]['temperament'],
          weight: maps[i]['weight'],
          height: maps[i]['height'],
          imageURL: maps[i]['image_url']
      );
      breedList.add(breed);
    }

    return breedList;
    // return List.generate(maps.length, (i) {
    //   return Breed(
    //     id: maps[i]['id'],
    //     name: maps[i]['name'],
    //     lifeSpan: maps[i]['age'],
    //     temperament: maps[i]['temperament'],
    //     weight: maps[i]['weight'],
    //     height: maps[i]['height'],
    //     imageURL: maps[i]['image_url']
    //   );
    // });
  }
}