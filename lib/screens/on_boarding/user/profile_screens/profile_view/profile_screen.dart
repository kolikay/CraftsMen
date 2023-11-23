// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/utils/image_storage_methods.dart';
import 'package:craftsmen/constants/utils/pick_image.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/landing_page/no_internet.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:craftsmen/screens/settings/user_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profileScrren';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool readOnly = true;
  bool onEdit = false;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _fullName;
  String? _userName;
  String? _phoneNumber;
  String? _gender;
  String? _address;
  String? _selectedPhoto;
  String? _downloadedPhoto;

  bool _loading = false;

  bottomSheet(
    BuildContext context,
  ) async {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        final userInfoProvider = ref.watch(userProvider);

        return SizedBox(
          height: 160.h,
          child: Column(
            children: [
              NormalText(
                text: 'Choose Profile Picture',
                fontWeight: FontWeight.w700,
                size: 20.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        color: kMainColor,
                        iconSize: 50.w,
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          var im =
                              await PickImage.pickImage(ImageSource.camera);
                          Navigator.pop(context);
                          if (im != 'failed') {
                            String? image = await StorageMethods()
                                .uploadImageTostorage(
                                    'UserProfilePicx', im, false);

                            setState(() {
                              _selectedPhoto = image;
                              _loading = false;
                            });
                          }
                          setState(() {
                            _loading = false;
                          });
                        },
                        icon: const Icon(Icons.add_a_photo_rounded),
                      ),
                      NormalText(text: 'Camera')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: kMainColor,
                        iconSize: 50.w,
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          var im =
                              await PickImage.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                          if (im != 'failed') {
                            String? image = await StorageMethods()
                                .uploadImageTostorage(
                                    'UserProfilePicx', im, false);
                            await userInfoProvider.updateLoggedinUserDetails(
                                {'Profile Pic': image});

                            setState(() {
                              _selectedPhoto = image;
                              _loading = false;
                            });
                          }
                          setState(() {
                            _loading = false;
                          });
                        },
                        icon: const Icon(Icons.image),
                      ),
                      NormalText(
                        text: 'Galary',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    final userInfoProvider = ref.watch(userProvider);

    final user = userInfoProvider.userApiData;

    getApiData(user);

    super.didChangeDependencies();
  }

  getApiData(UserModel user) async {
    _email = user.email ?? '';
    _fullName = user.fullName ?? '';
    _userName = user.userName ?? '';
    _phoneNumber = user.phoneNumber ?? '';
    _gender = user.gender ?? '';
    _downloadedPhoto = user.profilePic ?? '';
    _address = user.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final userInfoProvider = ref.watch(userProvider);

    getInputedData() {
      final body = {
        "email": _email,
        "Full Name": _fullName,
        "User Name": _userName,
        'Phone Number': _phoneNumber,
        "Gender": _gender,
        "address": _address,
        'Reviews': [],
      };
      return body;
    }

    Widget getProfileImage() {
      if (_selectedPhoto != null) {
        return CircleAvatar(
            radius: 64, backgroundImage: NetworkImage(_selectedPhoto!));
      }
      if (_selectedPhoto == null && _downloadedPhoto!.isNotEmpty) {
        return CircleAvatar(
          radius: 64,
          backgroundImage: NetworkImage(_downloadedPhoto!),
        );
      }

      if (_selectedPhoto == null && _downloadedPhoto!.isEmpty) {
        return const CircleAvatar(
          radius: 64,
          backgroundImage: AssetImage('lib/assets/profileImage.jpeg'),
        );
      }

      return const CircleAvatar(
        radius: 64,
        backgroundImage: AssetImage('lib/assets/profileImage.jpeg'),
      );
    }

    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: AppBar(
              title: Padding(
                padding: EdgeInsets.only(
                  top: 10.0.h,
                ),
                child: NormalText(
                  text: 'Profile',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              toolbarHeight: 103.h,
              backgroundColor: kMainColor,
              leading: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.0.h,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: !onEdit
                        ? Icon(
                            Icons.arrow_back_ios,
                            size: 20.w,
                          )
                        : Icon(Icons.close, size: 20.w),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
                  child: IconButton(
                    onPressed: () async {
                      bool isConnected =
                          await SimpleConnectionChecker.isConnectedToInternet();
                      if (isConnected) {
                        AuthViewModel.instance.setLoading(true);
                        if (onEdit) {
                          await userInfoProvider
                              .updateLoggedinUserDetails(getInputedData());
                        }

                        setState(() {
                          onEdit = !onEdit;
                        });
                        AuthViewModel.instance.setLoading(false);
                      } else {
                        Navigator.pushNamed(context, NoInternetScreen.id);
                      }
                    },
                    icon: onEdit
                        ? Icon(Icons.save, size: 30.w)
                        : Icon(Icons.edit, size: 30.w),
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 821.h,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Stack(
                    children: [
                      !_loading
                          ? getProfileImage()
                          : const CircularProgressIndicator(
                              color: Colors.blueAccent,
                            ),
                      Positioned(
                        bottom: -10.h,
                        left: 85.w,
                        child: IconButton(
                          color: kMainColor,
                          iconSize: 30.w,
                          icon: const Icon(
                            Icons.camera_alt,
                          ),
                          onPressed: () {
                            bottomSheet(context);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ProfileFormField(
                          initialValue: _fullName,
                          onChanged: (val) {
                            setState(() {
                              _fullName = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.text,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Full Name',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ProfileFormField(
                          initialValue: _userName,
                          onChanged: (val) {
                            setState(() {
                              _userName = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.text,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Username',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ProfileFormField(
                          initialValue: _email,
                          onChanged: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.text,
                          isPassword: false,
                          isReadOnly: true,
                          labelText: 'Email',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ProfileFormField(
                          initialValue: _gender,
                          onChanged: (val) {
                            setState(() {
                              _gender = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.text,
                          isPassword: false,
                          isReadOnly: true,
                          labelText: 'Gender',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ProfileFormField(
                          initialValue: _address,
                          onChanged: (val) {
                            setState(() {
                              _address = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.text,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Address',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ProfileFormField(
                          initialValue: _phoneNumber,
                          onChanged: (val) {
                            setState(() {
                              _phoneNumber = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Phone Number',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: authViewModel.loading
              ? const Center(
                  child: ProgressDialog(
                    message: 'Loading....',
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
