import 'package:flutter/material.dart';
import '../datas/Lists.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      upperBound: 1,
      lowerBound: 0
    );
    controller.repeat();
  }

  @override
   dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff3083FF),
            Color(0xff00C6FF),
          ])),
          child: AppBar(
            leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded))
            ],
            elevation: 0,
            centerTitle: true,
            title: const Text("Treva", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const BouncingScrollPhysics(),
        children: planets.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "planet_details",arguments: e);
                    },
                    child: Stack(
                      alignment: const Alignment(0.60,0),
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width*0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3E3963),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:  [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(0,0),
                              ),
                            ]
                          ),
                          padding: const EdgeInsets.only(left: 80,top:10, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.planetName,style: const TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w500),),
                                  FloatingActionButton(
                                    onPressed: (){},
                                    elevation: 0,
                                    foregroundColor: const Color(0xffC2BDEA),
                                    backgroundColor: const Color(0xFF3E3963),
                                    mini: true,
                                    child: const Icon(Icons.more_vert_rounded),
                                  )
                                ],
                              ),
                              Text(e.galaxyName, style: const TextStyle(color: Color(0xffC2BDEA), fontSize: 15)),
                              const SizedBox(height: 5,),
                              const Divider(
                                endIndent: 180,
                                color: Color(0xffC2BDEA),
                                thickness: 5,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset('assets/images/png/ic_distance.png',width: 10),
                                  const SizedBox(width: 5,),
                                  Text(e.distanceFromSun,style: const TextStyle(color:Color(0xffC2BDEA)),),
                                  const Spacer(),
                                  Image.asset('assets/images/png/ic_gravity.png',width: 10),
                                  const SizedBox(width: 5,),
                                  Text(e.gravity,style: const TextStyle(color:Color(0xffC2BDEA)),),
                                  const SizedBox(width:20,),
                                ],
                              )
                            ],
                          )
                        ),
                        AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context,Widget? child){
                            return Transform.translate(
                              offset: const Offset(-205,0),
                              child: Transform.rotate(
                                  angle: controller.value*2*3.14159265359,
                                  child: child,
                              ),
                            );
                          },
                          child: Image.asset(e.image, width: 100,),
                        )
                      ],
                    ),
                  ),
                )
        ).toList(),
      ),
      backgroundColor: const Color(0xFF3E3963),
    );
  }
}


