import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/model/hadeth.dart';

class HadethItem extends StatefulWidget {
  final int index;
  Hadeth?hadeth;
 HadethItem({super.key,required this.index});


  @override
  State<HadethItem> createState() => _HadethItemState();

}

class _HadethItemState extends State<HadethItem> {

  Hadeth?hadeth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadHadethFile(widget.index);
  }
  Future<void> loadHadethFile(int index) async {

    String fileContent = await rootBundle.loadString(
      'assets/files/hadeeth$index.txt',
    );
    List<String> hadeethlines = fileContent.split("\n");
    String title= hadeethlines[0];
    String content='';
    for(int i=0;i<hadeethlines.length;i++){
      content+=hadeethlines[i];

    }
    Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      hadeth=Hadeth(title: title, content: content);

    });

    // another way do the same
    // int fileIndex=fileContent.indexOf('/n');
    // String title=fileContent.substring(0,fileIndex);
    // // String content=fileContent.substring(fileIndex+1);
    // Hadeth(title: '', content: '');



  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),

      ),
      child:hadeth==null?
          Center(
            child: CircularProgressIndicator(
              color: AppColors.blackBg,
            ),
          )
          :

      Column(
        children: [
          Text(hadeth?.title??'',style: AppStyles.bold24Black,),
          Text(hadeth?.content??'',style: AppStyles.bold16Black,),

        ],
      ),
    );

  }
}

