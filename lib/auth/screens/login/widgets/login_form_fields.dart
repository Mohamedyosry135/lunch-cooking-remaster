part of 'login_widgets_imports.dart';

class LoginFormFields extends StatelessWidget {
  final LoginData loginData;

  const LoginFormFields({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fillColor: MyColors.white,
            enableBorderColor: MyColors.greyWhite,
            radius: BorderRadius.circular(30),
            fieldTypes: FieldTypes.normal,
            label: "Email or username",
            controller: loginData.userNameController,
            margin: const EdgeInsets.only(top: 20),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: loginData.showPassword,
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
                      loginData.showPassword.onUpdateData(!state.data),
                ),
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: "Password",
                controller: loginData.passwordController,
                margin: const EdgeInsets.only(top: 10),
                validate: (value) => value!.validatePassword(context),
                type: TextInputType.text,
                action: TextInputAction.done,
                onSubmit: () => loginData.userLogin(context),
                onChange: (value) => value.validatePassword(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
