// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hibank/presentation/screen/dashboard/dashboard_constants.dart';
import 'package:hibank/util/extension/string_extension.dart';

class EndDrawerWidget extends StatelessWidget {
  final BuildContext context;
  final String? displayName;
  final String? photoURL;
  final String? email;
  final void Function()? signOutFunction;

  const EndDrawerWidget(
      {required this.signOutFunction,
      required this.context,
      required this.displayName,
      required this.photoURL,
      required this.email,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10)
            .copyWith(bottom: 15),
        child: Column(
          children: [
            if (photoURL != null)
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.black54)),
                child: Image.network(
                  photoURL.toString(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                displayName ?? displayName!.emptyText,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                email ?? email!.emptyText,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: signOutFunction,
                child: const Text(DashboardConstants.logoutLable),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
