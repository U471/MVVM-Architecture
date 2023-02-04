import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/user_list_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({super.key});

  @override
  State<HomeSecreen> createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  UserListViewModel userListViewModel = UserListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    userListViewModel.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userListViewModel = Provider.of<UserListViewModel>(context);

    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(
                  child: Text(
                'Log out',
              ))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<UserListViewModel>(
          create: (BuildContext context) => userListViewModel,
          child: Consumer<UserListViewModel>(
            builder: (context, value, child) {
              switch (value.userList.status!) {
                case Status.Loading:
                  return Center(child: CircularProgressIndicator());
                case Status.Error:
                  return Text(value.userList.message.toString());
                case Status.Completed:
                  return ListView.builder(
                      itemCount: value.userList.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              value.userList.data!.data![index].avatar
                                  .toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            title: Text(value
                                .userList.data!.data![index].firstName
                                .toString()),
                            subtitle: Text(value
                                .userList.data!.data![index].lastName
                                .toString()),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Text(Utils.avarageRating(value
                            //             .userList.data!.data![index]. )
                            //         .toStringAsFixed(1)),
                            //     Icon(
                            //       Icons.star,
                            //       color: Colors.yellow,
                            //     )
                            //   ],
                            // ),
                          ),
                        );
                      });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
