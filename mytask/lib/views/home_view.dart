

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytask/widgets/platform_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 String? name;
 bool isLoading = false;
 TextEditingController _controller = TextEditingController();
@override
 void initState() {
    super.initState();
    name = "Guest";
  }
  @override
  Widget build(BuildContext context) {
    Widget title = const Text("Welcome");
    return SafeArea(
      child: PlatformController.getScaffold(
        
        cupertinoNavigationBar: CupertinoNavigationBar(
          middle: title,
        ), 
        materialAppBar: AppBar(
          title: title,
        ),
        drawer: Drawer(
          width: 200,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight:  Radius.circular(16))),
          child: Column(
            children: [
                const SizedBox(height: 80,),
                 Text('Welcome $name',
                 style:const  TextStyle(
                  fontFamily:'RaleWay' ,
                  fontWeight: FontWeight.w900,
                  fontSize: 24
                 ),),
            ],
          ),
        ),
         child: Container(
          width: MediaQuery.of(context).size.width,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60,),
              PlatformController.getButton(
                width: MediaQuery.of(context).size.width*0.86,
                text: 'Tap to Enter your name',
                 onPressed: (){
                  PlatformController.getLoadingWidget();
                  
                  if(Platform.isIOS){
                      CupertinoDialogRoute<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text('Enter Your Yame'),
                              content: PlatformController.getTextField(
                                  controller: _controller
                              ),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  onPressed: () {
                                  
                                     setState(() {

                                 name = _controller.text;
                                 });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Done'),
                                ),
                               
                              ],
                            );
                          },
                        );
                  }else{
                    
                    showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Enter Your Name'),
                      content: PlatformController.getTextField(
                        controller: _controller,
                        decorationAndroid: const InputDecoration(
                          hintText: 'name', 
                          border: OutlineInputBorder(),
                        ),

                      ),
                      actions: <Widget>[
                        PlatformController.getTextButton(text: "Done", onPressed: (){

                          setState(() {
                            name = _controller.text;
                            isLoading =true;
                          });
                         // _controller.dispose();
                          Navigator.pop(context);
                        })
                      ],
                    ));
                  }
        
    
    
                 }),
                 const SizedBox(height: 80,),
                 Text('Hie $name',

                 style:const  TextStyle(
                  fontFamily:'RaleWay' ,
                  fontWeight: FontWeight.w900,
                  fontSize: 24
                 ),)
                 
            ]
           ),
         ),
         bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            label: 'HOME',
            icon: PlatformController.getIcon(
            iconDataIOS: Icons.home,
            iconDataAndrroid: CupertinoIcons.home) ),
            BottomNavigationBarItem(
            label: 'Favorite',
            icon: PlatformController.getIcon(
            iconDataAndrroid: Icons.thumb_up,
            iconDataIOS: CupertinoIcons.hand_thumbsup) ),
            BottomNavigationBarItem(
            label: 'User',
            icon: PlatformController.getIcon(
            iconDataAndrroid: Icons.person,
            iconDataIOS: CupertinoIcons.person) )
         ])
         ),
    );
  }
}