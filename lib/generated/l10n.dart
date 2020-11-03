// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `من فضلك ادخل رقم بطاقه التأمين`
  String get idlNull {
    return Intl.message(
      'من فضلك ادخل رقم بطاقه التأمين',
      name: 'idlNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل تاريخ ميلاد صحيح`
  String get invalidDateOfBirth {
    return Intl.message(
      'من فضلك ادخل تاريخ ميلاد صحيح',
      name: 'invalidDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل تاريخ الميلاد`
  String get dateOfBirthNull {
    return Intl.message(
      'من فضلك ادخل تاريخ الميلاد',
      name: 'dateOfBirthNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك اضف تاريخ صحيح`
  String get shortDateOfBirth {
    return Intl.message(
      'من فضلك اضف تاريخ صحيح',
      name: 'shortDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل الاسم`
  String get nameNull {
    return Intl.message(
      'من فضلك ادخل الاسم',
      name: 'nameNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل رقم الهاتف`
  String get phoneNumberNull {
    return Intl.message(
      'من فضلك ادخل رقم الهاتف',
      name: 'phoneNumberNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل بريد إلكترونى صالح`
  String get invalidEmail {
    return Intl.message(
      'من فضلك أدخل بريد إلكترونى صالح',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف قصير`
  String get shortPhone {
    return Intl.message(
      'رقم الهاتف قصير',
      name: 'shortPhone',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب!`
  String get inputNull {
    return Intl.message(
      'هذا الحقل مطلوب!',
      name: 'inputNull',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ اثناء التسجيل`
  String get signInFailed {
    return Intl.message(
      'حدث خطأ اثناء التسجيل',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `تأكد من الرقم التأينى وتاريخ الميلاد`
  String get idOrDateIsWrong {
    return Intl.message(
      'تأكد من الرقم التأينى وتاريخ الميلاد',
      name: 'idOrDateIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `فشل الاتصال حاول مره اخرى`
  String get noNetwork {
    return Intl.message(
      'فشل الاتصال حاول مره اخرى',
      name: 'noNetwork',
      desc: '',
      args: [],
    );
  }

  /// `البيانات ليست مكتمله!`
  String get dataIsNotCompleted {
    return Intl.message(
      'البيانات ليست مكتمله!',
      name: 'dataIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `© 2020 MedShield.كل الحقوق محفوظه `
  String get copyRights {
    return Intl.message(
      '© 2020 MedShield.كل الحقوق محفوظه ',
      name: 'copyRights',
      desc: '',
      args: [],
    );
  }

  /// `اختر لغه العرض المفضله`
  String get selectLanguageTitle {
    return Intl.message(
      'اختر لغه العرض المفضله',
      name: 'selectLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `رقم بطاقه التأمين`
  String get medicalIdNumber {
    return Intl.message(
      'رقم بطاقه التأمين',
      name: 'medicalIdNumber',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get signIn {
    return Intl.message(
      'تسجيل الدخول',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `رجوع`
  String get back {
    return Intl.message(
      'رجوع',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `الدخول كضيف`
  String get guest {
    return Intl.message(
      'الدخول كضيف',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get done {
    return Intl.message(
      'تم',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الميلاد`
  String get birthDate {
    return Intl.message(
      'تاريخ الميلاد',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `تنبيه`
  String get alert {
    return Intl.message(
      'تنبيه',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `ابحث فى شبكتنا`
  String get searchOurNetwork {
    return Intl.message(
      'ابحث فى شبكتنا',
      name: 'searchOurNetwork',
      desc: '',
      args: [],
    );
  }

  /// `شبكه مزودى الخدمه`
  String get network {
    return Intl.message(
      'شبكه مزودى الخدمه',
      name: 'network',
      desc: '',
      args: [],
    );
  }

  /// `الموافقات`
  String get approval {
    return Intl.message(
      'الموافقات',
      name: 'approval',
      desc: '',
      args: [],
    );
  }

  /// `سجل الموافقات`
  String get approvalHistory {
    return Intl.message(
      'سجل الموافقات',
      name: 'approvalHistory',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة الخصم`
  String get discountCard {
    return Intl.message(
      'بطاقة الخصم',
      name: 'discountCard',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصى`
  String get profile {
    return Intl.message(
      'الملف الشخصى',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `الدواء`
  String get medication {
    return Intl.message(
      'الدواء',
      name: 'medication',
      desc: '',
      args: [],
    );
  }

  /// `نوع التأمين`
  String get insuranceType {
    return Intl.message(
      'نوع التأمين',
      name: 'insuranceType',
      desc: '',
      args: [],
    );
  }

  /// `المفضلات`
  String get favourite {
    return Intl.message(
      'المفضلات',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message(
      'الإعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `معلومات عنا`
  String get aboutUs {
    return Intl.message(
      'معلومات عنا',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get signOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات`
  String get thisEmpty {
    return Intl.message(
      'لا توجد بيانات',
      name: 'thisEmpty',
      desc: '',
      args: [],
    );
  }

  /// `لم نعثر على اى بيانات`
  String get didNotFind {
    return Intl.message(
      'لم نعثر على اى بيانات',
      name: 'didNotFind',
      desc: '',
      args: [],
    );
  }

  /// `بيانات`
  String get data {
    return Intl.message(
      'بيانات',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `انطلق`
  String get go {
    return Intl.message(
      'انطلق',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسيه`
  String get home {
    return Intl.message(
      'الرئيسيه',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get more {
    return Intl.message(
      'المزيد',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `تصفيه`
  String get filter {
    return Intl.message(
      'تصفيه',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `الحصول على موافقه`
  String get getApproval {
    return Intl.message(
      'الحصول على موافقه',
      name: 'getApproval',
      desc: '',
      args: [],
    );
  }

  /// `موافقه جديده`
  String get addApproval {
    return Intl.message(
      'موافقه جديده',
      name: 'addApproval',
      desc: '',
      args: [],
    );
  }

  /// `إرسال`
  String get send {
    return Intl.message(
      'إرسال',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `عنوان البريد الإلكترونى`
  String get email {
    return Intl.message(
      'عنوان البريد الإلكترونى',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `نوع الموافقه`
  String get approvalType {
    return Intl.message(
      'نوع الموافقه',
      name: 'approvalType',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `مزيد من التفاصيل`
  String get moreDetails {
    return Intl.message(
      'مزيد من التفاصيل',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `أضف ملف`
  String get attachFile {
    return Intl.message(
      'أضف ملف',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `{count} ملفات تم رفعها `
  String filesUploaded(Object count) {
    return Intl.message(
      '$count ملفات تم رفعها ',
      name: 'filesUploaded',
      desc: '',
      args: [count],
    );
  }

  /// `الإسم`
  String get name {
    return Intl.message(
      'الإسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `الشركه`
  String get company {
    return Intl.message(
      'الشركه',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `النوع`
  String get gender {
    return Intl.message(
      'النوع',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ البدء`
  String get startDate {
    return Intl.message(
      'تاريخ البدء',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الإنتهاء`
  String get endDate {
    return Intl.message(
      'تاريخ الإنتهاء',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get phoneNumber {
    return Intl.message(
      'رقم الهاتف',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصى`
  String get editProfile {
    return Intl.message(
      'تعديل الملف الشخصى',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `الموقع`
  String get location {
    return Intl.message(
      'الموقع',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `الفئه`
  String get category {
    return Intl.message(
      'الفئه',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `التخصص`
  String get specialization {
    return Intl.message(
      'التخصص',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get telPhone {
    return Intl.message(
      'الهاتف',
      name: 'telPhone',
      desc: '',
      args: [],
    );
  }

  /// `المفضله`
  String get favorite {
    return Intl.message(
      'المفضله',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `الدردشه`
  String get chat {
    return Intl.message(
      'الدردشه',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد رسائل الى الان`
  String get noMessagesYet {
    return Intl.message(
      'لا يوجد رسائل الى الان',
      name: 'noMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message(
      'إلغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من اتصالك بالانترنت`
  String get socketException {
    return Intl.message(
      'تحقق من اتصالك بالانترنت',
      name: 'socketException',
      desc: '',
      args: [],
    );
  }

  /// `تعذر الاتصال بالخادم`
  String get httpException {
    return Intl.message(
      'تعذر الاتصال بالخادم',
      name: 'httpException',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير متوقع`
  String get formatException {
    return Intl.message(
      'حدث خطأ غير متوقع',
      name: 'formatException',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاوله`
  String get retry {
    return Intl.message(
      'إعادة المحاوله',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `لم تقم بتغيير أى بيانات`
  String get noChangedData {
    return Intl.message(
      'لم تقم بتغيير أى بيانات',
      name: 'noChangedData',
      desc: '',
      args: [],
    );
  }

  /// `منطقة`
  String get area {
    return Intl.message(
      'منطقة',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `محافظة`
  String get governorate {
    return Intl.message(
      'محافظة',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `أنت غير مسجل`
  String get notAuth {
    return Intl.message(
      'أنت غير مسجل',
      name: 'notAuth',
      desc: '',
      args: [],
    );
  }

  /// `اللغه`
  String get language {
    return Intl.message(
      'اللغه',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `مسح ذاكرة التخزين المؤقت`
  String get clearCache {
    return Intl.message(
      'مسح ذاكرة التخزين المؤقت',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `رقم الموافقه`
  String get approvalId {
    return Intl.message(
      'رقم الموافقه',
      name: 'approvalId',
      desc: '',
      args: [],
    );
  }

  /// `التاريخ`
  String get date {
    return Intl.message(
      'التاريخ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `عنوان الموافقه`
  String get approvalTitle {
    return Intl.message(
      'عنوان الموافقه',
      name: 'approvalTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
