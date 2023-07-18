import 'package:disaster_app/models/send_post_normal.dart';

abstract class NormalStates{}
class NormalIntialState extends NormalStates{}
class NormalLoadinState extends NormalStates{}
class NormalErorrState extends NormalStates{}
class NormalSucessState extends NormalStates{
  final SendNormalPost? normalPost;

  NormalSucessState(this.normalPost);
}