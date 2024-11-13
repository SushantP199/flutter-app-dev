import 'package:flutter/material.dart';
import 'package:satellite/data/response/status.dart';
import 'package:satellite/utils/routes/routes_name.dart';
import 'package:satellite/view_model/home_view_model.dart';
import 'package:satellite/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchCustomerSatellitesApi();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Satellite App"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  userViewModel.remove().then((value) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.login, (route) => false);
                  });
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              switch (homeViewModel.customerSatellites.status) {
                case Status.LOADING:
                  return const Center(child: RefreshProgressIndicator());
                case Status.ERROR:
                  return Center(
                    child: Text(
                      homeViewModel.customerSatellites.message.toString(),
                    ),
                  );
                case Status.COMPLETED:
                  var customerSatellites =
                      homeViewModel.customerSatellites.data?.customerSatellites;
                  return ListView.builder(
                    itemCount: customerSatellites?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            customerSatellites![index].country.toString(),
                          ),
                          subtitle: Text(
                            customerSatellites[index].launchDate.toString(),
                          ),
                          trailing: Text(
                            customerSatellites[index].launcher.toString(),
                          ),
                        ),
                      );
                    },
                  );
                default:
                  return const Center(child: Text("something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
