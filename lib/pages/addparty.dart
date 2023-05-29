import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AddParty());
}
class CountryData {
  final String name;
  final int stdCode;
  final String flagIcon;

  CountryData({required this.name, required this.stdCode, required this.flagIcon});
}
class AddParty extends StatelessWidget {
   AddParty({super.key});
   final List<CountryData> countryDataList = [
     CountryData(name:'Afghanistan', stdCode:93,flagIcon:'🇦🇫'),
     CountryData(name:'Åland Islands', stdCode:358,flagIcon:'🇦🇽'),
     CountryData(name:'Albania', stdCode:355,flagIcon:'🇦🇱'),
     CountryData(name:'Algeria', stdCode:213,flagIcon:'🇩🇿'),
     CountryData(name:'American Samoa', stdCode:1684,flagIcon:'🇦🇸'),
     CountryData(name:'Andorra', stdCode:376,flagIcon:'🇦🇩'),
     CountryData(name:'Angola', stdCode:244,flagIcon:'🇦🇴'),
     CountryData(name:'Anguilla', stdCode:1264,flagIcon:'🇦🇮'),
     CountryData(name:'Antarctica', stdCode:672,flagIcon:'🇦🇶'),
     CountryData(name:'Antigua and Barbuda', stdCode:1268,flagIcon:'🇦🇬'),
     CountryData(name:'Argentina', stdCode:54,flagIcon:'🇦🇷'),
     CountryData(name:'Armenia', stdCode:374,flagIcon:'🇦🇲'),
     CountryData(name:'Aruba', stdCode:297,flagIcon:'🇦🇼'),
     CountryData(name:'Australia', stdCode:61,flagIcon:'🇦🇺'),
     CountryData(name:'Austria', stdCode:43,flagIcon:'🇦🇹'),
     CountryData(name:'Azerbaijan', stdCode:994,flagIcon:'🇦🇿'),
     CountryData(name:'Bahamas', stdCode:1242,flagIcon:'🇧🇸'),
     CountryData(name:'Bahrain', stdCode:973,flagIcon:'🇧🇭'),
     CountryData(name:'Bangladesh', stdCode:880,flagIcon:'🇧🇩'),
     CountryData(name:'Barbados', stdCode:1246,flagIcon:'🇧🇧'),
     CountryData(name:'Belarus', stdCode:375,flagIcon:'🇧🇾'),
     CountryData(name:'Belgium', stdCode:32,flagIcon:'🇧🇪'),
     CountryData(name:'Belize', stdCode:501,flagIcon:'🇧🇿'),
     CountryData(name:'Benin', stdCode:229,flagIcon:'🇧🇯'),
     CountryData(name:'Bermuda', stdCode:1441,flagIcon:'🇧🇲'),
     CountryData(name:'Bhutan', stdCode:975,flagIcon:'🇧🇹'),
     CountryData(name:'Bolivia, Plurinational State of bolivia', stdCode:591,flagIcon:'🇧🇴'),
     CountryData(name:'Bosnia and Herzegovina', stdCode:387,flagIcon:'🇧🇦'),
     CountryData(name:'Botswana', stdCode:267,flagIcon:'🇧🇼'),
     CountryData(name:'Bouvet Island', stdCode:47,flagIcon:'🇧🇻'),
     CountryData(name:'Brazil', stdCode:55,flagIcon:'🇧🇷'),
     CountryData(name:'British Indian Ocean Territory', stdCode:246,flagIcon:'🇮🇴'),
     CountryData(name:'Brunei Darussalam', stdCode:673,flagIcon:'🇧🇳'),
     CountryData(name:'Bulgaria', stdCode:359,flagIcon:'🇧🇬'),
     CountryData(name:'Burkina Faso', stdCode:226,flagIcon:'🇧🇫'),
     CountryData(name:'Burundi', stdCode:257,flagIcon:'🇧🇮'),
     CountryData(name:'Cambodia', stdCode:855,flagIcon:'🇰🇭'),
     CountryData(name:'Cameroon', stdCode:237,flagIcon:'🇨🇲'),
     CountryData(name:'Canada', stdCode:1,flagIcon:'🇨🇦'),
     CountryData(name:'Cape Verde', stdCode:238,flagIcon:'🇨🇻'),
     CountryData(name:'Cayman Islands', stdCode:345,flagIcon:'🇰🇾'),
     CountryData(name:'Central African Republic', stdCode:236,flagIcon:'🇨🇫'),
     CountryData(name:'Chad', stdCode:235,flagIcon:'🇹🇩'),
     CountryData(name:'Chile', stdCode:56,flagIcon:'🇨🇱'),
     CountryData(name:'China', stdCode:86,flagIcon:'🇨🇳'),
     CountryData(name:'Christmas Island', stdCode:61,flagIcon:'🇨🇽'),
     CountryData(name:'Cocos (Keeling) Islands', stdCode:61,flagIcon:'🇨🇨'),
     CountryData(name:'Colombia', stdCode:57,flagIcon:'🇨🇴'),
     CountryData(name:'Comoros', stdCode:269,flagIcon:'🇰🇲'),
     CountryData(name:'Congo', stdCode:242,flagIcon:'🇨🇬'),
     CountryData(name:'Congo, The Democratic Republic of the Congo', stdCode:243,flagIcon:'🇨🇩'),
     CountryData(name:'Cook Islands', stdCode:682,flagIcon:'🇨🇰'),
     CountryData(name:'Costa Rica', stdCode:506,flagIcon:'🇨🇷'),
     CountryData(name:'Cote d\'Ivoire', stdCode:225,flagIcon:'🇨🇮'),
     CountryData(name:'Croatia', stdCode:385,flagIcon:'🇭🇷'),
     CountryData(name:'Cuba', stdCode:53,flagIcon:'🇨🇺'),
     CountryData(name:'Cyprus', stdCode:357,flagIcon:'🇨🇾'),
     CountryData(name:'Czech Republic', stdCode:420,flagIcon:'🇨🇿'),
     CountryData(name:'Denmark', stdCode:45,flagIcon:'🇩🇰'),
     CountryData(name:'Djibouti', stdCode:253,flagIcon:'🇩🇯'),
     CountryData(name:'Dominica', stdCode:1767,flagIcon:'🇩🇲'),
     CountryData(name:'Dominican Republic', stdCode:1849,flagIcon:'🇩🇴'),
     CountryData(name:'Ecuador', stdCode:593,flagIcon:'🇪🇨'),
     CountryData(name:'Egypt', stdCode:20,flagIcon:'🇪🇬'),
     CountryData(name:'El Salvador', stdCode:503,flagIcon:'🇸🇻'),
     CountryData(name:'Equatorial Guinea', stdCode:240,flagIcon:'🇬🇶'),
     CountryData(name:'Eritrea', stdCode:291,flagIcon:'🇪🇷'),
     CountryData(name:'Estonia', stdCode:372,flagIcon:'🇪🇪'),
     CountryData(name:'Ethiopia', stdCode:251,flagIcon:'🇪🇹'),
     CountryData(name:'Falkland Islands (Malvinas)', stdCode:500,flagIcon:'🇫🇰'),
     CountryData(name:'Faroe Islands', stdCode:298,flagIcon:'🇫🇴'),
     CountryData(name:'Fiji', stdCode:679,flagIcon:'🇫🇯'),
     CountryData(name:'Finland', stdCode:358,flagIcon:'🇫🇮'),
     CountryData(name:'France', stdCode:33,flagIcon:'🇫🇷'),
     CountryData(name:'French Guiana', stdCode:594,flagIcon:'🇬🇫'),
     CountryData(name:'French Polynesia', stdCode:689,flagIcon:'🇵🇫'),
     CountryData(name:'French Southern Territories', stdCode:262,flagIcon:'🇹🇫'),
     CountryData(name:'Gabon', stdCode:241,flagIcon:'🇬🇦'),
     CountryData(name:'Gambia', stdCode:220,flagIcon:'🇬🇲'),
     CountryData(name:'Georgia', stdCode:995,flagIcon:'🇬🇪'),
     CountryData(name:'Germany', stdCode:49,flagIcon:'🇩🇪'),
     CountryData(name:'Ghana', stdCode:233,flagIcon:'🇬🇭'),
     CountryData(name:'Gibraltar', stdCode:350,flagIcon:'🇬🇮'),
     CountryData(name:'Greece', stdCode:30,flagIcon:'🇬🇷'),
     CountryData(name:'Greenland', stdCode:299,flagIcon:'🇬🇱'),
     CountryData(name:'Grenada', stdCode:1473,flagIcon:'🇬🇩'),
     CountryData(name:'Guadeloupe', stdCode:590,flagIcon:'🇬🇵'),
     CountryData(name:'Guam', stdCode:1671,flagIcon:'🇬🇺'),
     CountryData(name:'Guatemala', stdCode:502,flagIcon:'🇬🇹'),
     CountryData(name:'Guernsey', stdCode:44,flagIcon:'🇬🇬'),
     CountryData(name:'Guinea', stdCode:224,flagIcon:'🇬🇳'),
     CountryData(name:'Guinea-Bissau', stdCode:245,flagIcon:'🇬🇼'),
     CountryData(name:'Guyana', stdCode:592,flagIcon:'🇬🇾'),
     CountryData(name:'Haiti', stdCode:509,flagIcon:'🇭🇹'),
     CountryData(name:'Heard Island and Mcdonald Islands', stdCode:672,flagIcon:'🇭🇲'),
     CountryData(name:'Holy See (Vatican City State)', stdCode:379,flagIcon:'🇻🇦'),
     CountryData(name:'Honduras', stdCode:504,flagIcon:'🇭🇳'),
     CountryData(name:'Hong Kong', stdCode:852,flagIcon:'🇭🇰'),
     CountryData(name:'Hungary', stdCode:36,flagIcon:'🇭🇺'),
     CountryData(name:'Iceland', stdCode:354,flagIcon:'🇮🇸'),
     CountryData(name:'India', stdCode:91,flagIcon:'🇮🇳'),
     CountryData(name:'Indonesia', stdCode:62,flagIcon:'🇮🇩'),
     CountryData(name:'Iran, Islamic Republic of Persian Gulf', stdCode:98,flagIcon:'🇮🇷'),
     CountryData(name:'Iraq', stdCode:964,flagIcon:'🇮🇶'),
     CountryData(name:'Ireland', stdCode:353,flagIcon:'🇮🇪'),
     CountryData(name:'Isle of Man', stdCode:44,flagIcon:'🇮🇲'),
     CountryData(name:'Israel', stdCode:972,flagIcon:'🇮🇱'),
     CountryData(name:'Italy', stdCode:39,flagIcon:'🇮🇹'),
     CountryData(name:'Jamaica', stdCode:1876,flagIcon:'🇯🇲'),
     CountryData(name:'Japan', stdCode:81,flagIcon:'🇯🇵'),
     CountryData(name:'Jersey', stdCode:44,flagIcon:'🇯🇪'),
     CountryData(name:'Jordan', stdCode:962,flagIcon:'🇯🇴'),
     CountryData(name:'Kazakhstan', stdCode:7,flagIcon:'🇰🇿'),
     CountryData(name:'Kenya', stdCode:254,flagIcon:'🇰🇪'),
     CountryData(name:'Kiribati', stdCode:686,flagIcon:'🇰🇮'),
     CountryData(name:'Korea, Democratic People\'s Republic of Korea', stdCode:850,flagIcon:'🇰🇵'),
     CountryData(name:'Korea, Republic of South Korea', stdCode:82,flagIcon:'🇰🇷'),
     CountryData(name:'Kosovo', stdCode:383,flagIcon:'🇽🇰'),
     CountryData(name:'Kuwait', stdCode:965,flagIcon:'🇰🇼'),
     CountryData(name:'Kyrgyzstan', stdCode:996,flagIcon:'🇰🇬'),
     CountryData(name:'Laos', stdCode:856,flagIcon:'🇱🇦'),
     CountryData(name:'Latvia', stdCode:371,flagIcon:'🇱🇻'),
     CountryData(name:'Lebanon', stdCode:961,flagIcon:'🇱🇧'),
     CountryData(name:'Lesotho', stdCode:266,flagIcon:'🇱🇸'),
     CountryData(name:'Liberia', stdCode:231,flagIcon:'🇱🇷'),
     CountryData(name:'Libyan Arab Jamahiriya', stdCode:218,flagIcon:'🇱🇾'),
     CountryData(name:'Liechtenstein', stdCode:423,flagIcon:'🇱🇮'),
     CountryData(name:'Lithuania', stdCode:370,flagIcon:'🇱🇹'),
     CountryData(name:'Luxembourg', stdCode:352,flagIcon:'🇱🇺'),
     CountryData(name:'Macao', stdCode:853,flagIcon:'🇲🇴'),
     CountryData(name:'Madagascar', stdCode:261,flagIcon:'🇲🇬'),
     CountryData(name:'Malawi', stdCode:265,flagIcon:'🇲🇼'),
     CountryData(name:'Malaysia', stdCode:60,flagIcon:'🇲🇾'),
     CountryData(name:'Maldives', stdCode:960,flagIcon:'🇲🇻'),
     CountryData(name:'Mali', stdCode:223,flagIcon:'🇲🇱'),
     CountryData(name:'Malta', stdCode:356,flagIcon:'🇲🇹'),
     CountryData(name:'Marshall Islands', stdCode:692,flagIcon:'🇲🇭'),
     CountryData(name:'Martinique', stdCode:596,flagIcon:'🇲🇶'),
     CountryData(name:'Mauritania', stdCode:222,flagIcon:'🇲🇷'),
     CountryData(name:'Mauritius', stdCode:230,flagIcon:'🇲🇺'),
     CountryData(name:'Mayotte', stdCode:262,flagIcon:'🇾🇹'),
     CountryData(name:'Mexico', stdCode:52,flagIcon:'🇲🇽'),
     CountryData(name:'Micronesia, Federated States of Micronesia', stdCode:691,flagIcon:'🇫🇲'),
     CountryData(name:'Moldova', stdCode:373,flagIcon:'🇲🇩'),
     CountryData(name:'Monaco', stdCode:377,flagIcon:'🇲🇨'),
     CountryData(name:'Mongolia', stdCode:976,flagIcon:'🇲🇳'),
     CountryData(name:'Montenegro', stdCode:382,flagIcon:'🇲🇪'),
     CountryData(name:'Montserrat', stdCode:1664,flagIcon:'🇲🇸'),
     CountryData(name:'Morocco', stdCode:212,flagIcon:'🇲🇦'),
     CountryData(name:'Mozambique', stdCode:258,flagIcon:'🇲🇿'),
     CountryData(name:'Myanmar', stdCode:95,flagIcon:'🇲🇲'),
     CountryData(name:'Namibia', stdCode:264,flagIcon:'🇳🇦'),
     CountryData(name:'Nauru', stdCode:674,flagIcon:'🇳🇷'),
     CountryData(name:'Nepal', stdCode:977,flagIcon:'🇳🇵'),
     CountryData(name:'Netherlands', stdCode:31,flagIcon:'🇳🇱'),
     CountryData(name:'Netherlands Antilles', stdCode:599,flagIcon:''),
     CountryData(name:'New Caledonia', stdCode:687,flagIcon:'🇳🇨'),
     CountryData(name:'New Zealand', stdCode:64,flagIcon:'🇳🇿'),
     CountryData(name:'Nicaragua', stdCode:505,flagIcon:'🇳🇮'),
     CountryData(name:'Niger', stdCode:227,flagIcon:'🇳🇪'),
     CountryData(name:'Nigeria', stdCode:234,flagIcon:'🇳🇬'),
     CountryData(name:'Niue', stdCode:683,flagIcon:'🇳🇺'),
     CountryData(name:'Norfolk Island', stdCode:672,flagIcon:'🇳🇫'),
     CountryData(name:'North Macedonia', stdCode:389,flagIcon:'🇲🇰'),
     CountryData(name:'Northern Mariana Islands', stdCode:1670,flagIcon:'🇲🇵'),
     CountryData(name:'Norway', stdCode:47,flagIcon:'🇳🇴'),
     CountryData(name:'Oman', stdCode:968,flagIcon:'🇴🇲'),
     CountryData(name:'Pakistan', stdCode:92,flagIcon:'🇵🇰'),
     CountryData(name:'Palau', stdCode:680,flagIcon:'🇵🇼'),
     CountryData(name:'Palestinian Territory, Occupied', stdCode:970,flagIcon:'🇵🇸'),
     CountryData(name:'Panama', stdCode:507,flagIcon:'🇵🇦'),
     CountryData(name:'Papua New Guinea', stdCode:675,flagIcon:'🇵🇬'),
     CountryData(name:'Paraguay', stdCode:595,flagIcon:'🇵🇾'),
     CountryData(name:'Peru', stdCode:51,flagIcon:'🇵🇪'),
     CountryData(name:'Philippines', stdCode:63,flagIcon:'🇵🇭'),
     CountryData(name:'Pitcairn', stdCode:64,flagIcon:'🇵🇳'),
     CountryData(name:'Poland', stdCode:48,flagIcon:'🇵🇱'),
     CountryData(name:'Portugal', stdCode:351,flagIcon:'🇵🇹'),
     CountryData(name:'Puerto Rico', stdCode:1939,flagIcon:'🇵🇷'),
     CountryData(name:'Qatar', stdCode:974,flagIcon:'🇶🇦'),
     CountryData(name:'Reunion', stdCode:262,flagIcon:'🇷🇪'),
     CountryData(name:'Romania', stdCode:40,flagIcon:'🇷🇴'),
     CountryData(name:'Russia', stdCode:7,flagIcon:'🇷🇺'),
     CountryData(name:'Rwanda', stdCode:250,flagIcon:'🇷🇼'),
     CountryData(name:'Saint Barthelemy', stdCode:590,flagIcon:'🇧🇱'),
     CountryData(name:'Saint Helena, Ascension and Tristan Da Cunha', stdCode:290,flagIcon:'🇸🇭'),
     CountryData(name:'Saint Kitts and Nevis', stdCode:1869,flagIcon:'🇰🇳'),
     CountryData(name:'Saint Lucia', stdCode:1758,flagIcon:'🇱🇨'),
     CountryData(name:'Saint Martin', stdCode:590,flagIcon:'🇲🇫'),
     CountryData(name:'Saint Pierre and Miquelon', stdCode:508,flagIcon:'🇵🇲'),
     CountryData(name:'Saint Vincent and the Grenadines', stdCode:1784,flagIcon:'🇻🇨'),
     CountryData(name:'Samoa', stdCode:685,flagIcon:'🇼🇸'),
     CountryData(name:'San Marino', stdCode:378,flagIcon:'🇸🇲'),
     CountryData(name:'Sao Tome and Principe', stdCode:239,flagIcon:'🇸🇹'),
     CountryData(name:'Saudi Arabia', stdCode:966,flagIcon:'🇸🇦'),
     CountryData(name:'Senegal', stdCode:221,flagIcon:'🇸🇳'),
     CountryData(name:'Serbia', stdCode:381,flagIcon:'🇷🇸'),
     CountryData(name:'Seychelles', stdCode:248,flagIcon:'🇸🇨'),
     CountryData(name:'Sierra Leone', stdCode:232,flagIcon:'🇸🇱'),
     CountryData(name:'Singapore', stdCode:65,flagIcon:'🇸🇬'),
     CountryData(name:'Slovakia', stdCode:421,flagIcon:'🇸🇰'),
     CountryData(name:'Slovenia', stdCode:386,flagIcon:'🇸🇮'),
     CountryData(name:'Solomon Islands', stdCode:677,flagIcon:'🇸🇧'),
     CountryData(name:'Somalia', stdCode:252,flagIcon:'🇸🇴'),
     CountryData(name:'South Africa', stdCode:27,flagIcon:'🇿🇦'),
     CountryData(name:'South Georgia and the South Sandwich Islands', stdCode:500,flagIcon:'🇬🇸'),
     CountryData(name:'South Sudan', stdCode:211,flagIcon:'🇸🇸'),
     CountryData(name:'Spain', stdCode:34,flagIcon:'🇪🇸'),
     CountryData(name:'Sri Lanka', stdCode:94,flagIcon:'🇱🇰'),
     CountryData(name:'Sudan', stdCode:249,flagIcon:'🇸🇩'),
     CountryData(name:'Suriname', stdCode:597,flagIcon:'🇸🇷'),
     CountryData(name:'Svalbard and Jan Mayen', stdCode:47,flagIcon:'🇸🇯'),
     CountryData(name:'Swaziland', stdCode:268,flagIcon:'🇸🇿'),
     CountryData(name:'Sweden', stdCode:46,flagIcon:'🇸🇪'),
     CountryData(name:'Switzerland', stdCode:41,flagIcon:'🇨🇭'),
     CountryData(name:'Syrian Arab Republic', stdCode:963,flagIcon:'🇸🇾'),
     CountryData(name:'Taiwan', stdCode:886,flagIcon:'🇹🇼'),
     CountryData(name:'Tajikistan', stdCode:992,flagIcon:'🇹🇯'),
     CountryData(name:'Tanzania, United Republic of Tanzania', stdCode:255,flagIcon:'🇹🇿'),
     CountryData(name:'Thailand', stdCode:66,flagIcon:'🇹🇭'),
     CountryData(name:'Timor-Leste', stdCode:670,flagIcon:'🇹🇱'),
     CountryData(name:'Togo', stdCode:228,flagIcon:'🇹🇬'),
     CountryData(name:'Tokelau', stdCode:690,flagIcon:'🇹🇰'),
     CountryData(name:'Tonga', stdCode:676,flagIcon:'🇹🇴'),
     CountryData(name:'Trinidad and Tobago', stdCode:1868,flagIcon:'🇹🇹'),
     CountryData(name:'Tunisia', stdCode:216,flagIcon:'🇹🇳'),
     CountryData(name:'Türkiye', stdCode:90,flagIcon:'🇹🇷'),
     CountryData(name:'Turkmenistan', stdCode:993,flagIcon:'🇹🇲'),
     CountryData(name:'Turks and Caicos Islands', stdCode:1649,flagIcon:'🇹🇨'),
     CountryData(name:'Tuvalu', stdCode:688,flagIcon:'🇹🇻'),
     CountryData(name:'Uganda', stdCode:256,flagIcon:'🇺🇬'),
     CountryData(name:'Ukraine', stdCode:380,flagIcon:'🇺🇦'),
     CountryData(name:'United Arab Emirates', stdCode:971,flagIcon:'🇦🇪'),
     CountryData(name:'United Kingdom', stdCode:44,flagIcon:'🇬🇧'),
     CountryData(name:'United States', stdCode:1,flagIcon:'🇺🇸'),
     CountryData(name:'Uruguay', stdCode:598,flagIcon:'🇺🇾'),
     CountryData(name:'Uzbekistan', stdCode:998,flagIcon:'🇺🇿'),
     CountryData(name:'Vanuatu', stdCode:678,flagIcon:'🇻🇺'),
     CountryData(name:'Venezuela, Bolivarian Republic of Venezuela', stdCode:58,flagIcon:'🇻🇪'),
     CountryData(name:'Vietnam', stdCode:84,flagIcon:'🇻🇳'),
     CountryData(name:'Virgin Islands, British', stdCode:1284,flagIcon:'🇻🇬'),
     CountryData(name:'Virgin Islands, U.S.', stdCode:1340,flagIcon:'🇻🇮'),
     CountryData(name:'Wallis and Futuna', stdCode:681,flagIcon:'🇼🇫'),
     CountryData(name:'Yemen', stdCode:967,flagIcon:'🇾🇪'),
     CountryData(name:'Zambia', stdCode:260,flagIcon:'🇿🇲'),
     CountryData(name:'Zimbabwe', stdCode:263,flagIcon:'🇿🇼'),
   ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  _AddParty(title: 'Add Party',countryDataList: countryDataList),
    );
  }
}

class _AddParty extends StatefulWidget {
  const _AddParty({super.key, required this.title, required this.countryDataList});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final List<CountryData> countryDataList;

  @override
  State<_AddParty> createState() => _AddPartyState();
}

class _AddPartyState extends State<_AddParty> {
  var partyText = TextEditingController();
  var contactText = TextEditingController();
  bool _isButtonEnabled = false;
  CountryData? selectedCountry;


  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');
  /*  await _users.add({"name":name });
      await _users.update({"name":name });
      await _users.doc(Id).delete();*/
  Future<void> _create(var name,var contact) async{
    //await _users.add({"Name":"test Name added"});
    await _users.add({"Name":name,"contact":contact});
  }
  @override
  void initState() {
    super.initState();
    selectedCountry = widget.countryDataList.first;
  }


  @override
  void dispose() {
    partyText.dispose();
    contactText.dispose();
    super.dispose();
  }

  void _ShowSnackBar(BuildContext context){
    final snackBar = SnackBar(
      content: const Text('Name & Contact should not be empty'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Perform some action
          // For example, you can undo the operation
          // or navigate to a different page.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




  void _checkButtonStatus() {
    setState(() {
      /*_isButtonEnabled=(( partyText.text.trim().isNotEmpty &&
          contactText.text.trim().isNotEmpty )? true:false);*/
      /*_isButtonEnabled = emailText.text.isNotEmpty;
      _isButtonEnabled = passText.text.isNotEmpty;*/
      RegExp phoneNumberRegExp = RegExp(
          r'^[+]?[0-9]{1,3}[-\s.]?[(]?[0-9]{1,4}[)]?[-\s.]?[0-9]{1,6}[-\s.]?[0-9]{1,6}[-\s.]?[0-9]{1,12}$');

      _isButtonEnabled = ((partyText.text.trim().isNotEmpty &&
              contactText.text.trim().isNotEmpty)
          ? phoneNumberRegExp.hasMatch(contactText.text.trim())
          : false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Apply the desired padding here
          child: SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: partyText,
                onChanged: (_) => _checkButtonStatus(),
                enabled: true,
                decoration: InputDecoration(
                    hintText: "Enter Party Name",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 2)),
                    prefixIcon: const Icon(
                      Icons.perm_identity,
                      color: Colors.orange,
                    )),
              ),
              Container(
                height: 10,
              ),
/*
              TextField(
                controller: contactText,
                onChanged: (_) => _checkButtonStatus(),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Enter Contact Number",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 2)),
                    prefixIcon: const Icon(
                      Icons.phone_android_outlined,
                      color: Colors.orange,
                    )),
              ),
*/

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<CountryData>(
                      value: selectedCountry,
                      onChanged: (CountryData? newValue) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      },
                      underline: SizedBox(),
                      items: widget.countryDataList.map<DropdownMenuItem<CountryData>>((CountryData countryData) {
                        return DropdownMenuItem<CountryData>(
                          value: countryData,
                          child: Row(
                            children: [
                              Text(countryData.flagIcon),
                              SizedBox(width: 7.0),
                              Text('(+${countryData.stdCode})'),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(width: 246,
                      child: TextField(
                        controller: contactText,
                        onChanged: (_) => _checkButtonStatus(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter Contact Number",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.0),
                              borderSide:
                              const BorderSide(color: Colors.deepOrange, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              const BorderSide(color: Colors.blueAccent, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              const BorderSide(color: Colors.black45, width: 2)),
                          /*prefixIcon: const Icon(
                    Icons.phone_android_outlined,
                    color: Colors.orange,
                  )*/
                        ),
                      ),
                    )
                  ],
                ),

              Container(
                height: 10,
              ),
/*              ElevatedButton(

                onPressed: _isButtonEnabled ? () => _performAction() : null,
                child: Text('Button'),
              ),*/
            ],
          )),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //onPressed: () {},
        onPressed: _isButtonEnabled ? () => _performAction() : () => _ShowSnackBar(context),

        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _performAction() {
    // Perform the action when the button is pressed
    // Add your logic here
   // print('Button pressed! +${selectedCountry?.stdCode}${contactText.text.trim()}');

    _create(partyText.text.trim(),'+${selectedCountry?.stdCode}${contactText.text.trim()}');
  }
}
