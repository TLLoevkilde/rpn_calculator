
abstract class Command {
  apply (List<double> stack);
}

class Addition implements Command {
  double? numA;
  double? numB;
  @override
  apply (List<double> stack) {
    numA = stack.removeLast();
    numB = stack.removeLast();
    stack.add(numA! + numB!);
  }
}

class Subtraction implements Command {
  double? numA;
  double? numB;
  @override
  apply (List<double> stack) {
    numA = stack.removeLast();
    numB = stack.removeLast();
    stack.add(numA! - numB!);
  }
}

class Multiplication implements Command {
  double? numA;
  double? numB;
  @override
  apply (List<double> stack) {
    numA = stack.removeLast();
    numB = stack.removeLast();
    stack.add(numA! * numB!);
  }
}

class Division implements Command {
  double? numA;
  double? numB;
  @override
  apply (List<double> stack) {
    numA = stack.removeLast();
    numB = stack.removeLast();
    stack.add(numA! / numB!);
  }
}

class Calculator {
  final List<double> stack = [];
  final List<Command> history = [];
  push (double value){
    stack.add(value);
  }
  execute (Command command){
    command.apply(stack);
    history.add(command);
  }
}
