import 'package:disaster_app/models/send_post_methane.dart';

abstract class MathaneStates{}
class MathaneIntialState extends MathaneStates{}
class MathaneLoadinState extends MathaneStates{}
class MathaneErorrState extends MathaneStates{}
class MathaneSucessState extends MathaneStates{
  final SendMathanePost? mathanePost;

  MathaneSucessState(this.mathanePost);
}