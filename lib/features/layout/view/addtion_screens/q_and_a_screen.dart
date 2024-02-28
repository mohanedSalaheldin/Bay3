import 'package:e_commerce/features/layout/view_model/layout_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QaAScreen extends StatelessWidget {
  const QaAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => QandAItem(
                  answer: provider.answers[index],
                  question: provider.questions[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: provider.answers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QandAItem extends StatelessWidget {
  const QandAItem({
    super.key,
    required this.question,
    required this.answer,
  });
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.all(20.0),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: <Widget>[
            Text(
              answer,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  {
//       "question": "could I pay via cash on delivery ?",
//       "answer": "Yes, you can pay on delivery."
//     },