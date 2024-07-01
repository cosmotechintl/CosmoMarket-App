import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/route_name.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  bool visibleButton=true;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: visibleButton ? ElevatedButton(
          onPressed: (){
              setState(() {
                visibleButton=!visibleButton;
              });
          },
          child: const Text("Book")
      ):
      Card(
        color: const Color(0xFFFFFFFF),
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical:25.0),
          child: Column(
            children: [
              const Text(
                  "Pay With",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryColor
                  ),
              ),
              const SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,RouteName.FUTSALBOOKED);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.asset(
                      "assets/imageRes/img.png",
                      fit: BoxFit.scaleDown,
                      width:150.0,
                    ),
                    const SizedBox(width:12.0),
                    Image.network(
                        "https://imgs.search.brave.com/amkJ56z2wp-VKD3CoTIoe6jZ3sEmeXNvG2dKR-OAdPA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZmluYW5jaWFsbm90/aWNlcy5jb20vcGFn/ZWdhbGxlcnkvc3Bh/cnJvdy1wYXktcHZ0/LWx0ZC1raGFsdGkx/NS5wbmc",
                        fit:BoxFit.scaleDown,
                        width:150.0
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
