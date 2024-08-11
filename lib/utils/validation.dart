import 'package:easy_localization/easy_localization.dart';
import 'package:qfly/data/Shared/countries.dart';

class Validation {
  String? confirmPass;
  Validation();
  Validation.pass(String value) {
    confirmPass = value;
  }

  String? emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Invalid Email'.tr();
    } else {
      return null;
    }
  }

  String? countryValidation(String? value) {
    if (CountriesData.countries.any(
          (element) => element.name.contains(value!),
        ) ||
        CountriesData.countries.any(
          (element) => element.code.contains(value!),
        )) {
      return null;
    }
    return "No country with that name";
  }

  String? mobileValidator(String? value) {
    String pattern =
        r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Phone number invalid'.tr();
    } else {
      return null;
    }
  }

  String? dateValidator(DateTime? value) {
    if (value == DateTime.now()) {
      return 'Please enter birth date';
    }
    return null;
  }

  String? passValidator(String? value) {
    if (value!.length < 5) {
      return 'password less than 8 char';
    } else {
      return null;
    }
  }

  String? empty(String? value) {
    if (value!.length == 0) {
      return 'empty_data'.tr();
    } else {
      return null;
    }
  }

  String? emptyDate(String? value) {
    if (value!.length == 0) {
      return 'date_invalid'.tr();
    } else {
      return null;
    }
  }

  String? emptyFile(String? value) {
    if (value!.length == 0) {
      return 'file_invalid'.tr();
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 11)
      return 'mobile_invalid'.tr();
    else
      return null;
  }

  String? matchPassword(String value) {
    if (!(value == confirmPass)) {
      return 'password does not match';
    } else {
      return null;
    }
  }

  String? emptyField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName ';
    }
    return null;
  }
}
