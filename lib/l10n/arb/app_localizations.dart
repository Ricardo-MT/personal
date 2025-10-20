import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @sectionA1.
  ///
  /// In en, this message translates to:
  /// **''**
  String get sectionA1;

  /// No description provided for @sectionA2.
  ///
  /// In en, this message translates to:
  /// **'software developer, with 6 years of intensive experience in building tailor-made '**
  String get sectionA2;

  /// No description provided for @sectionA3.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL PRODUCTS '**
  String get sectionA3;

  /// No description provided for @sectionA4.
  ///
  /// In en, this message translates to:
  /// **', working closely with clients and managing small teams.\n\nI also partake in all phases of '**
  String get sectionA4;

  /// No description provided for @sectionA5.
  ///
  /// In en, this message translates to:
  /// **'PRODUCT DESIGN'**
  String get sectionA5;

  /// No description provided for @sectionA6.
  ///
  /// In en, this message translates to:
  /// **', from ideation and high-fidelity UI to UX.'**
  String get sectionA6;

  /// No description provided for @sectionA7.
  ///
  /// In en, this message translates to:
  /// **'\n\n Always striving for '**
  String get sectionA7;

  /// No description provided for @sectionA8.
  ///
  /// In en, this message translates to:
  /// **'SIMPLE '**
  String get sectionA8;

  /// No description provided for @sectionA9.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get sectionA9;

  /// No description provided for @sectionA10.
  ///
  /// In en, this message translates to:
  /// **'PRACTICAL '**
  String get sectionA10;

  /// No description provided for @sectionA11.
  ///
  /// In en, this message translates to:
  /// **'solutions in order to maximize the '**
  String get sectionA11;

  /// No description provided for @sectionA12.
  ///
  /// In en, this message translates to:
  /// **'RESULT'**
  String get sectionA12;

  /// No description provided for @sectionA13.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get sectionA13;

  /// No description provided for @sectionBExp1Title.
  ///
  /// In en, this message translates to:
  /// **'Senior Front Dev'**
  String get sectionBExp1Title;

  /// No description provided for @sectionBExp1Location.
  ///
  /// In en, this message translates to:
  /// **'CRMPAM, Gibraltar'**
  String get sectionBExp1Location;

  /// No description provided for @sectionBExp1Time.
  ///
  /// In en, this message translates to:
  /// **'2025 - ongoing'**
  String get sectionBExp1Time;

  /// No description provided for @sectionBExp2Title.
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get sectionBExp2Title;

  /// No description provided for @sectionBExp2Location.
  ///
  /// In en, this message translates to:
  /// **'DigitalBeat, Gibraltar'**
  String get sectionBExp2Location;

  /// No description provided for @sectionBExp2Time.
  ///
  /// In en, this message translates to:
  /// **'2023 - 2025'**
  String get sectionBExp2Time;

  /// No description provided for @sectionBExp3Title.
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get sectionBExp3Title;

  /// No description provided for @sectionBExp3Location.
  ///
  /// In en, this message translates to:
  /// **'Talan, Malaga'**
  String get sectionBExp3Location;

  /// No description provided for @sectionBExp3Time.
  ///
  /// In en, this message translates to:
  /// **'2022 - 2023'**
  String get sectionBExp3Time;

  /// No description provided for @sectionBExp4Title.
  ///
  /// In en, this message translates to:
  /// **'Software Developer'**
  String get sectionBExp4Title;

  /// No description provided for @sectionBExp4Location.
  ///
  /// In en, this message translates to:
  /// **'Boorpret, Cádiz'**
  String get sectionBExp4Location;

  /// No description provided for @sectionBExp4Time.
  ///
  /// In en, this message translates to:
  /// **'2020 - 2022'**
  String get sectionBExp4Time;

  /// No description provided for @sectionCSection1.
  ///
  /// In en, this message translates to:
  /// **'PROGRAMMING\nLANGUAGES'**
  String get sectionCSection1;

  /// No description provided for @sectionCSection2.
  ///
  /// In en, this message translates to:
  /// **'FRAMEWORKS\n& LIBRARIES'**
  String get sectionCSection2;

  /// No description provided for @sectionCSection3.
  ///
  /// In en, this message translates to:
  /// **'OTHER\nTECH'**
  String get sectionCSection3;

  /// No description provided for @sectionE1.
  ///
  /// In en, this message translates to:
  /// **'I\'ve always been '**
  String get sectionE1;

  /// No description provided for @sectionE2.
  ///
  /// In en, this message translates to:
  /// **'HORIZONTALLY SCOPED '**
  String get sectionE2;

  /// No description provided for @sectionE3.
  ///
  /// In en, this message translates to:
  /// **'in regard to my abilities, and never had a specialised or well defined trade.\n\nFor the last 4 years I\'ve worked very hard on getting as good as I can in '**
  String get sectionE3;

  /// No description provided for @sectionE4.
  ///
  /// In en, this message translates to:
  /// **'SOFTWARE DEVELOPMENT'**
  String get sectionE4;

  /// No description provided for @sectionE5.
  ///
  /// In en, this message translates to:
  /// **', building a more vertically scoped profile in the field I love.\n\nI became to understand how mastering skills takes '**
  String get sectionE5;

  /// No description provided for @sectionE6.
  ///
  /// In en, this message translates to:
  /// **'TIME '**
  String get sectionE6;

  /// No description provided for @sectionE7.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get sectionE7;

  /// No description provided for @sectionE8.
  ///
  /// In en, this message translates to:
  /// **'DEDICATION'**
  String get sectionE8;

  /// No description provided for @sectionE9.
  ///
  /// In en, this message translates to:
  /// **', but with the proper strategy, this journey can be extremely fun and exciting. I learned to deal with impostor syndrome, to manage the overwhelming and rapidly-blooming technologies, to overcome burnouts, to make the most out of my '**
  String get sectionE9;

  /// No description provided for @sectionE10.
  ///
  /// In en, this message translates to:
  /// **'PRODUCTIVITY PEAKS'**
  String get sectionE10;

  /// No description provided for @sectionE11.
  ///
  /// In en, this message translates to:
  /// **', and to push everyone working around me towards a better version of themselves.\n\nI am a supportive '**
  String get sectionE11;

  /// No description provided for @sectionE12.
  ///
  /// In en, this message translates to:
  /// **'TEAM PLAYER'**
  String get sectionE12;

  /// No description provided for @sectionE13.
  ///
  /// In en, this message translates to:
  /// **', very proactive and always with a '**
  String get sectionE13;

  /// No description provided for @sectionE14.
  ///
  /// In en, this message translates to:
  /// **'CAN-DO '**
  String get sectionE14;

  /// No description provided for @sectionE15.
  ///
  /// In en, this message translates to:
  /// **'attitude. For the past 6 years I\'ve had a '**
  String get sectionE15;

  /// No description provided for @sectionE16.
  ///
  /// In en, this message translates to:
  /// **'CONTINUOUS '**
  String get sectionE16;

  /// No description provided for @sectionE17.
  ///
  /// In en, this message translates to:
  /// **'improvement mindset as I strive to become '**
  String get sectionE17;

  /// No description provided for @sectionE18.
  ///
  /// In en, this message translates to:
  /// **'BETTER '**
  String get sectionE18;

  /// No description provided for @sectionE19.
  ///
  /// In en, this message translates to:
  /// **'everyday, reinforcing my lifelong learning eagerness.\n\nI now aspire to contribute to the community, increase my professional network and carry on following my carefully tailored career pathway.\n\nStill horizontal, but propelling in '**
  String get sectionE19;

  /// No description provided for @sectionE20.
  ///
  /// In en, this message translates to:
  /// **'VERTICAL'**
  String get sectionE20;

  /// No description provided for @sectionE21.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get sectionE21;

  /// No description provided for @sectionProjects.
  ///
  /// In en, this message translates to:
  /// **'PROJECTS'**
  String get sectionProjects;

  /// No description provided for @sectionProjectsBreakWord.
  ///
  /// In en, this message translates to:
  /// **'PROJ\nECTS'**
  String get sectionProjectsBreakWord;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
