import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_admin_app/models/customer/customer/customer.dart';
import 'package:web_admin_app/pages/cusomers_page.dart';

void showCompanyDetailsDialog(BuildContext context, Company customer) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 500,
          height: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    //  backgroundImage: ),
                    radius: 40,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.firstName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Entry Date: ${customer.companyName}'),
                        Gap(30),
                        Text(
                            'Service Type: ${customer.acceptPrivacy ?? 'N/A'}'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
