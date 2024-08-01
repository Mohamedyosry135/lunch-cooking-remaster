part of 'ResetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String code;
  final String email;

  const BuildFormInputs({
    required this.resetPasswordData,
    required this.email,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: resetPasswordData.showPassword,
            builder: (context, state) {
              return GenericTextField(
                fillColor: MyColors.white,
                enableBorderColor: MyColors.greyWhite,
                suffixIcon: IconButton(
                  icon: Icon(
                    state.data ? Icons.visibility_off : Icons.visibility,
                    color: state.data ? MyColors.grey : MyColors.primaryDark,
                  ),
                  focusColor: Colors.transparent,
                  onPressed: () =>
                      resetPasswordData.showPassword.onUpdateData(!state.data),
                ),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: "New password",
                controller: resetPasswordData.newPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.noValidate(),
                type: TextInputType.text,
                action: TextInputAction.next,
                onChange: (value) {
                  var validationTest = value.validateRegisterPassword(context);
                  resetPasswordData.passValidationCubit
                      .onUpdateData(validationTest);
                  resetPasswordData.checkDisable();
                },
              );
            },
          ),
          BlocBuilder<GenericBloc<String>, GenericState<String>>(
            bloc: resetPasswordData.passValidationCubit,
            builder: (context, state) {
              if (state.data == "1") {
                return Container();
              } else {
                return MyText(
                  title:
                      "Minimum eight characters, at least one uppercase letter, one lowercase letter and one number.",
                  color: state.data == "0" ? MyColors.grey : Colors.red,
                  size: 12,
                );
              }
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: resetPasswordData.showConfirmPassword,
            builder: (context, state) {
              return GenericTextField(
                fillColor: MyColors.white,
                enableBorderColor: MyColors.greyWhite,
                suffixIcon: IconButton(
                  icon: Icon(
                    state.data ? Icons.visibility_off : Icons.visibility,
                    color: state.data ? MyColors.grey : MyColors.primaryDark,
                  ),
                  focusColor: Colors.transparent,
                  onPressed: () => resetPasswordData.showConfirmPassword
                      .onUpdateData(!state.data),
                ),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: "Confirm new password",
                controller: resetPasswordData.confirmNewPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: resetPasswordData.newPassword.text),
                type: TextInputType.text,
                action: TextInputAction.done,
                onSubmit: () =>
                    resetPasswordData.onResetPassword(context, email, code),
                onChange: (value) => resetPasswordData.checkDisable(),
              );
            },
          ),
        ],
      ),
    );
  }
}
