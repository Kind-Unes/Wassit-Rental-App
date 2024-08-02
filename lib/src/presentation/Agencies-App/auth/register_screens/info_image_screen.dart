import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wassit_cars_rental_app/src/bloc/setup_info_cubit.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:wassit_cars_rental_app/src/models/agency_model.dart';
import 'package:wassit_cars_rental_app/src/models/setup_info_model.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/agencies/agency_details_admin_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/agencies_panel_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/agency_auth_screen.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class InfoImageScreen extends StatefulWidget {
  const InfoImageScreen({super.key});

  @override
  State<InfoImageScreen> createState() => _InfoImageScreenState();
}

class _InfoImageScreenState extends State<InfoImageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  bool isFinilize = false;
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipPath(
                clipper: BottomRoundedClipper(),
                child: Container(
                  height: context.height * 0.73,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 253, 191, 109),
                      Color(0xFfFF7E01),
                    ],
                  )),
                  child: Column(
                    children: [
                      Gap(40.h),
                      Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          "assets/logo/logo.PNG",
                          color: Colors.white,
                          //
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 215.h,
            right: 0,
            left: 0,
            child: Container(
                padding: EdgeInsets.only(bottom: 20.h),
                width: context.width,
                margin: EdgeInsets.only(
                  right: 30.w,
                  left: 30.w,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    color: const Color.fromARGB(255, 244, 245, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.15),
                        offset: const Offset(0, 5),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        controller: _tabController,
                        unselectedLabelStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.3),
                          fontSize: 16,
                          letterSpacing: 1.7,
                          fontWeight: FontWeight.bold,
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.7,
                            fontSize: 16,
                            color: const Color(0xFfFF7E01).withOpacity(0.7)),
                        dividerColor: const Color(0xFfFF7E01).withOpacity(0.6),
                        dividerHeight: 0.63,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        indicatorColor: const Color(0xFfFF7E01),
                        tabs: const [
                          // text: "AppLocalizations.of(context)!.login",
                          Tab(text: "AGENCY SET UP"),
                        ],
                      ),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Gap(30.h),
                        //welocme back
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "Pick Your Agency's Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Gap(10.h),
                        // image pick circle
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200.r),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          child: pickedImage == null
                              ? IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  onPressed: _pickImage)
                              : GestureDetector(
                                  onTap: () {
                                    _pickImage();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200.r),
                                    child: Image.file(
                                      pickedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                        Gap(15.h),

                        PrimaryButton(
                          onPressed: () {
                            _submit();
                          },
                          title: isFinilize ? "PLEASE WAIT .." : "FINILIZE",
                        ),
                        //
                        Gap(10.h),
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            "GO BACK",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ])
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
      log("dqsd");
    }
  }

  void _submit() async {
    setState(() {
      isFinilize = true;
    });

    //! validation
    if (pickedImage == null) {
      setState(() {
        isFinilize = false;
      });
      toast.error(context, "Please Pick The Agency's Image");
      return;
    }

    //! start

    // upload to storage
    final storage = FirebaseStorage.instance;
    await storage
        .ref('agency_images/${auth.currentUser!.uid}')
        .putFile(pickedImage!);
    final imageUrl = await storage
        .ref('agency_images/${auth.currentUser!.uid}')
        .getDownloadURL();

    context.read<SetUpInfoCubit>().updateProperty('imageUrl', imageUrl);
    final SetupInfoModel setUpInfoModel = context.read<SetUpInfoCubit>().state;

    // fetch all data
    final fetchedData = await firestore
        .collection("agencies")
        .doc(auth.currentUser!.uid)
        .get()
        .then((v) {
      return AgencyModel.fromJson(v.data()!);
    });

    final AgencyModel agencyModel = AgencyModel(
        id: auth.currentUser!.uid,
        didFinishAuth: true,
        notificationToken: "",
        email: fetchedData.email,
        password: fetchedData.password,
        wilaya: setUpInfoModel.wilaya.toString().split(".").last,
        city: setUpInfoModel.city,
        name: setUpInfoModel.agencyName,
        lowerCaseName: setUpInfoModel.agencyName.toLowerCase(),
        ownerName: setUpInfoModel.ownerName,
        imageUrl: imageUrl,
        phoneNumber: setUpInfoModel.phoneNumber,
        addedAt: fetchedData.addedAt,
        updatedAt: DateTime.now(),
        beginDate: DateTime.now(),
        isActivated: false);

    // update the agency
    await firestore
        .collection("agencies")
        .doc(auth.currentUser!.uid)
        .update(agencyModel.toJson());
    toast.success(context, "Agency Info has been registered successfully!");

    context.pushReplacement(const AgenciesPanelScreen());
    setState(() {
      isFinilize = false;
    });
  }
}
