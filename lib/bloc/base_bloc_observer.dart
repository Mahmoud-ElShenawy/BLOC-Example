import 'package:ajam/common/config/tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i(event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i(bloc);
  }
}

// BlocOverrides.runZoned(
// () => runApp(
// EasyLocalization(
// supportedLocales: const [Locale('en', ''), Locale('ar', '')],
// path: 'assets/locale',
// fallbackLocale: const Locale('ar', ''),
// assetLoader: const CodegenLoader(),
// saveLocale: true,
// child: const App(),
// ),
// ),
// blocObserver: BaseBlocObserver(),
// );