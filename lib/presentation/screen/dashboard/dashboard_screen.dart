// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:hibank/domain/entity/article_entity.dart';
import 'package:hibank/presentation/constant/image_constants.dart';
import 'package:hibank/presentation/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:hibank/presentation/screen/dashboard/bloc/dashboard_state.dart';
import 'package:hibank/presentation/screen/dashboard/dashboard_constants.dart';
import 'package:hibank/presentation/screen/dashboard/widget/dashboard_app_bar.dart';
import 'package:hibank/presentation/screen/dashboard/widget/dashboard_end_drawer.dart';
import 'package:hibank/util/extension/string_extension.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late User _user;
  late DashBoardBloc _dashBoardBloc;
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser!;
    _dashBoardBloc = KiwiContainer().resolve<DashBoardBloc>()..getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DashboardAppBAr(
        titleText: _user.email!,
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: EndDrawerWidget(
        signOutFunction: () async {
          await FirebaseAuth.instance.signOut();
        },
        context: context,
        displayName: _user.displayName,
        photoURL: _user.photoURL,
        email: _user.email,
      ),
      body: BlocProvider.value(
        value: _dashBoardBloc,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _searchBar(),
              Expanded(
                child: _listBody(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() => Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
                  isCollapsed: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: DashboardConstants.searchByIdLabel,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _dashBoardBloc.searchById(_searchController.text);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
      );

  Widget _listBody() => BlocBuilder<DashBoardBloc, DashboardState>(
        builder: (_, state) {
          if (state is DashboardLoadingState) {
            return Image.asset(ImageConstants.loading);
          }
          if (state is DashboardFailedState) {
            return Text(state.errorMessage!);
          }

          return ListView.separated(
            itemCount: state.articles!.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final ArticleEntity item = state.articles![index];

              return ListTile(
                leading: Text(item.id.toString()),
                titleTextStyle: Theme.of(context).textTheme.titleLarge,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(item.title.capitalize()),
                ),
                minLeadingWidth: 20,
                subtitle: Text(
                  item.body.capitalize(),
                ),
              );
            },
          );
        },
      );
}
