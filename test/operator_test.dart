import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/calculator.dart';

void main() {
  group('Calculator Operations', () {
    test('Addition apply', () {
      // Arrange
      final addition = Addition();
      final stack = [4.0, 3.0, 2.0];

      // Act
      addition.apply(stack);

      // Assert
      expect(stack.length, equals(2));
      expect(stack[1], equals(5.0));
      expect(stack[0], equals(4.0));
    });

    test('Subtraction', () {
      final subtraction = Subtraction();
      final stack = [10.0, 3.0, 2.0];

      subtraction.apply(stack);

      expect(stack.length, equals(2));
      expect(stack[1], equals(-1.0));
      expect(stack[0], equals(10.0));
    });

    test('Multiplication', () {
      final multiplication = Multiplication();
      final stack = [5.0, 3.0, 2.0];

      multiplication.apply(stack);

      expect(stack.length, equals(2));
      expect(stack[1], equals(6.0));
      expect(stack[0], equals(5.0));
    });

    test('Division', () {
      final division = Division();
      final stack = [12.0, 4.0, 8.0];

      division.apply(stack);

      expect(stack.length, equals(2));
      expect(stack[1], equals(2.0));
      expect(stack[0], equals(12.0));
    });


  });
}
