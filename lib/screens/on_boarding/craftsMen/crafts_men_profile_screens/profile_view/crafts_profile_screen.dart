// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/utils/image_storage_methods.dart';
import 'package:craftsmen/constants/utils/pick_image.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/landing_page/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class CraftMenProfileScreen extends ConsumerStatefulWidget {
  const CraftMenProfileScreen({Key? key}) : super(key: key);
  static const String id = 'SkillprofileScrren';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CraftMenProfileScreenState();
}

class _CraftMenProfileScreenState extends ConsumerState<CraftMenProfileScreen> {
  bool readOnly = true;
  bool onEdit = false;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _fullName;
  String? _userName;
  String? _phoneNumber;
  String? _gender;
  String? _address;
  String? _skill;
  String? _startYear;
  int? _employee;
  int? _experience;
  String? _companyName;
  String? _companyAdd;
  String? _companyPhoneNumber;
  String? _companyWebsite;
  String? _compEmail;
  final TextEditingController _more = TextEditingController();
  String? _selectedPhoto;
  String? _downloadedPhoto;
  bool _loading = false;

  bottomSheet(
    BuildContext context,
  ) async {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        final skillUserInfoProvider = ref.watch(skillProvider);
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
                            await skillUserInfoProvider
                                .updateLoggedinUserDetails(
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
    final skillUserInfoProvider = ref.watch(skillProvider);
    final user = skillUserInfoProvider.skillUserApiData;
    getApiData(user);
    super.didChangeDependencies();
  }

  getApiData(SkillProviderModel user) async {
    _email = user.email ?? '';
    _fullName = user.fullName ?? '';
    _userName = user.userName ?? '';
    _phoneNumber = user.phoneNumber ?? '';
    _gender = user.gender ?? '';
    _downloadedPhoto = user.profilePic ?? '';
    _address = user.address ?? '';
    _skill = user.skill ?? '';
    _companyName = user.companyName ?? '';
    _companyAdd = user.companyAdd ?? '';
    _experience = user.experience ?? 0;
    _compEmail = user.compEmail ?? '';
    _companyPhoneNumber = user.companyPhoneNumber ?? '';
    _companyWebsite = user.companyWebsite ?? '';
    _employee = user.employee ?? 0;
    _startYear = user.startYear ?? '';
    _more.text = user.moreAboutMe ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final userInfoProvider = ref.watch(skillProvider);

    getInputedData() {
      final body = {
        "email": _email,
        "Full Name": _fullName,
        "User Name": _userName,
        'Phone Number': _phoneNumber,
        "Gender": _gender,
        "Address": _address,
        'Reviews': [],
        "Company Address": _companyAdd,
        "Company Name": _companyName,
        "Company Email": _compEmail,
        "Company Website": _companyWebsite,
        "Company Phone Number": _companyPhoneNumber,
        "Skill": _skill,
        "Experince": _experience,
        "Employees": _employee,
        "Company Start Year": _startYear,
        "More About the Company": _more.text,
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
                          // print(getInputedData());
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
              height: 1500.h,
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
                          height: 15.h,
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
                          height: 15.h,
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
                          height: 15.h,
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
                          height: 15.h,
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
                          labelText: 'Home Address',
                        ),
                        SizedBox(
                          height: 15.h,
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
                          labelText: 'Personal Phone Number',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _companyName,
                          onChanged: (val) {
                            setState(() {
                              _companyName = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Company Name',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _companyWebsite,
                          onChanged: (val) {
                            setState(() {
                              _companyWebsite = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Company Website',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _compEmail,
                          onChanged: (val) {
                            setState(() {
                              _compEmail = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Company Email',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _companyPhoneNumber,
                          onChanged: (val) {
                            setState(() {
                              _companyPhoneNumber = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Company Phone Number',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _skill,
                          onChanged: (val) {
                            setState(() {
                              _skill = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Skill',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _companyAdd,
                          onChanged: (val) {
                            setState(() {
                              _companyAdd = val;
                            });
                          },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Company Address',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileFormField(
                          initialValue: _employee.toString(),
                          // onChanged: (val) {
                          //   print(val);
                          //   setState(() {
                          //     _employee = val as int;
                          //   });
                          // },
                          enable: onEdit,
                          obcureText: false,
                          keyBoardType: TextInputType.number,
                          isPassword: false,
                          isReadOnly: !onEdit,
                          labelText: 'Number of Employee',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProfileFormField(
                                width: 140.w,
                                initialValue: _experience.toString(),
                                // onChanged: (val) {
                                //   setState(() {
                                //     _experience = val as int?;
                                //   });
                                // },
                                enable: onEdit,
                                obcureText: false,
                                keyBoardType: TextInputType.number,
                                isPassword: false,
                                isReadOnly: true,
                                labelText: 'Year of Experience',
                              ),
                              ProfileFormField(
                                width: 140.w,
                                initialValue: _startYear,
                                onChanged: (val) {
                                  setState(() {
                                    _startYear = val;
                                  });
                                },
                                enable: onEdit,
                                obcureText: false,
                                keyBoardType: TextInputType.number,
                                isPassword: false,
                                isReadOnly: !onEdit,
                                labelText: 'Start Year',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            height: 150.h,
                            child: TextField(
                              controller: _more,
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              maxLength: 200,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'More About My Business',
                                hintStyle: TextStyle(
                                    color: kBlackDull, fontSize: 16.sp),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kMainColor, width: 1.0.w),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kMainColor, width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0.w),
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.black54, fontSize: 16.sp),
                              ),
                            ),
                          ),
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
