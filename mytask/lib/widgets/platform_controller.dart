
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformController{
  static Widget getAppWidget(BuildContext context, Widget homeWidget){
    String title = 'Todo';

    if (Platform.isIOS){
      return CupertinoApp(
        title: title,
        home: homeWidget,
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue
        ),
      );
    }else {
      return MaterialApp(
        title: title,
        home: homeWidget,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
      );
    }
  }

  static Widget getScaffold({

    Color? backgroundColor,
    required ObstructingPreferredSizeWidget cupertinoNavigationBar,
    required AppBar materialAppBar,
    required Widget child,
    Widget? drawer,
    Widget? bottomNavigationBar,
    bool resizeToAvoidBotttomInset = true
     }){

    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: Material(child: child),
        backgroundColor: backgroundColor,
        navigationBar: cupertinoNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBotttomInset,
        );
    }else{
      return Scaffold(
        body: child,
        backgroundColor: backgroundColor,
        appBar: materialAppBar,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
      );
    }
  }

  static Widget getButton({
    double? width,
    required String text,
    required VoidCallback onPressed,
  }){
    if(Platform.isIOS){
      return CupertinoButton.filled(
        child: Text(text), 
        onPressed: onPressed);
    }else{
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Text(text),
        ),
      );
      

    }
  }

static Widget getTextButton({
  required String text,
  required VoidCallback onPressed
}){
  if(Platform.isIOS){
    return CupertinoButton(
      child: Text(text), onPressed: onPressed);
  }else{
    return TextButton(
      onPressed: onPressed,
       child: Text(text));
  }
}
static Widget getLoadingWidget(){
  if(Platform.isIOS){
    return const CupertinoActivityIndicator();
  }else {
    return const CircularProgressIndicator(
    
    );
  }
}
static Widget getTextField({
  bool autoFocus = false,
  TextEditingController? controller,
  int? maxLines,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextInputAction textInputAction = TextInputAction.done,
  BoxDecoration? decorationIOS,
  InputDecoration? decorationAndroid,
  ValueSetter<String>? onChanged,
  String? placeholder
}){
  if(Platform.isIOS){
    return CupertinoTextField(
      textInputAction: textInputAction,
      autofocus: autoFocus,
      controller: controller,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      decoration: decorationIOS,
      placeholder: placeholder,
      onChanged: (input)=> onChanged!(input),
    );
  }else{
    return TextField(
      
      textInputAction: textInputAction,
      autofocus: autoFocus,
      controller: controller,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      decoration: decorationAndroid,
      //onChanged: (input)=> onChanged!(input),
    );
  }
}



static Widget getIcon({
  required IconData iconDataIOS,
  required IconData iconDataAndrroid,
}){
  if(Platform.isIOS){
    return Icon(iconDataIOS);
  }else{
    return Icon(iconDataAndrroid);
  }
 } 
}