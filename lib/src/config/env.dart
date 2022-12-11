import 'package:envied/envied.dart';

part "env.g.dart";

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "TMDB_API", obfuscate: true)
  static const tmdbApiKey = _Env.tmdbApiKey;
}
