import 'package:get_it/get_it.dart';
import 'package:starwars/core/services/film/film_service.dart';
import 'package:starwars/modules/home/viewmodel/home_view_model.dart';
import 'package:starwars/modules/splash/viewmodel/splash_view_model.dart';

/*import 'package:shellbox_lite/core/services/authentication/authentication_service.dart';
import 'package:shellbox_lite/core/services/fuelling/fuelling_service.dart';
import 'package:shellbox_lite/core/services/mfa/mfa_service.dart';
import 'package:shellbox_lite/core/services/payment/payment_service.dart';
import 'package:shellbox_lite/core/services/payment_partners/payment_partners_service.dart';
import 'package:shellbox_lite/core/services/user/user_service.dart';
import 'package:shellbox_lite/core/services/whitelist/whitelist_service.dart';
import 'package:shellbox_lite/core/viewmodels/register_view_model.dart';
import 'package:shellbox_lite/core/viewmodels/welcome_view_model.dart';
import 'package:shellbox_lite/modules/authentication/viewmodels/login_view_model.dart';
import 'package:shellbox_lite/modules/fuelling/viewmodels/pre_fuelling_view_model.dart';
import 'package:shellbox_lite/modules/home/viewmodels/last_payment_view_model.dart';
import 'package:shellbox_lite/modules/home/viewmodels/payment_method_view_model.dart';*/
import 'package:starwars/utils/custom_converter.dart';
import 'package:starwars/utils/location_helper.dart';
/*import 'core/services/mfa/mfa_service.dart';
import 'modules/authentication/viewmodels/mfa_view_model.dart';
import 'modules/fuelling/viewmodels/waiting_payment_view_model.dart';
import 'modules/home/viewmodels/home_view_model.dart';
import 'modules/wallet/viewmodels/payment_add_card_view_model.dart';*/

GetIt locator = GetIt.instance;

Future setupLocator() async {

  locator.registerSingleton(CustomConverter());
  locator.registerSingleton(LocationHelper());
  locator.registerFactory(() => FilmService());
  /*locator.registerFactory(() => AuthenticationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerFactory(() => MFAService());
  locator.registerFactory(() => WhiteListService());
  locator.registerFactory(() => PaymentPartnersService());
  locator.registerLazySingleton(() => PaymentService());
  locator.registerLazySingleton(() => FuellingService());

  locator.registerFactory(() => WelcomeViewModel());
  locator.registerFactory(() => MFAViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => PaymentAddCardViewModel());
  locator.registerFactory(() => LastPaymentViewModel());
  locator.registerFactory(() => PaymentMethodViewModel());
  locator.registerFactory(() => WaitingPaymentViewModel());*/
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
}
