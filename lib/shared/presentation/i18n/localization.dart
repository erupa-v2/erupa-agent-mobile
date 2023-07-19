import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localization_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'proceed'**
  String get proceed;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'welcome to erupā'**
  String get welcome;

  /// No description provided for @easilyFindSearchAndHire.
  ///
  /// In en, this message translates to:
  /// **'easily search, find and hire experts to assist you, in all your endeavours.'**
  String get easilyFindSearchAndHire;

  /// No description provided for @loginOrSignup.
  ///
  /// In en, this message translates to:
  /// **'log in or sign up to erupā'**
  String get loginOrSignup;

  /// No description provided for @weWillTextOrCallYou.
  ///
  /// In en, this message translates to:
  /// **'we wil text you to confirm your number, standard messages and data rates may apply.'**
  String get weWillTextOrCallYou;

  /// No description provided for @confirmYourNumber.
  ///
  /// In en, this message translates to:
  /// **'confirm your number'**
  String get confirmYourNumber;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'confirm otp verification'**
  String get verification;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'We have sent you a 6-digit confirmation code, kindly enter the code below'**
  String get enterCode;

  /// No description provided for @codeSent.
  ///
  /// In en, this message translates to:
  /// **'Otp code successfully sent'**
  String get codeSent;

  /// No description provided for @authenticatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully authenticated 🎉'**
  String get authenticatedSuccess;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @editNumber.
  ///
  /// In en, this message translates to:
  /// **'Edit number'**
  String get editNumber;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @wrongOtp.
  ///
  /// In en, this message translates to:
  /// **'You entered a wrong otp code'**
  String get wrongOtp;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get request;

  /// No description provided for @whatDoYouNeed.
  ///
  /// In en, this message translates to:
  /// **'What do you need ?'**
  String get whatDoYouNeed;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select your location'**
  String get selectLocation;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help ? 😉'**
  String get needHelp;

  /// No description provided for @needAnExpert.
  ///
  /// In en, this message translates to:
  /// **'Need an expert, search now !'**
  String get needAnExpert;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @immigrationAgent.
  ///
  /// In en, this message translates to:
  /// **'Immigration agent'**
  String get immigrationAgent;

  /// No description provided for @showProfile.
  ///
  /// In en, this message translates to:
  /// **'Show profile'**
  String get showProfile;

  /// No description provided for @becomeAnAgent.
  ///
  /// In en, this message translates to:
  /// **'Become an agent'**
  String get becomeAnAgent;

  /// No description provided for @becomeAnAgentDescription.
  ///
  /// In en, this message translates to:
  /// **'It is simple to set up and start earning more !!'**
  String get becomeAnAgentDescription;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @loginAndSecurity.
  ///
  /// In en, this message translates to:
  /// **'Change phone number'**
  String get loginAndSecurity;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @visitOurWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit our website'**
  String get visitOurWebsite;

  /// No description provided for @giveUsFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give us feedback'**
  String get giveUsFeedback;

  /// No description provided for @howToUse.
  ///
  /// In en, this message translates to:
  /// **'How erupa works'**
  String get howToUse;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @priacyAndSharing.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Sharing'**
  String get priacyAndSharing;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get terms;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @newUserWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to erupā 🍾'**
  String get newUserWelcome;

  /// No description provided for @profileDetailsSharing.
  ///
  /// In en, this message translates to:
  /// **'Your profile details are shared with the agent you are requesting help from.'**
  String get profileDetailsSharing;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
