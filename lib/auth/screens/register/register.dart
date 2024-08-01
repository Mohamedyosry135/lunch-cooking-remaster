part of 'register_imports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterData registerData = RegisterData();
   
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(title: "Sign Up", color: MyColors.primaryDark, size: 50),
                const SizedBox(height: 40),
                MyText(
                    title: "Creating Account using social media",
                    color: MyColors.grey,
                    size: 16),
                const SocialMediaRegister(),
                RegisterFormFields(registerData: registerData),
                BuildTermsAcceptance(
                  registerData: registerData,
                ),
              ],
            ),
          ),
          RegisterButton(
            registerData: registerData,
          ),
          BuildLoginButton(),
          const GuestButton(),
        ],
      ),
    );
  }
}
