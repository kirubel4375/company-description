import 'package:company_description/widgets/navbar_button.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/responsive_layout.dart';

class NavBar extends StatelessWidget {
  final void Function(MyRoutePath) onNavigate;
  const NavBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFC86DD7),
                      Color(0xFF3023AE),
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                child: Center(
                  child: Image.asset('assets/images/company_logo0.jpg'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              !ResponsiveLayout.isSmallScreen(context)
                  ? const Text(
                      "Splendor Business Solutions",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Bold",
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavBarButton(
                  onTap: () => onNavigate(MyRoutePath.home()),
                  text: "Home",
                ),
                NavBarButton(
                  onTap: () => onNavigate(MyRoutePath.register()),
                  text: "register",
                ),
                NavBarButton(
                  onTap: () => onNavigate(MyRoutePath.contact()),
                  text: "Contact us",
                ),
                InkWell(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF6078ea).withOpacity(.3),
                            offset: const Offset(0, 8),
                            blurRadius: 8)
                      ]),
                  child: const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: "Montserrat-Bold")),
                    ),
                  ),
                ))
              ],
            )
          else
           InkWell(
            onTap: ()=>onNavigate(MyRoutePath.register()),
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF6078ea).withOpacity(.3),
                            offset: const Offset(0, 8),
                            blurRadius: 8)
                      ]),
                  child: const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text("Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: "Montserrat-Bold")),
                    ),
                  ),
                ))
            // IconButton(onPressed: context.watch<Cont>().scrollTo, icon: const Icon(Icons.menu))
          // Image.network("assets/menu.png", width: 26, height: 26)
        ],
      ),
    );
  }
}
