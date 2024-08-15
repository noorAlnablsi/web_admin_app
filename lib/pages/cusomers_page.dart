import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:web_admin_app/API/api_services.dart';
import 'package:web_admin_app/models/customer/customer/customer.dart';
import 'package:web_admin_app/models/user/user.dart';
import 'package:web_admin_app/widget/show_company_details_dialog.dart';

class CustomersPage extends StatefulWidget {
  @override
  _CustomersPageState createState() => _CustomersPageState();
}

//   Customer(
//       name: 'ali',
//       imageUrl: 'https://via.placeholder.com/150',
//       entryDate: '2023-01-01'),
//   Customer(
//       name: 'Company21',
//       imageUrl: 'https://via.placeholder.com/150',
//       entryDate: '2023-01-02',
//       serviceType: 'Software Development'),
// ];
// List<Customer> users = [
//   Customer(
//       name: 'ali',
//       imageUrl: 'https://via.placeholder.com/150',
//       entryDate: '2023-01-01'),
// ];
// List<Customer> companies = [
//   Customer(
//       name: 'Company21',
//       imageUrl: 'https://via.placeholder.com/150',
//       entryDate: '2023-01-02',
//       serviceType: 'Software Development'),
// ];
class _CustomersPageState extends State<CustomersPage> {
  List<Company> allCompanies = [];
  List<User> allUsers = [];
  List pageData = [];
  List<Company> displayedCustomers = [];
  APiServices api = APiServices();
  bool isloading = false;
  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    super.initState();
  }

  void _filterSearchResults(String query) {
    List<Company> searchResults = [];
    if (query.isNotEmpty) {
      allCompanies.forEach((item) {
        if ("${item.firstName}${item.lastName}"
            .toLowerCase()
            .contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
      setState(() {
        displayedCustomers = searchResults;
      });
    } else {
      setState(() {
        displayedCustomers = allCompanies;
      });
    }
  }

  void _onTabChanged(int index) {
    setState(() {
      isloading = true;
      if (index == 0) {
        api
            .getData(endPoint: "/api/admin/allUsers")
            .then((data) => setState(() {
                  for (var element in data) {
                    allUsers.add(User.fromJson(element));
                  }
                }));
        api
            .getData(endPoint: "/api/admin/allCompanies")
            .then((data) => setState(() {
                  for (var element in data) {
                    allCompanies.add(Company.fromJson(element));
                  }
                }));
        pageData.addAll(allUsers);
        pageData.addAll(allCompanies);
      } else if (index == 1) {
        api
            .getData(endPoint: "/api/admin/allUsers")
            .then((data) => setState(() {
                  for (var element in data) {
                    allUsers.add(User.fromJson(element));
                  }
                }));
      } else if (index == 2) {
        api
            .getData(endPoint: "/api/admin/allCompanies")
            .then((data) => setState(() {
                  for (var element in data) {
                    allCompanies.add(Company.fromJson(element));
                  }
                }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 600.0,
                child: TextField(
                  onChanged: (value) {
                    _filterSearchResults(value);
                  },
                  decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            TabBar(
              onTap: _onTabChanged, // Change displayed list on tab change
              tabs: [
                const Tab(text: 'All'),
                const Tab(text: 'Users'),
                const Tab(text: 'Company'),
              ],
            ),
            Expanded(
              child: ModalProgressHUD(
                inAsyncCall: isloading,
                child: TabBarView(
                  children: [
                    _buildUsersAndCompaniesList(allUsers, allCompanies),
                    buildUserList(allUsers),
                    buildCompaniesList(allCompanies),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompaniesList(List<Company> companies) {
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final customer = companies[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                customer.images.first.url ?? "https://via.placeholder.com/150"),
          ),
          title: Text(customer.firstName),
          subtitle: Text(customer.phoneNumber.toString()),
          onTap: () => showCompanyDetailsDialog(context, customer),
        );
      },
    );
  }

  Widget buildUserList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                user.images.first.url ?? "https://via.placeholder.com/150"),
          ),
          title: Text(user.name),
          subtitle: Text(user.email.toString()),
        );
      },
    );
  }

  Widget _buildUsersAndCompaniesList(
    List<User> users,
    List<Company> companies,
  ) {
    return Column(
      children: [
        Expanded(child: buildUserList(users)),
        Expanded(child: buildCompaniesList(companies)),
      ],
    );
  }
}
