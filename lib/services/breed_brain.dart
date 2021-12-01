import 'package:fap/model/breed.dart';
import 'package:fap/services/database_services.dart';
import 'package:fap/services/networking.dart';

const dogKey = 'fc4aca68-5f0a-4082-9b5c-4459fdc86b11';
const dogURL = 'https://api.thedogapi.com/v1/';

class BreedBrain {
  var breedData;
  List<Breed> breeds = [];

  Future<void> generateBreedData() async {
    DatabaseServices databaseServices = DatabaseServices();
    bool isDatabaseExisting = await databaseServices.isDatabaseExisting();

    if (isDatabaseExisting) {
      breeds = await databaseServices.generateBreedList();
      return;
    }

    NetworkHelper networkHelper = NetworkHelper();
    var breedList = await networkHelper.getData(dogURL + 'breeds');
    breedData = breedList;

    int numberOfBreed = breedData.length;
    print(numberOfBreed.toString() + "WAKWAKWWW");

    for (int i = 0; i < numberOfBreed; i++) {
      int id = breedData[i]['id'];
      String name = breedData[i]['name'];
      String lifeSpan = breedData[i]['life_span'];

      String temperament = "";
      if (breedData[i]['temperament'] == null)
        temperament = "Data Unavailable";
      else
        temperament = breedData[i]['temperament'];

      String weight = breedData[i]['weight']['metric'];
      String height = breedData[i]['height']['metric'];
      String imageURL = breedData[i]['image']['url'];
      Breed breed = Breed(
          id: id,
          name: name,
          lifeSpan: lifeSpan,
          temperament: temperament,
          weight: weight,
          height: height,
          imageURL: imageURL);

      databaseServices.insertBreed(breed);
    }

    breeds = await databaseServices.generateBreedList();
  }

  List<Breed> getBreedList() {
    return breeds;
  }
}
