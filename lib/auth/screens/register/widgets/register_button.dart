part of 'register_widgets_imports.dart';

class RegisterButton extends StatelessWidget {
  final RegisterData registerData;

  const RegisterButton({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: registerData.visibilityCubit,
        builder: (context, state) {
          return Visibility(
            visible:state.data,
            child: LoadingButton(
              btnKey: registerData.btnKey,
              title: "Sign Up",
              fontSize: 14,
              onTap: () => registerData.userRegister(context),
              gradient: MyColors.gradient,
              textColor: MyColors.white,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            replacement: DefaultButton(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              textColor: MyColors.grey,
              title: "Sign Up",
              onTap: null,
            ),
          );
        },
      ),
    );
    // return DefaultButton(
    //   margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //   gradient: MyColors.gradient,
    //   title: "Sign Up",
    //   onTap: () {},
    // );
  }
}
