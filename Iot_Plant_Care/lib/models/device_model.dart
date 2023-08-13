class DataModel {
  String temperature;
  String mositure;
  String humidity;
 //Construction
  DataModel.fromJson(Map<String,dynamic> json)
  : temperature = json['Temperature'],
        mositure = json['Mositure'],
        humidity = json['Humidity'];
  // a Method that convert object to json
Map<String,dynamic> toJson() =>{
  'Temperature' : temperature,
  'Mositure' : mositure,
  'Humidity' : humidity
};
}