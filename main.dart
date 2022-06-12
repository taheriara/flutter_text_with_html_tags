import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const htmlData = """
<p>
    اگر کسی بخواهد بصورت <span>دائمی</span> از ادعیه ای استفاده کند که تقریباً حاجت خواستن و <span>رفع و دفع گرفتاری‌ها</span> و مواردی از این دست را به همراه داشته باشد، می تواند از <a href="https://almiqat.com/Post/Item/19">برنامه دهگانه هفتگی</a> که از دل <span>مفاتیح</span> الجنان و مفاتیح نوین به دست آمده استفاده کند.
   <br /> <a href="https://almiqat.com/">موسسه میقات القرآن</a>
</p>
<div class="raw-html-embed">
    <a href="https://almiqat.com/Post/Item/19"><img src="https://almiqat.com/Images/public/a580d29f-52c1-4a01-841a-6f81c85ef39b.jpg" alt="برنامه دهگانه هفتگی"></a>
</div>
""";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Html(
                data: htmlData,
                style: {
                  "body": Style(
                    fontFamily: 'Sahel FD',
                    fontSize: const FontSize(14),
                    lineHeight: LineHeight.number(1.6),
                  ),
                  "span": Style(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                },
                // onLinkTap: (url, _, __, ___) {
                //   print("Opening $url");
                // },
                onLinkTap: (String? url,
                    RenderContext context,
                    Map<String, String> attributes,
                    dom.Element? element) async {
                  // launch URL in browser
                  if (!await launchUrl(Uri.parse('$url'))) {
                    throw 'Could not launch $url';
                  }
                }),
          ),
        ),
      ),
    );
  }
}
