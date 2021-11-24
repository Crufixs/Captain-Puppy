import 'package:fap/services/networking.dart';

const dogKey = 'fc4aca68-5f0a-4082-9b5c-4459fdc86b11';
const dogURL = 'https://api.thedogapi.com/v1/';

class BreedBrain{

  var breedData;

  Future<void> generateBreedData() async{
    NetworkHelper networkHelper = NetworkHelper();
    var breedList = await networkHelper.getData(dogURL + 'breeds');
    breedData = breedList;
  }

  dynamic getBreedData(){
    return breedData;
  }
}