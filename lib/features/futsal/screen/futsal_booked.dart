import 'package:cosmomarket/features/futsal/screen/futsal_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FutsalBooked extends StatelessWidget {
  const FutsalBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logo/SuccessIcon.png"
        ),
        Text(
          "Success",
          style: GoogleFonts.inter(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color:const Color(0xFF374151)
          ),
        ),
        Text(
          "You have succesfully booked this futsal",
          style: GoogleFonts.inter(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color:const Color(0xFF2f667a)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: ElevatedButton(
          onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (_)=> const FutsalHomeScreen()));
          },
              child: const Text("Back Home")
          ),
        )


      ],
    );
  }
}
