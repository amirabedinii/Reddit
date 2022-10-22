
import 'package:flutter/material.dart';
import '../main.dart';

class AddCommunity extends StatefulWidget {
  Function addCommunity;
  AddCommunity({required Key key, required this.addCommunity}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  late TextEditingController communityNameController;
  String communityNameError = "";
  late SnackBar alarm;
  late GlobalKey<ScaffoldState> scaffoldKey;
  @override
  void initState() {
    communityNameController = TextEditingController();
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }
  @override
  void dispose() {
    communityNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 80.0, left: 40.0),
            child: Text('Enter your community name : \n', style: TextStyle(fontFamily: 'Montserrat',fontSize: 17.0, fontWeight: FontWeight.bold, color: Color(Colors.blue.value)),),
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: communityNameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  icon: Icon(Icons.people_alt_sharp, color: Color(Colors.blue.value),),
                  errorText: communityNameError,
                  hintText: 'r/community',
                  hintMaxLines: 1,
                  hintStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 19.0),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)),
                  contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25.0, left: 0.0),
              child: MaterialButton(
                elevation: 16.0,
                height: 60,
                minWidth: 220,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  String communityName = communityNameController.text;
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    if(communityName.isEmpty) {
                      communityNameError = 'Please enter a non-empty name';
                    } else {
                      communityNameError = "";
                      alarm = SnackBar(content: Text('$communityName Created!'));
                      scaffoldKey.currentState?.showSnackBar(alarm);
                    }
                  });
                },
                color: Colors.blue,
                child: Text('Add', style: TextStyle(fontFamily: 'Montserrat',fontSize: 19.0, fontWeight: FontWeight.bold, color: Colors.white),),
              )),
        ],
      ),
    );
  }
}