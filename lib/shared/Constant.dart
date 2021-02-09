import 'package:farm_manager/screens/AdminHome.dart';
import 'package:farm_manager/screens/analytics.dart';
import 'package:farm_manager/screens/chemicals.dart';
import 'package:farm_manager/screens/customers.dart';
import 'package:farm_manager/screens/expenses.dart';
import 'package:farm_manager/screens/fuel.dart';
import 'package:farm_manager/screens/harvesting.dart';
import 'package:farm_manager/screens/incomes.dart';
import 'package:farm_manager/screens/mahineries.dart';
import 'package:farm_manager/screens/planting.dart';
import 'package:farm_manager/screens/reports.dart';
import 'package:farm_manager/screens/seeds.dart';
import 'package:farm_manager/screens/staffs.dart';
import 'package:farm_manager/screens/tillages.dart';
import 'package:farm_manager/screens/users.dart';
import 'package:farm_manager/shared/analytics/chemical_analytics.dart';
import 'package:farm_manager/shared/analytics/customer_analytics.dart';
import 'package:farm_manager/shared/analytics/expenses_analytics.dart';
import 'package:farm_manager/shared/analytics/fuel_analytics.dart';
import 'package:farm_manager/shared/analytics/harvesting_analytics.dart';
import 'package:farm_manager/shared/analytics/income_analytics.dart';
import 'package:farm_manager/shared/analytics/machines_analytics.dart';
import 'package:farm_manager/shared/analytics/planting_analytics.dart';
import 'package:farm_manager/shared/analytics/seeds_analytics.dart';
import 'package:farm_manager/shared/analytics/staff_analytics.dart';
import 'package:farm_manager/shared/analytics/tillage_analytics.dart';
import 'package:farm_manager/shared/analytics/users_analytics.dart';
import 'package:farm_manager/shared/report_screens/chemicals_report.dart';
import 'package:farm_manager/shared/report_screens/customer_report.dart';
import 'package:farm_manager/shared/report_screens/expenses_report.dart';
import 'package:farm_manager/shared/report_screens/fuel_report.dart';
import 'package:farm_manager/shared/report_screens/harvesting_report.dart';
import 'package:farm_manager/shared/report_screens/incomes_report.dart';
import 'package:farm_manager/shared/report_screens/machines_report.dart';
import 'package:farm_manager/shared/report_screens/planting_report.dart';
import 'package:farm_manager/shared/report_screens/seeds_report.dart';
import 'package:farm_manager/shared/report_screens/staff_report.dart';
import 'package:farm_manager/shared/report_screens/tillage_report.dart';
import 'package:farm_manager/shared/report_screens/users_report.dart';
import 'package:flutter/material.dart';

navigationReplaceRoute(context, location) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => location));
}

navigationPopRoute(context, value) {
  return Navigator.of(context).pop(value);
}

navigatePushTo(BuildContext context, Widget location) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => location));
}
// Datatable widget

// Widget buildDataTable(List<String> keys, List<String> values) {
//   try {
//     return DataTable(
//         columns: keys.map((columnName) => DataColumn(label: Text(columnName))),
//         rows: [
//           DataRow(
//             cells: values.map((value) => DataCell(Text(value))),
//           ),
//         ]);
//   } catch (err) {
//     print(err);
//   }
// }

// The drawer links

List drawerList(context) {
  List drawerMenuList = [
    {
      "Menu Icon": Icon(
        Icons.home,
        semanticLabel: "Home Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name": Text("Home", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, AdminHome())
    },
    {
      "Menu Icon": Icon(
        Icons.analytics,
        semanticLabel: "Analytics Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Analytics", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Analytics())
    },
    {
      "Menu Icon": Icon(
        Icons.report,
        semanticLabel: "Reports Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Reports", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Reports())
    },
    {
      "Menu Icon": Icon(
        Icons.supervised_user_circle_sharp,
        semanticLabel: "Users Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name": Text("Users", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Users())
    },
    {
      "Menu Icon": Icon(
        Icons.nature_people_sharp,
        semanticLabel: "Staffs Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name": Text("Staffs", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Staffs())
    },
    {
      "Menu Icon": Icon(
        Icons.emoji_people_sharp,
        semanticLabel: "Customers Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Customers", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Customers())
    },
    {
      "Menu Icon": Icon(
        Icons.money,
        semanticLabel: "Incomes Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Incomes", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Incomes())
    },
    {
      "Menu Icon": Icon(
        Icons.money_off_sharp,
        semanticLabel: "Expenses Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Expenses", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Expenses())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Machineries Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Machineries", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Machineries())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Fuel Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name": Text("Fuel", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Fuel())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Tillage Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Tillage", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Tillages())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Chemicals Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Chemicals", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Chemicals())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Seeds Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name": Text("Seeds", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Seeds())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Harvest Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Harvest", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Harvesting())
    },
    {
      "Menu Icon": Icon(
        Icons.file_present,
        semanticLabel: "Planting Icon",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      "Menu Name":
          Text("Planting", style: Theme.of(context).textTheme.headline5),
      "Menu Nav": () => navigatePushTo(context, Planting())
    },
  ];
  return drawerMenuList;
}

// Appbar

Widget profileImage() => Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 22.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Image(
          semanticLabel: "user's profile image",
          height: 8,
          width: 50,
          fit: BoxFit.cover,
          image: AssetImage("assets/images/profile.jpg"),
        ),
      ),
    );

customerAppBar(String title) => AppBar(
      title: Text(title),
      actions: [profileImage()],
    );

// User data test
List dataLists() {
  List dataList = [
    {
      "user id": "1",
      "username": "justine",
      "password": "asdfgh345",
      "designation": "store keeper"
    },
    {
      "user id": "2",
      "username": "bunmi",
      "password": "dfg345",
      "designation": "garage attendant"
    },
    {
      "user id": "3",
      "username": "james",
      "password": "jklkkl07",
      "designation": "farm operator keeper"
    }
  ];

  return dataList;
}

//Cta List
List ctaLists(context) {
  List ctaList = [
    {
      "Card Title Text": "Users",
      "Card Title Semantic": "Users Menu",
      "Card Function": () => navigatePushTo(context, Users()),
      "Card Image": "assets/images/users.jpg"
    },
    {
      "Card Title Text": "Staffs",
      "Card Title Semantic": "Staffs Menu",
      "Card Function": () => navigatePushTo(context, Staffs()),
      "Card Image": "assets/images/staffs.jpg"
    },
    {
      "Card Title Text": "Planting",
      "Card Title Semantic": "Planting Menu",
      "Card Function": () => navigatePushTo(context, Planting()),
      "Card Image": "assets/images/Planting.jpg"
    },
    {
      "Card Title Text": "Chemicals",
      "Card Title Semantic": "Chemicals Menu",
      "Card Function": () => navigatePushTo(context, Chemicals()),
      "Card Image": "assets/images/chemicals.jpg"
    },
    {
      "Card Title Text": "Incomes",
      "Card Title Semantic": "Incomes Menu",
      "Card Function": () => navigatePushTo(context, Incomes()),
      "Card Image": "assets/images/incomes.jpg"
    },
    {
      "Card Title Text": "Expenses",
      "Card Title Semantic": "Expenses Menu",
      "Card Function": () => navigatePushTo(context, Expenses()),
      "Card Image": "assets/images/expenditures.jpg"
    },
    {
      "Card Title Text": "Harvesting",
      "Card Title Semantic": "Harvesting Menu",
      "Card Function": () => navigatePushTo(context, Harvesting()),
      "Card Image": "assets/images/harvesting.jpg"
    },
    {
      "Card Title Text": "Customers",
      "Card Title Semantic": "Customers Menu",
      "Card Function": () => navigatePushTo(context, Customers()),
      "Card Image": "assets/images/customers.jpg"
    },
    {
      "Card Title Text": "Fuel",
      "Card Title Semantic": "Fuel Menu",
      "Card Function": () => navigatePushTo(context, Fuel()),
      "Card Image": "assets/images/fuel.jpg"
    },
    {
      "Card Title Text": "Seeds",
      "Card Title Semantic": "Seeds Menu",
      "Card Function": () => navigatePushTo(context, Seeds()),
      "Card Image": "assets/images/seeds.jpg"
    },
    {
      "Card Title Text": "Tillages",
      "Card Title Semantic": "Tillages Menu",
      "Card Function": () => navigatePushTo(context, Tillages()),
      "Card Image": "assets/images/tillage.jpg"
    },
    {
      "Card Title Text": "Machineries",
      "Card Title Semantic": "Machineries Menu",
      "Card Function": () => navigatePushTo(context, Machineries()),
      "Card Image": "assets/images/machines2.jpg"
    }
  ];
  return ctaList;
}

// Analyst CTA
List ctaAnalyticsLists(context) {
  List ctaAnalyticsList = [
    {
      "Card Title Text": "Users",
      "Card Title Semantic": "Users Menu",
      "Card Function": () => navigatePushTo(context, UsersAnalytics()),
      "Card Image": "assets/images/users.jpg"
    },
    {
      "Card Title Text": "Staffs",
      "Card Title Semantic": "Staffs Menu",
      "Card Function": () => navigatePushTo(context, StaffAnalytics()),
      "Card Image": "assets/images/staffs.jpg"
    },
    {
      "Card Title Text": "Planting",
      "Card Title Semantic": "Planting Menu",
      "Card Function": () => navigatePushTo(context, PlantingAnalytics()),
      "Card Image": "assets/images/Planting.jpg"
    },
    {
      "Card Title Text": "Chemicals",
      "Card Title Semantic": "Chemicals Menu",
      "Card Function": () => navigatePushTo(context, ChemicalAnalytics()),
      "Card Image": "assets/images/chemicals.jpg"
    },
    {
      "Card Title Text": "Incomes",
      "Card Title Semantic": "Incomes Menu",
      "Card Function": () => navigatePushTo(context, IncomeAnalytics()),
      "Card Image": "assets/images/incomes.jpg"
    },
    {
      "Card Title Text": "Expenses",
      "Card Title Semantic": "Expenses Menu",
      "Card Function": () => navigatePushTo(context, ExpensesAnalytics()),
      "Card Image": "assets/images/expenditures.jpg"
    },
    {
      "Card Title Text": "Harvesting",
      "Card Title Semantic": "Harvesting Menu",
      "Card Function": () => navigatePushTo(context, HarvestingAnalytics()),
      "Card Image": "assets/images/harvesting.jpg"
    },
    {
      "Card Title Text": "Customers",
      "Card Title Semantic": "Customers Menu",
      "Card Function": () => navigatePushTo(context, CustomerAnalytics()),
      "Card Image": "assets/images/customers.jpg"
    },
    {
      "Card Title Text": "Fuel",
      "Card Title Semantic": "Fuel Menu",
      "Card Function": () => navigatePushTo(context, FuelAnalytics()),
      "Card Image": "assets/images/fuel.jpg"
    },
    {
      "Card Title Text": "Seeds",
      "Card Title Semantic": "Seeds Menu",
      "Card Function": () => navigatePushTo(context, SeedsAnalytics()),
      "Card Image": "assets/images/seeds.jpg"
    },
    {
      "Card Title Text": "Tillages",
      "Card Title Semantic": "Tillages Menu",
      "Card Function": () => navigatePushTo(context, TillageAnalytics()),
      "Card Image": "assets/images/tillage.jpg"
    },
    {
      "Card Title Text": "Machineries",
      "Card Title Semantic": "Machineries Menu",
      "Card Function": () => navigatePushTo(context, MachinesAnalytics()),
      "Card Image": "assets/images/machines2.jpg"
    }
  ];
  return ctaAnalyticsList;
}

// Report CTA
List ctaReportLists(context) {
  List ctaReportList = [
    {
      "Card Title Text": "Users",
      "Card Title Semantic": "Users Menu",
      "Card Function": () => navigatePushTo(context, UsersReport()),
      "Card Image": "assets/images/users.jpg"
    },
    {
      "Card Title Text": "Staffs",
      "Card Title Semantic": "Staffs Menu",
      "Card Function": () => navigatePushTo(context, StaffReport()),
      "Card Image": "assets/images/staffs.jpg"
    },
    {
      "Card Title Text": "Planting",
      "Card Title Semantic": "Planting Menu",
      "Card Function": () => navigatePushTo(context, PlantingReport()),
      "Card Image": "assets/images/Planting.jpg"
    },
    {
      "Card Title Text": "Chemicals",
      "Card Title Semantic": "Chemicals Menu",
      "Card Function": () => navigatePushTo(context, ChemicalsReport()),
      "Card Image": "assets/images/chemicals.jpg"
    },
    {
      "Card Title Text": "Incomes",
      "Card Title Semantic": "Incomes Menu",
      "Card Function": () => navigatePushTo(context, IncomesReport()),
      "Card Image": "assets/images/incomes.jpg"
    },
    {
      "Card Title Text": "Expenses",
      "Card Title Semantic": "Expenses Menu",
      "Card Function": () => navigatePushTo(context, ExpensesReport()),
      "Card Image": "assets/images/expenditures.jpg"
    },
    {
      "Card Title Text": "Harvesting",
      "Card Title Semantic": "Harvesting Menu",
      "Card Function": () => navigatePushTo(context, HarvestingReport()),
      "Card Image": "assets/images/harvesting.jpg"
    },
    {
      "Card Title Text": "Customers",
      "Card Title Semantic": "Customers Menu",
      "Card Function": () => navigatePushTo(context, CustomerReport()),
      "Card Image": "assets/images/customers.jpg"
    },
    {
      "Card Title Text": "Fuel",
      "Card Title Semantic": "Fuel Menu",
      "Card Function": () => navigatePushTo(context, FuelReport()),
      "Card Image": "assets/images/fuel.jpg"
    },
    {
      "Card Title Text": "Seeds",
      "Card Title Semantic": "Seeds Menu",
      "Card Function": () => navigatePushTo(context, SeedsReport()),
      "Card Image": "assets/images/seeds.jpg"
    },
    {
      "Card Title Text": "Tillages",
      "Card Title Semantic": "Tillages Menu",
      "Card Function": () => navigatePushTo(context, TillageReport()),
      "Card Image": "assets/images/tillage.jpg"
    },
    {
      "Card Title Text": "Machineries",
      "Card Title Semantic": "Machineries Menu",
      "Card Function": () => navigatePushTo(context, MachinesReport()),
      "Card Image": "assets/images/machines2.jpg"
    }
  ];
  return ctaReportList;
}

//Snackbars

customSnackBar(BuildContext context, String content) {
  return ScaffoldMessenger(
      child: Text(
    content,
    style: Theme.of(context).textTheme.button,
  ));
}
