part of '../get_it.dart';

@injectable
class Crashlytics {
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;
}
