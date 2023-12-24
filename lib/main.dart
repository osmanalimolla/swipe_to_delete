import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe To Delete',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<AnimationController> animationController = [];
  List<Animation<double>> rotation = [];
  List<Animation<double>> rotateY = [];
  List<Animation<double>> rotateX = [];
  List<Animation<double>> scale = [];
  List<Animation<double>> offset = [];
  List<Animation<double>> widht = [];
  List<CardItem> list = [
    CardItem(fromColor: const Color.fromRGBO(55, 49, 44, 1), toColor: const Color.fromRGBO(29, 27, 25, 1)),
    CardItem(fromColor: const Color.fromRGBO(0, 57, 148, 1), toColor: const Color.fromRGBO(64, 44, 152, 1)),
    CardItem(fromColor: const Color.fromRGBO(15, 128, 106, 1), toColor: const Color.fromRGBO(4, 121, 98, 1))
  ].reversed.toList();

  int selected = 4;
  late double height = 0.0;

  @override
  void initState() {
    for (var index = 0; index < list.length; index++) {
      animationController.add(AnimationController(vsync: this, duration: const Duration(milliseconds: 400)));
      rotation.add(Tween<double>(begin: 0.0, end: -.2).animate(animationController[index]));
      rotateY.add(Tween<double>(begin: 0.0, end: 1).animate(animationController[index]));
      rotateX.add(Tween<double>(begin: 0.0, end: 1.4).animate(animationController[index]));
      scale.add(Tween<double>(begin: 1, end: .7).animate(animationController[index]));
      offset.add(Tween<double>(begin: 0, end: -130).animate(animationController[index]));
      widht.add(Tween<double>(begin: 20, end: 0).animate(animationController[index]));
      animationController[index].forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * .75;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            'assets/svg/menu.svg',
          ),
        ),
        leadingWidth: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'New Project',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'My new project / New Document',
                style: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 14),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 12,
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: const Color(0xFF2d2726), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/figma.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCfUdIqrwtbIQXr8OGLelaSzkzpx8D2vu_CQ&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 239, 239, 239), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/flutter.svg'),
                ),
                profile: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: Color.fromRGBO(67, 83, 255, 1), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/webflow.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Hb5xzFZJCTW4cMqmPwsgfw-gILUV7QevvQ&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 239, 239, 239), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/google.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjl7xYqho8VFxvJSR9heh8UTerI6FW4KDbxA&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: const Color(0xFF2d2726), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/figma.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvJaoIeJQU_V9rL_ZII61whWyqSFbmMgTgwQ&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: Color.fromRGBO(67, 83, 255, 1), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/webflow.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWdOBSmKDJcw_8JEr8qKnY7Q1s14Tzd5agrA&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: const Color(0xFF2d2726), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/figma.svg'),
                ),
                profile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6aFkmK5B0Zw_udaEn6Z9hLJ17h0l2gm43jw&usqp=CAU',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
              ListItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: const Color(0xFF2d2726), borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('assets/svg/figma.svg'),
                ),
                profile: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                subTitle: 'Due 18th Jan 2023',
                title: 'Create User Flow for Login/Register Screen',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  late Color fromColor;
  late Color toColor;

  CardItem({required this.fromColor, required this.toColor});
}

class ListItem extends StatefulWidget {
  String profile;
  String title;
  String subTitle;
  Widget icon;

  ListItem({
    super.key,
    required this.profile,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with TickerProviderStateMixin {
  double drag = 3.0;
  late AnimationController animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController animationTrash = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late AnimationController animationtoTrash = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late AnimationController animationCardHeight = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late Animation<double> cardTranslate = Tween<double>(begin: 0.0, end: 70.0).animate(animationController);
  late Animation<double> trashTranslate = Tween<double>(begin: -200.0, end: 0.0).animate(animationController);
  late Animation<double> trashCover = Tween<double>(begin: 1, end: .85).animate(animationTrash);
  late Animation<double> cardToTop = Tween<double>(begin: 0.0, end: -50.0).animate(animationTrash);
  late Animation<double> cardToTrash = Tween<double>(begin: 0.0, end: -50.0).animate(animationtoTrash);
  late Animation<double> cardScale = Tween<double>(begin: 1, end: 0.0).animate(animationtoTrash);
  late Animation<double> cardHeight = Tween<double>(begin: 98, end: 0.0).animate(animationCardHeight);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationCardHeight,
        builder: (context, child) {
          return SizedBox(
            height: cardHeight.value,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(cardTranslate.value, 0),
                      child: AnimatedBuilder(
                          animation: animationTrash,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, cardToTop.value),
                              child: AnimatedBuilder(
                                  animation: animationtoTrash,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(cardToTrash.value, 0),
                                      child: Transform.scale(
                                        scale: cardScale.value,
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                          onHorizontalDragEnd: (details) {
                                            if (details.velocity.pixelsPerSecond.dx > 0) {
                                              animationController.forward();
                                            } else {
                                              animationTrash.reverse();
                                              animationController.reverse();
                                            }
                                            print(details.velocity.pixelsPerSecond.dx);
                                          },
                                          child: Container(
                                            height: 82,
                                            padding: const EdgeInsets.all(10.0),
                                            margin: EdgeInsets.only(bottom: 14, left: drag, right: 16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 10,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      widget.icon,
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              widget.title,
                                                              style: const TextStyle(fontSize: 15),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                            Text(
                                                              widget.subTitle,
                                                              style: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 14),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(widget.profile),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }),
                    );
                  },
                ),
                Transform.scale(
                  scale: .6,
                  child: GestureDetector(
                    onTap: () {
                      animationTrash.forward();
                      Future.delayed(const Duration(milliseconds: 400), () {
                        animationtoTrash.forward();
                        animationTrash.reverse();
                        Future.delayed(const Duration(milliseconds: 300), () {
                          animationController.reverse();
                          animationCardHeight.forward();
                        });
                      });
                    },
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(trashTranslate.value, 0),
                          child: Column(children: [
                            AnimatedBuilder(
                                animation: animationTrash,
                                builder: (context, child) {
                                  return AnimatedRotation(
                                      alignment: Alignment.bottomLeft,
                                      duration: Duration.zero,
                                      turns: trashCover.value,
                                      child: SvgPicture.asset('assets/svg/trash-cover.svg'));
                                }),
                            SvgPicture.asset('assets/svg/trash.svg'),
                          ]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
