import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation"),),
      body: SingleChildScrollView(
        child: Column(
           children: [

        Container(
          height: 200,
        width: 450,
          child: Center(child: Lottie.asset("assets/animation.json"),
          ),
        ),
             SizedBox(height: 20,),
             Container(
               height: 200,

               child: Center(child: Lottie.asset("assets/amfghh.json",fit: BoxFit.fill),
               ),
             ),
             SizedBox(height: 20,),
             Container(
               height: 200,
               width: 450,
               child: Center(child: Lottie.network("https://lottie.host/112699c3-9113-408a-97d5-a91c6eba0843/GZITzxiwSR.json"),
               ),
             ),

           ],
        ),
      ),
    );
  }
}
