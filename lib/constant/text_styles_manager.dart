import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts_manager.dart';
import 'glopal_app.dart';

class TextStylesManager {

   static TextStyle lightStyle({double fontSize= 14,Color? color=black}){
    return  TextStyle(
      fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
      fontWeight: FontWeightManager.light,
      fontSize: fontSize,
      color: color,

    );
  }
   static TextStyle regularStyle({double fontSize= 14,Color? color=black}){
    return  TextStyle(
      fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
      fontWeight: FontWeightManager.regular,
      fontSize: fontSize,
      color: color,

    );
  }
   static TextStyle mediumStyle({double fontSize= 14,Color? color=black}){
    return  TextStyle(
      fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
      fontWeight: FontWeightManager.medium,
      fontSize: fontSize,
      color: color,


    );
  }
   static TextStyle semiBoldStyle({double fontSize= 14,Color? color=black}){
    return  TextStyle(
      fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
      fontWeight: FontWeightManager.semiBold,
      fontSize: fontSize,
      color: color,

    );
  }
   static TextStyle semiBoldThroughLineStyle({double fontSize= 14,Color? color=black}){
     return  TextStyle(
       fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
       fontWeight: FontWeightManager.semiBold,
       fontSize: fontSize,
       color: color,
      decoration: TextDecoration.lineThrough

     );
   }
   static TextStyle boldStyle({double fontSize= 14,Color? color=black}){
    return  TextStyle(
      fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
      fontWeight: FontWeightManager.bold,
      fontSize: fontSize,
      color: color,

    );
  }
   static TextStyle regularUnderLineStyle({double fontSize= 14,Color? color=black}){
     return  TextStyle(
       fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
       fontWeight: FontWeightManager.regular,
       fontSize: fontSize,
       decoration:   TextDecoration.underline,

       color: color,

     );

   }
   static TextStyle mediumUnderLineStyle({double fontSize= 14,Color? color=black}){
     return  TextStyle(
       fontFamily:GlopalApp.langId==0? FontFamilyManager.fontFamilyEn:FontFamilyManager.fontFamilyAr,
       fontWeight: FontWeightManager.medium,
       fontSize: fontSize,
       decoration:   TextDecoration.underline,

       color: color,

     );}
}



