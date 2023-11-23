import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_appbar.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/search/displayAllsearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'homepage_constant_widgets.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  static const id = 'catsearchscreen';
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    // final notes = ref.watch(noteViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: kMainColor,
              height: 103.h,
              width: 375.w,
              child: ReuseableAppbar(
                color: Colors.white,
                appBarTitle: 'Categories',
                firstAppIcon: Icons.arrow_back_ios,
                firstButton: () {
                  Navigator.pop(context);
                },
                secondButton: () {},
              ),
            ),
            Expanded(
              child: Container(
                color: kDarkContainer,
                child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    children: <Widget>[
                      HomeConstants.categoryCard(
                          context, 'Plumbers', 'lib/assets/plumber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'plumbers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Painters', 'lib/assets/painter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'painters',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Electricians', 'lib/assets/electrician.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'electricians',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Barbers', 'lib/assets/barber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'barbers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Engineers', 'lib/assets/engineer.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'engineers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Doctors', 'lib/assets/health.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'doctors',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Carpenters', 'lib/assets/carpenter.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'carpenters',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Hair Stylists', 'lib/assets/carpenter.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'hair stylists',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Developers', 'lib/assets/carpenter.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'developers',
                                )),
                          ),
                        );
                      }),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
