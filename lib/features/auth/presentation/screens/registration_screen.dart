import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/layout/layout.dart' show Layout;
import 'package:wasil_flutter_task/features/auth/presentation/screens/login_screen.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/common/services/dialog/dialog_service.dart';
import '../../../../core/common/services/router/app_router.dart';
import '../../../../core/common/widgets/dialogs/loading_dialog.dart';
import '../../../../core/common/widgets/forms/drop_down_tile.dart';
import '../../../../core/common/widgets/forms/form_field.dart';
import '../../../../core/common/widgets/forms/form_section.dart';
import '../../../../core/common/widgets/misc/divider.dart';
import '../../../../core/utils/validator_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dialogService = serviceLocator<DialogService>();

  //? Controllers
  final fNameController = TextEditingController();
  final sNameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  //? Controllers

  DateTime? pickedDate;
  bool useHedge = false;
  bool accepted = false;
  String? selectedLanguage;
  List<String> languges = ["English", "Arabic"];

  String? selectedCoinType;
  List<String> coinTypes = ["USD", "EUR", "JPY", "JOD"];

  @override
  void initState() {
    super.initState();
    selectedLanguage = languges.first;
    selectedCoinType = coinTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Wasil account",
              style: TextTheme.of(context).titleSmall,
            ),
            Text(
              "Personal information",
              style: TextTheme.of(context).labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Gap(10),

            FormSection(title: "Personal information"),
            Gap(8),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 16),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  TFormField(
                    controller: fNameController,
                    validator:
                        (value) =>
                            ValidatorUtils.validateRequiredFieldWithLength(
                              length: 2,
                              value: "$value",
                            ),
                    label: "First name",
                    hintText: "min 2 chars",
                    keyboardType: TextInputType.name,
                  ),
                  Gap(20),
                  TFormField(
                    controller: sNameController,
                    validator:
                        (value) =>
                            ValidatorUtils.validateRequiredFieldWithLength(
                              length: 2,
                              value: "$value",
                            ),
                    label: "Second name",
                    hintText: "min 2 chars",
                    keyboardType: TextInputType.name,
                  ),
                  Gap(20),
                  GestureDetector(
                    onTap: () async {
                      pickedDate = await DatePicker.showSimpleDatePicker(
                        context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2090),
                        dateFormat: "MMM-dd-yyyy",
                        looping: false,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        itemTextStyle: TextTheme.of(context).labelMedium,
                        pickerMode: DateTimePickerMode.date,
                        titleText: "Date of birth",
                        textColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      );

                      setState(() {});
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TFormField(
                        controller: dobController,
                        validator:
                            (value) => ValidatorUtils.validateRequiredField(
                              value:
                                  pickedDate == null
                                      ? ""
                                      : pickedDate.toString(),
                            ),
                        label: "Date of birth",
                        hintText:
                            pickedDate == null
                                ? "Please select"
                                : "${pickedDate?.month}/${pickedDate?.day}/${pickedDate?.year}",
                      ),
                    ),
                  ),
                  Gap(20),
                  TFormField(
                    controller: phoneController,
                    validator:
                        (value) => ValidatorUtils.validatePhoneNumber(
                          phoneNumber: "$value",
                        ),
                    label: "Phone",
                    hintText: "+12345678912",
                    keyboardType: TextInputType.phone,
                  ),
                  Gap(20),
                  TFormField(
                    controller: emailController,
                    validator:
                        (value) =>
                            ValidatorUtils.validateEmail(email: "$value"),
                    label: "E-mail",
                    hintText: "name@company.com",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'or sign up with',
                  style: TextTheme.of(context).labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Gap(8),
                Image.network(
                  'https://tse4.mm.bing.net/th/id/OIP.lsGmVmOX789951j9Km8RagHaHa?rs=1&pid=ImgDetMain',
                  height: 24,
                  width: 24,
                ),
              ],
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ',
                  style: TextTheme.of(context).labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Gap(8),
                GestureDetector(
                  onTap: () {
                    AppRouter.push(screen: LoginScreen());
                  },
                  child: Text(
                    'Login',
                    style: TextTheme.of(context).labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15),
            FormSection(title: "Account information"),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Use global Account",
                        style: TextTheme.of(context).labelLarge?.copyWith(
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Checkbox(
                        value: useHedge,
                        onChanged: (value) {
                          setState(() {
                            useHedge = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Gap(5),
                  TDivider(),
                  Gap(5),
                  TDropDownTile(
                    title: "Language",
                    value: "$selectedLanguage",
                    items: languges,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),
                  Gap(5),
                  TDivider(),
                  Gap(5),
                  TDropDownTile(
                    title: "Coin type",
                    value: "$selectedCoinType",
                    items: coinTypes,
                    onChanged: (value) {
                      setState(() {
                        selectedCoinType = value;
                      });
                    },
                  ),
                  Gap(5),
                ],
              ),
            ),
            FormSection(title: "Agreements"),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Accept",
                        style: TextTheme.of(context).labelLarge?.copyWith(
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        children: [
                          if (!accepted) Icon(Icons.error, color: Colors.red),
                          Checkbox(
                            value: accepted,
                            onChanged: (value) {
                              setState(() {
                                accepted = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  TDivider(),
                  Gap(5),
                  Text(
                    'By enabling "Accept" you agree with the terms and conditions for opening an account and the data protection policy',
                    style: TextTheme.of(context).labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: FilledButton(
          onPressed:
              accepted
                  ? () async {
                    if (accepted) {
                      if (_formKey.currentState!.validate()) {
                        _dialogService.showDialog(
                          context: context,
                          dismissable: false,
                          dialog: LoadingDialog(),
                        );
                        await Future.delayed(Duration(seconds: 2));
                        _dialogService.hideDialog(context);
                        AppRouter.push(screen: Layout());
                      }
                    }
                  }
                  : null,
          child: Text(
            "Register".toUpperCase(),
            style: TextTheme.of(context).labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
