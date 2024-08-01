part of 'register_widgets_imports.dart';

class BuildTermsAcceptance extends StatelessWidget {
  final RegisterData registerData;

  const BuildTermsAcceptance({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.termsCubit,
            builder: (_, state) {
              return Checkbox(
                side: BorderSide(color: MyColors.primary),
                value: state.data,
                onChanged: (val) =>
                    registerData.termsCubit.onUpdateData(!state.data),
                activeColor: MyColors.primary,
              );
            },
          ),
          Expanded(
            child: InkWell(
              onTap: () => Get.rootDelegate.toNamed(Routes.TERMS),//AutoRouter.of(context).push(const TermsRoute()),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: MyColors.primaryDark,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Proxima Nova"),
                  children: <TextSpan>[
                    TextSpan(text: 'By signing up you agree to our '),
                    TextSpan(
                      text: 'Conditions ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Privacy policy.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
