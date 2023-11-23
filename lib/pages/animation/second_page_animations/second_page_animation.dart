import 'package:animation_homework/pages/animation/lastpage_animated/lastpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextAnimation(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: SubTitleAnimation(),
            ),
            SizedBox(height: 20,),
            ContainerAnimation(),
            SizedBox(height: 20,),
            ContainerAnimationSecond(),
            SizedBox(height: 20,),
            ContainerAnimation(),
            SizedBox(height: 20,),
            ContainerAnimationSecond(),
            SizedBox(height: 20,),
            ContainerAnimation(),
            SizedBox(height: 20,),
            ContainerAnimationSecond(),
          ],
        ),
        ],
      ),
    );
  }
}

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key}) : super(key: key);

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubic));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const Text(
            "Choose\nyour plan",
            style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.w600,
              fontFamily: "Dosis",
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SubTitleAnimation extends StatefulWidget {
  const SubTitleAnimation({Key? key}) : super(key: key);

  @override
  _SubTitleAnimationState createState() => _SubTitleAnimationState();
}

class _SubTitleAnimationState extends State<SubTitleAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubic));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const Text(
            "you can always start with\na free plan and then upgrade",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "Dosis",
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> with TickerProviderStateMixin{
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubic));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 290,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text(
                  "noblack",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2,),
                Text(
                  "4.99\$ monthly",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                    "    Unlimited cards and spaces\ninvestments tips and much more",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "read all the features",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePageSecond(), // Replace YourNewPage with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: Text(
                    "I want this",
                    style: TextStyle(
                      color: Colors.green, // You can customize the color
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

              ],
            ),

          ),
        ),
      )
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ContainerAnimationSecond extends StatefulWidget {
  const ContainerAnimationSecond({super.key});

  @override
  State<ContainerAnimationSecond> createState() => _ContainerAnimationSecondState();
}

class _ContainerAnimationSecondState extends State<ContainerAnimationSecond> with TickerProviderStateMixin{
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubic));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 290,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(
                    "nowhite",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    "2.99\$ monthly",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      "    Two cards, one space\nand billing repository",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "read all the features",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePageSecond(), // Replace YourNewPage with the actual page you want to navigate to
                        ),
                      );
                    },
                    child: Text(
                      "I want this",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ],
              ),

            ),
          ),
        )
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}