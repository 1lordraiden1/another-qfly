import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/bloc/cubit/main/main_cubit.dart';
import 'package:qfly/bloc/cubit/onboard/onboard_cubit.dart';
import 'package:qfly/presentation/screens/about/about_screen.dart';
import 'package:qfly/presentation/screens/booking/booking_screen.dart';
import 'package:qfly/presentation/screens/change_pass/change_pass_screen.dart';
import 'package:qfly/presentation/screens/checkout/checkout_screen.dart';
import 'package:qfly/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:qfly/presentation/screens/currency/currency_screen.dart';
import 'package:qfly/presentation/screens/display_images/display_image_screen.dart';
import 'package:qfly/presentation/screens/favorite/favorite_items_screen.dart';
import 'package:qfly/presentation/screens/favorite/favorite_screen.dart';
import 'package:qfly/presentation/screens/flight/flight_list_screen.dart';
import 'package:qfly/presentation/screens/forget_pass/forget_pass_screen.dart';
import 'package:qfly/presentation/screens/home/home_screen.dart';
import 'package:qfly/presentation/screens/hotel_details/hotel_details_screen.dart';
import 'package:qfly/presentation/screens/hotels/select_hotels_screen.dart';
import 'package:qfly/presentation/screens/language/screens/language_screen.dart';
import 'package:qfly/presentation/screens/login/login_screen.dart';
import 'package:qfly/presentation/screens/main/main_screen.dart';
import 'package:qfly/presentation/screens/notification/notification_screen.dart';
import 'package:qfly/presentation/screens/onboard/onboard_screen.dart';
import 'package:qfly/presentation/screens/otp/otp_screen.dart';
import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/screens/privace_policy/privacy_policy_screen.dart';
import 'package:qfly/presentation/screens/profile/profile_screen.dart';
import 'package:qfly/presentation/screens/review_flight/review_flight_screen.dart';
import 'package:qfly/presentation/screens/signup/signup_screen.dart';
import 'package:qfly/presentation/screens/splash/splash_screen.dart';
import 'package:qfly/presentation/screens/terms/terms_screen.dart';
import 'package:qfly/presentation/screens/wallet/wallet_screen.dart';

import 'app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      //splash
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      //onBoard
      case Routes.onBoardRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => OnBoardCubit(), child: OnBoardScreen()));

      //main
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => MainCubit(), child: const MainScreen()));
      //login
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      //signup
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      //forget pass
      case Routes.forgetPassRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPassScreen());
      //otp
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      //home
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      //booking
      case Routes.bookingRoute:
        return MaterialPageRoute(builder: (_) => const BookingScreen());
      //review flight
      /* case Routes.reviewFlightRoute:
        return MaterialPageRoute(builder: (_) => const ReviewFlightScreen());
       */ //payment
      /* case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      //select hotel */
      /*  case Routes.selectHotelRoute:
        return MaterialPageRoute(builder: (_) => const SelectHotelScreen()); */
      // hotel details
      case Routes.hotelDetailsRoute:
        return MaterialPageRoute(builder: (_) => const HotelDetailsScreen());
      // favorite
      case Routes.favoriteRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());

      // favorite items
      case Routes.favoriteItemsRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteItemsScreen());

      // change pass
      case Routes.changePassRoute:
        return MaterialPageRoute(builder: (_) => const ChangePassScreen());
      // terms
      case Routes.termsRoute:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      // notification
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      // privacy poilcy
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      // display images
      case Routes.displayImagesRoute:
        return MaterialPageRoute(builder: (_) => DisplayImagesScreen());
      // checkout
      case Routes.checkoutRoute:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      // profile
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      // flight
      /* case Routes.flightListRoute:
        return MaterialPageRoute(
          builder: (_) => FlightListScreen(
            homeCubit: HomeCubit(),
          ),
        ); */
      // contact us
      case Routes.contactUsRoute:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      // contact us
      case Routes.currencyRoute:
        return MaterialPageRoute(builder: (_) => CurrencyScreen());
      // wallet
      case Routes.walletRoute:
        return MaterialPageRoute(builder: (_) => WalletScreen());
      // language
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      // about
      case Routes.aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('no found'),
              ),
              body: const Center(child: Text('no found')),
            ));
  }
}
