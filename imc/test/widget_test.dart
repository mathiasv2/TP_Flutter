import 'package:flutter_test/flutter_test.dart';
import 'package:imc/body_mass_index.dart';

void main() {
  group('IMC Calculator', (){
    test("should return 25.08 with 84 kg and 183cm", (){
      final calculator = BodyMassIndex(weight: 84, height: 183);

      expect(calculator.calculateIMC(), 25.08);
    });
  });
}

