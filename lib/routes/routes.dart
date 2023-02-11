import 'package:liveasy_assignment/Screens/page1.dart';
import 'package:liveasy_assignment/Screens/page2.dart';
import 'package:liveasy_assignment/Screens/page3.dart';
import 'package:liveasy_assignment/Screens/page4.dart';
import 'package:liveasy_assignment/Screens/page5.dart';

getRoutes() {
  return {
    Page1.route: (context) => Page1(),
    Page2.route: (context) => const Page2(),
    Page3.route: (context) => Page3(),
    Page4.route: (context) => const Page4(),
    Page5.route: (context) => const Page5()
  };
}
