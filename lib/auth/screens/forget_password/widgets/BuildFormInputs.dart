part of 'ForgetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildFormInputs({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgerPasswordData.formKey,
      child: GenericTextField(
        fillColor: MyColors.white,
        enableBorderColor: MyColors.greyWhite,
        radius: BorderRadius.circular(30),
        fieldTypes: FieldTypes.normal,
        label: "Enter your email",
        controller: forgerPasswordData.email,
        margin: const EdgeInsets.symmetric(vertical: 30),
        action: TextInputAction.next,
        type: TextInputType.emailAddress,
        validate: (value) => value!.validateEmail(context),
      ),
    );
  }
}
