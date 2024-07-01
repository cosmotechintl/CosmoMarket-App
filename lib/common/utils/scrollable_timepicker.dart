
import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTimePicker{

  static String selectedTime = TimeOfDay.now().hour.toString();
  static bool isAm = true;
  static int selectedItemIndex = 3;

  static Future<String?> selectHour(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: AppTheme.serviceButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(
                height: 250,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 10.0,
                      //   decoration: const BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black26,
                      //         blurRadius: 8.0,
                      //         spreadRadius: 1.0,
                      //         offset: Offset(0, 2),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 60,
                                physics: const FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedItemIndex = index;
                                    selectedTime=getTime(index).toString();
                                    int time = getTime(index);
                                    onTimeChanged(time);
                                  });
                                },
                                childDelegate:ListWheelChildBuilderDelegate(
                                  builder:
                                      (BuildContext context, int index) {
                                    int time = getTime(index);
                                    bool isSelected = index == selectedItemIndex;

                                    return ListTile(
                                      title: Center(
                                        child: Text(
                                          time.toString().padLeft(2, "0"),
                                          style: TextStyle(
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: isSelected ? 24.0 : 20.0,
                                            color: isSelected
                                                ? const Color(0xFF00425A)
                                                : Colors.black12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context, {
                                          'hour': selectedTime,
                                          'isAm': CustomTimePicker.isAm,
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Expanded(
                              child: VerticalDivider(),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                        CustomTimePicker.isAm?'AM':'PM',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:Color(0xFF00425A) ,
                                          fontSize: 20.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      !CustomTimePicker.isAm?'AM':'PM',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black12,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if(CustomTimePicker.isAm)
                                        {
                                          CustomTimePicker.isAm=false;
                                        }
                                        else{
                                          CustomTimePicker.isAm=true;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                  "Cancel",
                                  style:GoogleFonts.inter(
                                      color:AppTheme.primaryColor,
                                      fontWeight:FontWeight.w700
                                  )
                              )
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context, {
                                  'hour': selectedTime,
                                  'isAm': CustomTimePicker.isAm,
                                });
                              },
                              child:  Text(
                                  "Select",
                                  style:GoogleFonts.inter(
                                    color:AppTheme.primaryColor,
                                    fontWeight:FontWeight.w700
                                  )
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
    if(result != null) {
      String hour = result['hour'];
      bool isAm = result['isAm'];
      return "$hour ${isAm ? 'AM' : 'PM'}";
    }
    return null;
  }

  static int getTime(int index) {
    int indexAdded = index + 1;
    int twelveHr = indexAdded % 12;
    int time = twelveHr == 0 ? 12 : twelveHr;
    return time;
  }

  static void onTimeChanged(int time) {
    if (time == 12) {
      isAm = !isAm;
    }
  }
}