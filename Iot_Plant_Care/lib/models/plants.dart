class Plant {
  final int plantId;
  final String size;
  final int humidity;
  final String temperature;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
        required this.plantName,
        required this.size,
        required this.humidity,
        required this.temperature,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        plantName: 'Sanseviera',
        size: 'Small',
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: true,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 1,
        plantName: 'Philodendron',
        size: 'Medium',
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant2.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 2,
        plantName: 'Beach Daisy',
        size: 'Large',
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 3,
        plantName: 'Big Bluestem',
        size: 'Small',
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 4,
        plantName: 'Azalea',
        size: 'Large',
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant5.png',
        isFavorated: true,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 5,
        plantName: 'Meadow Sage',
        size: 'Medium',
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant6.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 6,
        plantName: 'Plumbago',
        size: 'Small',
        humidity: 36,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 7,
        plantName: 'Tritonia',
        size: 'Medium',
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-eight.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 8,
        plantName: 'Clementine',
        size: 'Medium',
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant9.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 9,
        plantName: 'Hazel',
        size: 'Medium',
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant10.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants(){
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

//  // Get the cart items
//   static List<Plant> addedToCartPlants(){
//     List<Plant> _selectedPlants = Plant.plantList;
//     return _selectedPlants.where((element) => element.isSelected == true).toList();
//   }
//
// factory Plant.fromJSON(Map<String, dynamic>json){
//   return Plant(plantId: json['plant_id'] as int,
//       plantName: json['plantname'],
//       // size: size,
//       // humidity: humidity,
//       // temperature: temperature,
//       imageURL: json['image'] as String,
//       decription: json['description'] as String, isFavorated: null,
//       );
}



