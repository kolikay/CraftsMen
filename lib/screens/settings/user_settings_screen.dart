import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/screens/on_boarding/user/home_screens/homepage_constant_widgets.dart';
import 'package:craftsmen/screens/on_boarding/user/notifications/views/notification_screen1.dart';

import 'package:craftsmen/screens/on_boarding/user/profile_screens/profile_view/profile_screen.dart';
import 'package:craftsmen/screens/settings/about_us_screen.dart';
import 'package:craftsmen/screens/settings/contact_screen.dart';
import 'package:craftsmen/screens/settings/faqs_screen.dart';
import 'package:craftsmen/screens/settings/feed_back_screen.dart';
import 'package:craftsmen/screens/settings/log_out_screen.dart';
import 'package:craftsmen/screens/settings/rate_us_screen.dart';
import 'package:craftsmen/screens/settings/themes._settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSettingsScreen extends ConsumerStatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);
  static const String id = 'settings_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends ConsumerState<UserSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final userInfoProvider = ref.watch(userProvider);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(225.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(
              top: 10.0.h,
            ),
            child: Center(
              child: Column(
                children: [
                  NormalText(
                    text: 'Accounts',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      userInfoProvider.userApiData.profilePic != null || userInfoProvider.userApiData.profilePic!.isNotEmpty
                          ? CircleAvatar(
                              radius: 34,
                              backgroundImage: NetworkImage(
                                  userInfoProvider.userApiData.profilePic!),
                            )
                          : Container(
                              height: 90.h,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'lib/assets/verifiedIcon.png',
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        height: 60.h,
                        width: 200.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalText(
                              text: userInfoProvider.userApiData.fullName ?? '',
                              size: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            NormalText(
                              text: userInfoProvider.userApiData.email ?? '',
                              size: 12.sp,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          toolbarHeight: 225.h,
          backgroundColor: kMainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 821.h,
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const ProfileScreen()),
                    ),
                  );
                },
                icon: Icons.person,
                iconColor: kMainColor,
                imageName: 'Edit Profile',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const NotificationScreen1()),
                    ),
                  );
                },
                icon: Icons.notifications,
                iconColor: kMainColor,
                imageName: 'Notifications',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ThemesSettingScreen();
                      });
                },
                icon: Icons.contrast_outlined,
                iconColor: kMainColor,
                imageName: 'Themes',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const ContactScreen()),
                    ),
                  );
                },
                icon: Icons.phone,
                iconColor: kMainColor,
                imageName: 'Contact Us',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const AboutUsScreen()),
                    ),
                  );
                },
                icon: Icons.error_outline,
                iconColor: kMainColor,
                imageName: 'About App',
              ),
              const Divide(),
             const DrawerIcons(
                icon: Icons.share,
                iconColor: kMainColor,
                imageName: 'Share',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const RateUsScreen();
                      });
                },
                icon: Icons.star_rate,
                iconColor: kMainColor,
                imageName: 'Rate Us',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const FaqsScreen()),
                    ),
                  );
                },
                icon: Icons.question_mark_sharp,
                iconColor: kMainColor,
                imageName: 'FAQs',
              ),
              const Divide(),
              DrawerIcons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const FeedBackScreen()),
                    ),
                  );
                },
                icon: Icons.feedback_rounded,
                iconColor: kMainColor,
                imageName: 'FeedBack',
              ),
              const Divide(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: const Color(0xffC4C4C4),
                  splashColor: const Color(0xffC4C4C4),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const LogOutScreen();
                        });
                  },
                  child: SizedBox(
                    height: 46.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24.w,
                            ),
                            const Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            NormalText(
                              text: 'Log Out',
                              size: 16.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15.w,
                            color: kMainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Divide extends StatelessWidget {
  const Divide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Divider(
        color: kDarkContainer,
        thickness: 2,
      ),
    );
  }
}
