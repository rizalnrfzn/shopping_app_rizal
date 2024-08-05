import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/core/route/router_provider.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_param.dart';
import 'package:shopping_app/presentation/provider/user_data/user_data_provider.dart';
import 'package:shopping_app/utils/extensions/context_extension.dart';
import 'package:shopping_app/utils/methods/methods.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            if (previous is AsyncLoading) {
              context.hideLoading();
            }
            ref.read(routerProvider).replace(Routes.home.path);
          }
        } else if (next is AsyncError) {
          if (previous is AsyncLoading) {
            context.hideLoading();
          }
          context.showSnackBar(next.error.toString());
        } else if (next is AsyncLoading) {
          context.showLoading();
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              verticalSpace(80),
              const FlutterLogo(size: 100),
              verticalSpace(40),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                enabled: !ref.read(userDataProvider).isRefreshing,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              verticalSpace(20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                enabled: !ref.read(userDataProvider).isRefreshing,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              verticalSpace(20),
              FilledButton(
                onPressed: ref.read(userDataProvider).isRefreshing
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {
                          ref.read(userDataProvider.notifier).login(
                                LoginParam(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
