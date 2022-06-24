import 'package:flutter/material.dart';

import '../model/Models.dart';

class PlanetDetails extends StatefulWidget {
  const PlanetDetails({Key? key}) : super(key: key);

  @override
  State<PlanetDetails> createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
        upperBound: 1,
        lowerBound: 0);
    controller.repeat();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Planet;

    openBottomSheet(){
      return showModalBottomSheet(
          backgroundColor: const Color(0xFF3E3963),
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)),
          ),
          builder: (context) {
            return Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Color(0xff3083FF),
                          Color(0xff00C6FF),
                        ])),
                    child:  Text(
                      "Welcome To ${args.planetName}",
                      style: const TextStyle(
                          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Distance From Sun",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10,),
                  Text(args.distanceFromSun,style: const TextStyle(
                      color: Color(0xffC2BDEA), fontSize: 22),),
                  const SizedBox(height: 20,),
                  const Text(
                    "Distance From Earth",
                    style:  TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10,),
                  Text(args.distanceFromEarth,style: const TextStyle(
                      color: Color(0xffC2BDEA), fontSize: 22)),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF3E3963),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 20),
        children: [
          Stack(
            alignment: const Alignment(0, -2),
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 100, bottom: 30, right: 30, left: 30),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFF3E3963),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                child: Column(
                  children: [
                    Text(
                      args.planetName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(args.galaxyName,
                        style: const TextStyle(
                            color: Color(0xffC2BDEA), fontSize: 15)),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset('assets/images/png/ic_distance.png',
                            width: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.distanceFromSun,
                          style: const TextStyle(color: Color(0xffC2BDEA)),
                        ),
                        const Spacer(),
                        Image.asset('assets/images/png/ic_gravity.png',
                            width: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.gravity,
                          style: const TextStyle(color: Color(0xffC2BDEA)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return GestureDetector(
                      onTap: () {
                        openBottomSheet();
                      },
                      child: Transform.rotate(
                        angle: controller.value * 2 * 3.14159265359,
                        child: child,
                      ),
                    );
                  },
                  child: Image.asset(
                    args.image,
                    width: 130,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Overview",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(args.description,
              style: const TextStyle(color: Color(0xffC2BDEA), fontSize: 20),
              textAlign: TextAlign.center),
        ],
      ),
      backgroundColor: const Color(0xFF3E3963),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: 80,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            gradient: LinearGradient(colors: [
              Color(0xff3083FF),
              Color(0xff00C6FF),
            ])),
        child:GestureDetector(
            onTap: (){
              openBottomSheet();
            },
            child: const Text('Show Distance',style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500,))),
      ),
    );
  }
}
