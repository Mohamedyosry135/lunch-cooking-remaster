part of 'register_widgets_imports.dart';

class RegisterFormFields extends StatelessWidget {
  final RegisterData registerData;

  const RegisterFormFields({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: registerData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenericTextField(
              fillColor: MyColors.white,
              enableBorderColor: MyColors.greyWhite,
              radius: BorderRadius.circular(25),
              fieldTypes: FieldTypes.normal,
              label: "Email",
              controller: registerData.emailController,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              validate: (value) => value!.validateEmail(context),
              onChange: (value) => registerData.checkDisable(),
            ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: registerData.showPassword,
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
                        registerData.showPassword.onUpdateData(!state.data),
                  ),
                  fieldTypes:
                      state.data ? FieldTypes.password : FieldTypes.normal,
                  label: "Password",
                  controller: registerData.passwordController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.noValidate(),
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  onChange: (value) {
                    var validationTest=value.validateRegisterPassword(context);
                    registerData.passValidationCubit.onUpdateData(validationTest);
                    registerData.checkDisable();
                  },
                );
              },
            ),
            BlocBuilder<GenericBloc<String>, GenericState<String>>(
              bloc: registerData.passValidationCubit,
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
              bloc: registerData.showConfirmPassword,
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
                    onPressed: () => registerData.showConfirmPassword
                        .onUpdateData(!state.data),
                  ),
                  fieldTypes:
                      state.data ? FieldTypes.password : FieldTypes.normal,
                  label: "Confirm Password",
                  controller: registerData.confirm,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  validate: (value) => value!.validatePasswordConfirm(context,
                      pass: registerData.passwordController.text),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  onSubmit: () => registerData.userRegister(context),
                  onChange: (value) => registerData.checkDisable(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
