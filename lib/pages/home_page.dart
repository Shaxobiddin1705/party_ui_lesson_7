import 'package:flutter/material.dart';
import 'package:party_ui_lesson_7/animation/animation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  bool isPressed = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.5),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ]),
            image: const DecorationImage(
              image: AssetImage("assets/images/img.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeAnimation(1.1, Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                child: const Text(
                  "Find the best parties near you.",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 35,),
                ),
              )),
              FadeAnimation(1.1, const SizedBox(
                height: 15,
              ),),
              FadeAnimation(1.1, Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                child: const Text(
                  "Let us find you a party for your interest",
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              )),
              FadeAnimation(1.1, SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.55,
              ),),
              FadeAnimation(1.1, AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: isPressed ? FadeAnimation(1.1, Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.35,
                      onPressed: () {},
                      child: const Text("Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      color:  Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(width: 20,),
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.35,
                      onPressed: () {},
                      child: const Text("Facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                )) : MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  child: Text("Start",
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: !isPressed ? Colors.amber.shade700 : Colors
                      .redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),),
              FadeAnimation(1.1, const SizedBox(
                height: 40,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
