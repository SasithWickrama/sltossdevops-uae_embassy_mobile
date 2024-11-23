import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DocumentService extends StatefulWidget {
  const DocumentService({super.key});

  @override
  State<DocumentService> createState() => _DocumentServiceState();
}

class _DocumentServiceState extends State<DocumentService> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Document Attestation"),
          backgroundColor: Colors.lightBlue,
        ),
        body:  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text("Passport Service",style: TextStyle(fontSize: 22,decoration: TextDecoration.underline),),
            SizedBox(height: 15,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/wp-content/uploads/2020/10/New_Passport_Application_Form_K35.pdf',
                  );
                },
                child: Text("Passport Application-I.E.35_A   K Form",style: TextStyle(color: Colors.blue,fontSize: 18,),)),
            SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/downloads/consular/Passport_Photo_Requirment.pdf',
                  );
                },
                child: Text("Specifications on Photographs",style: TextStyle(color: Colors.blue,fontSize: 18,))),
            SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/downloads/consular/Passport_Amendments.pdf',
                  );
                },
                child: Text("Application for Amending a Sri Lankan Travel Document",style: TextStyle(color: Colors.blue,fontSize: 18,),)),
            SizedBox(height: 20,),
            Text("Birth Service",style: TextStyle(fontSize: 22,decoration: TextDecoration.underline),),
            SizedBox(height: 15,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://www.embassyofsrilankauae.com/wp-content/uploads/2018/07/Declaration-16-Registration-B-Form-Applying-within-03-months..pdf',
                  );
                },
                child: Text("Declaration 16-Registration B Form -(Applying within 03 months.)",style: TextStyle(color: Colors.blue,fontSize: 18,),)),
            SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/downloads/consular/Birth_Registration_After_3Months.pdf',
                  );
                },
                child: Text("Declaration 24-Registration B6 Form- (Applying after 03 months and within one year)",style: TextStyle(color: Colors.blue,fontSize: 18,),)),
            SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/downloads/consular/Citizenship_Application.pdf',
                  );
                },
                child: Text("Application for Registration of Birth- under the Ceylon Citizenship Act",style: TextStyle(color: Colors.blue,fontSize: 18,),)),
            SizedBox(height: 20,),
            Text("Marriage Service",style: TextStyle(fontSize: 22,decoration: TextDecoration.underline),),
            SizedBox(height: 15,),
            InkWell(
                onTap: (){
                  FileDownloader.downloadFile(
                    url: 'https://embassyofsrilankauae.com/downloads/consular/Notice_of_Marriage.pdf',
                  );
                },
                child: Text("Notice of Marriage",style: TextStyle(color: Colors.blue,fontSize: 18,),)),



          ],
        ),
        ),
      ),
    );
  }
}
