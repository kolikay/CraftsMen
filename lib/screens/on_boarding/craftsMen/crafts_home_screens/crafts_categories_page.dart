import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_appbar.dart';
import 'package:craftsmen/screens/search/display_allsearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'crafts_homepage_constant_widgets.dart';

class CraftsMenCategoriesPage extends ConsumerStatefulWidget {
  static const id = 'catsearchscreen';
  const CraftsMenCategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CraftsMenCategoriesPageState();
}

class _CraftsMenCategoriesPageState extends ConsumerState<CraftsMenCategoriesPage> {
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
                secondAppIcon: Icons.search,
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
                      CraftsHomeConstants.categoryCard(
                          context, 'Plumbers', 'lib/assets/plumber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'plumbers',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(context, 'Painters',
                          'lib/assets/painter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'painters',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(
                          context, 'Electricians', 'lib/assets/electrician.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'electricians',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(
                          context, 'Barbers', 'lib/assets/Barber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'barbers',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(
                          context, 'Engineer', 'lib/assets/engineer.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'engineers',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(context, 'Doctors',
                          'lib/assets/health.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'doctors',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(
                          context, 'Carpenters', 'lib/assets/carpenter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'carpenters',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(context, 'Hair Stylists',
                          'lib/assets/carpenter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'hair stylists',
                                )),
                          ),
                        );
                      }),
                      CraftsHomeConstants.categoryCard(
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
