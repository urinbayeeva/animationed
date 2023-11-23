import 'package:animation_homework/pages/animation/second_page_animations/second_page_animation.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("N O B A N K",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          IconAnimation(key: AnimationKeys.iconAnimationKey),
          TextAnimation(key: AnimationKeys.textAnimationKey),
          const SizedBox(height: 20),
          SubTitleAnimation(key: AnimationKeys.subTitleAnimationKey),
          const SizedBox(height: 60),
          const Button(),
        ],
      ),
    );
  }
}


class AnimationControl {
  static void stopAnimations() {
    AnimationKeys.iconAnimationKey.currentState?.stopAnimation();
    AnimationKeys.textAnimationKey.currentState?.stopAnimation();
    AnimationKeys.subTitleAnimationKey.currentState?.stopAnimation();
  }
}

class AnimationKeys {
  static final GlobalKey<_IconAnimationState> iconAnimationKey =
  GlobalKey<_IconAnimationState>();
  static final GlobalKey<_TextAnimationState> textAnimationKey =
  GlobalKey<_TextAnimationState>();
  static final GlobalKey<_SubTitleAnimationState> subTitleAnimationKey =
  GlobalKey<_SubTitleAnimationState>();
}


class IconAnimation extends StatefulWidget {
  const IconAnimation({Key? key}) : super(key: key);

  @override
  State<IconAnimation> createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: const Offset(0, 0),
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                "assets/images/main.png", // Replace with your actual image asset
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void stopAnimation() {
    controller.stop();
  }
}

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key}) : super(key: key);

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _fadeAnimation,
        child: const Text(
          "The first bank\nwithout a bank",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w600,
            fontFamily: "Dosis",
          ),
        ),
      ),
    );
  }

  void stopAnimation() {
    controller.stop();
  }
}

class SubTitleAnimation extends StatefulWidget {
  const SubTitleAnimation({Key? key}) : super(key: key);

  @override
  State<SubTitleAnimation> createState() => _SubTitleAnimationState();
}

class _SubTitleAnimationState extends State<SubTitleAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: const Offset(0, 0),
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "join the no-bank experience,\nentirely online, no jokes.",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Dosis",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void stopAnimation() {
    controller.stop();
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool animationsPaused = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AnimationControl.stopAnimations();

        setState(() {
          animationsPaused = true;
        });

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            animationsPaused = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage(),
          ));
        });
      },
      child: Container(
        width: 140,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            "Enter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "Dosis",
            ),
          ),
        ),
      ),
    );
  }
}

