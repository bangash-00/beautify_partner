part of '../get_it.dart';

class FirebaseObserver extends TalkerObserver {
  FirebaseObserver({
    required this.crashlytics,
  });

  Crashlytics crashlytics;

  @override
  void onError(TalkerError err) {
    super.onError(err);
    crashlytics.crashlytics.recordError(err.error, err.stackTrace);
  }

  @override
  void onLog(TalkerData log) {
    super.onLog(log);
    FirebaseCrashlytics.instance.log(log.generateTextMessage());
  }
}
