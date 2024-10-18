class BodyMassIndex {
  final double weight; 
  final double height; 

  BodyMassIndex({required this.weight, required this.height});

  double calculateIMC() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getIMCCategory() {
    double bmi = calculateIMC();

    if (bmi < 18.5) {
      return 'Souspoids';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Surpoids';
    } else {
      return 'Obese';
    }
  }
}