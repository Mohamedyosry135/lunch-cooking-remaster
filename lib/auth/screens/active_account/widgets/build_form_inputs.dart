part of 'active_account_widgets_imports.dart';

class BuildFormInputs extends StatelessWidget {
  final ActiveAccountData activeAccountData;

  const BuildFormInputs({required this.activeAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: activeAccountData.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: PinCodeTextField(
          length: 6,
          appContext: context,
          onChanged: (String value) {},
          backgroundColor: Colors.transparent,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            fieldOuterPadding: EdgeInsets.only(bottom: 20),
              shape: PinCodeFieldShape.underline,
              fieldHeight: 30,
              fieldWidth: 30,
              inactiveColor: MyColors.black,
              activeColor: MyColors.black,
              selectedFillColor: MyColors.white,
              inactiveFillColor: Colors.transparent,
              activeFillColor: Colors.transparent,
              disabledColor: MyColors.black),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: activeAccountData.code,
          validator: (value) => value!.validateEmpty(context),

        ),
      ),
    );
  }
}
