import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutWenku(),
    );
  }
}

class AboutWenku extends StatelessWidget {
  static const platform = const MethodChannel('aboutWenku');

  // final String appversion = await platform.invokeMethod('getAppVersion');
  TextStyle style = TextStyle(fontSize: 11,color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('关于文库',
        style: TextStyle(fontSize: 16,color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                onPressed: (){
                    print("go back");
                    platform.invokeMethod('goBack');
                }),
          ),
      backgroundColor: Colors.white, 
      body: new Center(
        child: new Flex(
          direction: Axis.vertical,
          children:[
            new Padding(
              padding: new EdgeInsets.fromLTRB(0, 87, 0, 11),
              child: Image(
                image: AssetImage("images/wk_about.png"),
                width: 80,
              ),
            ),
            Text("版本：6.3.8",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,color: Colors.grey),),
            new Expanded(
              flex: 1,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0,window.physicalSize.height/window.devicePixelRatio - 400,0,10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("进入文库即表明您同意",textAlign: TextAlign.center,style: style),
                          GestureDetector(
                            child: Text("《用户协议》",textAlign: TextAlign.center,style: style),
                            onTap: () {
                                print('点击了用户协议');
                                platform.invokeMethod('openWebView',{"url":"https://tanbi.baidu.com/home/user_protocol","title":"用户协议"});
                              }
                            ),
                            Text("和",textAlign: TextAlign.center,style: style),
                            GestureDetector(
                            child: Text("《隐私政策》",textAlign: TextAlign.center,style: style),
                            onTap: () {
                                print('点击了隐私政策');
                                platform.invokeMethod('openWebView',{"url":"https://tanbi.baidu.com/home/privacy_policy","title":"隐私政策"});
                              }
                            ),
                        ],
                      )
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text("百度文库出品",textAlign: TextAlign.center,style: TextStyle(fontSize: 9,color: Colors.grey)),
                    )
                  ],
              ),
            ),
          ],
        )
      )
    );
  }
}
