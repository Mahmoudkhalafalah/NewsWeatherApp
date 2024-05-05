import 'package:flutter/material.dart';
import '../models/article_model.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({Key? key, required this.articleModel}) ;

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          articleModel.image != null?
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articleModel.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ):ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://th.bing.com/th/id/OIP.aV3_1sg9QEdADlu5byNWbwAAAA?w=222&h=180&c=7&r=0&o=5&pid=1.7",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        if (articleModel.subTitle != null)
          Text(
            articleModel.subTitle!,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/article_model.dart';

// class NewsTitle extends StatelessWidget {

// const NewsTitle ({super.key, required this.articleModel });

// final ArticleModel articleModel ;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min ,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(6),
//           child: Image.network(
//             articleModel.image! ,
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,

//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Text(
//           articleModel.title,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style:const TextStyle(
//             color: Colors.black87,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//          Text(
//           articleModel.subTitle ??'',
//           maxLines: 2,
//           style: const TextStyle(
//             color: Colors.grey,
//             fontSize: 14,
//           ),
//         ),
//       ],
//     );
//   }
// }
