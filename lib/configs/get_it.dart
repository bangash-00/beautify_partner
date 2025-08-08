import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'logger_service/crashlytics.dart';
part 'logger_service/firebase_observer.dart';
part 'logger_service/logger_service.dart';

final GetIt getIt = GetIt.instance;

/// Configure dependencies manually
void configureDependencies() {
  // Register LoggerService
  getIt.registerSingleton<LoggerService>(LoggerServiceDevelop());

  // TODO(): Enable when Firebase is properly configured.
  // getIt.registerSingleton<Crashlytics>(Crashlytics());
}
