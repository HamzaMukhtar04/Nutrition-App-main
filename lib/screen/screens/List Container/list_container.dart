import 'package:flutter/material.dart';

class MyContainerInTopList extends StatelessWidget {

const MyContainerInTopList({super.key, required this.imgPath});
final String imgPath;
  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Container(clipBehavior: Clip.antiAliasWithSaveLayer ,
    height: mqSize.height*0.16,width: mqSize.width*0.38,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
     color: Colors.transparent,  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 5, spreadRadius: 0.5)]),
     child: Image.asset('$imgPath',fit: BoxFit.cover,),);
  }
  
}


class MyContainerInTopClass {
  final String imgPath;

  const MyContainerInTopClass({required this.imgPath});
}
