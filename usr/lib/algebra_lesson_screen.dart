import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class AlgebraLessonScreen extends StatelessWidget {
  const AlgebraLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تبسيط العبارات الجبرية'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Did You Know?
            _buildSectionHeader(context, 'بطاقات "هل تعلم؟"', Icons.lightbulb_outline),
            const SizedBox(height: 10),
            _buildDidYouKnowCard(
                'هل تعلم أن وحيدة الحد لا يجب أن تتضمن "قوى قوة"؟'),
            _buildDidYouKnowCard(
                'هل تعلم أن كل أساس يجب أن يظهر مرة واحدة فقط؟'),
            _buildDidYouKnowCard(
                'هل تعلم أن جميع الكسور المتضمنة يجب أن تكون في أبسط صورة؟'),
            _buildDidYouKnowCard(
                'هل تعلم أن أبسط صورة لا تتضمن أقواساً أو أسساً سالبة؟'),

            const SizedBox(height: 24),

            // Section 2: Concepts
            _buildSectionHeader(context, 'استخلاص مفاهيم الهدف', Icons.menu_book),
            const SizedBox(height: 10),
            _buildConceptItem(
              context,
              'تبسيط وحيدات الحد',
              'عملية كتابة العبارة في شكل لا يتضمن قوى قوة، يظهر فيه كل أساس مرة واحدة، تكون كسوره في أبسط صورة، ويخلو من الأقواس والأسس السالبة.',
            ),
            _buildConceptItem(
              context,
              'تعريف الأسس السالبة',
              r'a^{-n} = \frac{1}{a^n}',
              descriptionSuffix: ' (حيث المقدار يصبح مقاماً بأس موجب).',
              isMath: true,
            ),
            _buildConceptItem(
              context,
              'قسمة القوى',
              'عند قسمة قوتين لهما الأساس نفسه، نقوم بطرح الأسس.',
            ),
            _buildConceptItem(
              context,
              'قوة ناتج القسمة',
              'توزيع الأس على البسط والمقام.',
            ),
            _buildConceptItem(
              context,
              'قوة ناتج الضرب',
              'توزيع الأس على العوامل داخل القوس.',
            ),
            _buildConceptItem(
              context,
              'قوة القوة',
              'ضرب الأسس في بعضها البعض.',
            ),

            const SizedBox(height: 24),

            // Section 3: Activity
            _buildSectionHeader(context, 'نشاط تأمل وصحح الخطأ', Icons.edit_note),
            const SizedBox(height: 10),
            const ActivityWidget(),

            const SizedBox(height: 24),

            // Section 4: Explanation
            _buildSectionHeader(context, 'شرح الهدف (النظرية البنائية)', Icons.school),
            const SizedBox(height: 10),
            _buildExplanationStep(
              context,
              '1. التعامل مع الضرب والأسس السالبة',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('في المثال:'),
                  const SizedBox(height: 8),
                  Center(child: Math.tex(r'(2a^{-2})(3a^3b^2)(c^{-2})', textStyle: const TextStyle(fontSize: 18))),
                  const SizedBox(height: 8),
                  const Text('• ابدأ بضرب الأعداد الثابتة:'),
                  Center(child: Math.tex(r'2 \times 3 = 6', textStyle: const TextStyle(fontSize: 16))),
                  const Text('• اجمع أسس الأساسات المتشابهة (a⁻² مع a³).'),
                  const Text('• تذكر تعريف الأس السالب:'),
                  Row(
                    children: [
                      Math.tex(r'c^{-2}', textStyle: const TextStyle(fontSize: 16)),
                      const Text(' تصبح '),
                      Math.tex(r'\frac{1}{c^2}', textStyle: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            _buildExplanationStep(
              context,
              '2. التعامل مع القسمة',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('في العبارة:'),
                  Center(child: Math.tex(r'\frac{q^2r^4}{q^7r^3}', textStyle: const TextStyle(fontSize: 18))),
                  const SizedBox(height: 8),
                  const Text('• طبق خاصية "قسمة القوى". اطرح أسس المقام من أسس البسط.'),
                  Center(child: Math.tex(r'q^{2-7} \cdot r^{4-3} = q^{-5}r', textStyle: const TextStyle(fontSize: 16))),
                  const SizedBox(height: 8),
                  const Text('• للوصول لأبسط صورة، ننقل q⁻⁵ للمقام لتصبح:'),
                  Center(child: Math.tex(r'\frac{r}{q^5}', textStyle: const TextStyle(fontSize: 18))),
                ],
              ),
            ),
            _buildExplanationStep(
              context,
              '3. التعامل مع القوى المرفوعة لقوة',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('في العبارة:'),
                  Center(child: Math.tex(r'(\frac{-2a^4}{b^2})^3', textStyle: const TextStyle(fontSize: 18))),
                  const SizedBox(height: 8),
                  const Text('• وزع الأس 3 على البسط والمقام.'),
                  const Text('• وزع الأس على -2 و a⁴.'),
                  const Text('• استخدم "قوة القوة" بضرب الأسس 4 × 3.'),
                  const Text('• النتيجة النهائية:'),
                  Center(child: Math.tex(r'\frac{-8a^{12}}{b^6}', textStyle: const TextStyle(fontSize: 18))),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 5: Quiz
            _buildSectionHeader(context, 'اختبار تكويني', Icons.quiz),
            const SizedBox(height: 10),
            const QuizWidget(),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildDidYouKnowCard(String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.amber.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.question_mark, color: Colors.amber, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConceptItem(BuildContext context, String title, String content,
      {bool isMath = false, String? descriptionSuffix}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title:',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                if (isMath)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Math.tex(content, textStyle: const TextStyle(fontSize: 18)),
                  )
                else
                  Text(
                    content,
                    style: const TextStyle(fontSize: 16),
                  ),
                if (descriptionSuffix != null)
                  Text(
                    descriptionSuffix,
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExplanationStep(BuildContext context, String title, Widget content) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }
}

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تأمل العبارة التالية وحاول اكتشاف لماذا ليست في أبسط صورة؟',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Math.tex(
                r'\frac{6ab^2}{c^{-2}}',
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('فكر: هل وجود الأس السالب '),
              Math.tex(r'c^{-2}', textStyle: const TextStyle(fontSize: 16)),
              const Expanded(child: Text(' في المقام يجعل العبارة في أبسط صورة؟')),
            ],
          ),
          const SizedBox(height: 15),
          if (!_showAnswer)
            Center(
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _showAnswer = true),
                icon: const Icon(Icons.visibility),
                label: const Text('إظهار الإجابة والتلميح'),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الإجابة:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const Text('كلا، العبارة ليست في أبسط صورة بسبب وجود الأس السالب.'),
                  const SizedBox(height: 8),
                  const Text(
                    'القاعدة:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const Text('يجب التخلص من الأس السالب بقلب المقدار (رفعه للبسط).'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('تصبح العبارة: '),
                      Math.tex(r'6ab^2c^2', textStyle: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  // Question 1 State
  int? _q1Selected;
  bool _q1Checked = false;

  // Question 2 State
  bool? _q2Selected; // true for Correct, false for Wrong
  bool _q2Checked = false;

  // Question 3 State
  bool _q3ShowAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question 1
        _buildQuizCard(
          title: 'س1: أي مما يلي يمثل شرطاً لتكون وحيدة الحد في أبسط صورة؟',
          content: Column(
            children: [
              RadioListTile<int>(
                title: const Text('أن تتضمن أقواساً'),
                value: 0,
                groupValue: _q1Selected,
                onChanged: _q1Checked ? null : (v) => setState(() => _q1Selected = v),
              ),
              RadioListTile<int>(
                title: const Text('أن يظهر كل أساس مرة واحدة'),
                value: 1,
                groupValue: _q1Selected,
                onChanged: _q1Checked ? null : (v) => setState(() => _q1Selected = v),
              ),
              RadioListTile<int>(
                title: const Text('أن تحتوي على أسس سالبة'),
                value: 2,
                groupValue: _q1Selected,
                onChanged: _q1Checked ? null : (v) => setState(() => _q1Selected = v),
              ),
              if (_q1Checked)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _q1Selected == 1
                        ? 'إجابة صحيحة! ✅'
                        : 'إجابة خاطئة، الصحيح هو: أن يظهر كل أساس مرة واحدة.',
                    style: TextStyle(
                      color: _q1Selected == 1 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: _q1Selected == null
                      ? null
                      : () => setState(() => _q1Checked = true),
                  child: const Text('تحقق'),
                ),
            ],
          ),
        ),

        // Question 2
        _buildQuizCard(
          title: 'س2: صح أو خطأ:',
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ناتج تبسيط العبارة '),
                  Math.tex(r'\frac{q^2}{q^7}', textStyle: const TextStyle(fontSize: 16)),
                  const Text(' هو '),
                  Math.tex(r'q^5', textStyle: const TextStyle(fontSize: 16)),
                  const Text('.'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _q2Checked && _q2Selected == true ? Colors.red.shade100 : null,
                    ),
                    onPressed: _q2Checked ? null : () => setState(() {
                      _q2Selected = true;
                      _q2Checked = true;
                    }),
                    child: const Text('صح'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _q2Checked && _q2Selected == false ? Colors.green.shade100 : null,
                    ),
                    onPressed: _q2Checked ? null : () => setState(() {
                      _q2Selected = false;
                      _q2Checked = true;
                    }),
                    child: const Text('خطأ'),
                  ),
                ],
              ),
              if (_q2Checked)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        _q2Selected == false
                            ? 'أحسنت! الإجابة خطأ.'
                            : 'للأسف خطأ.',
                        style: TextStyle(
                          color: _q2Selected == false ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('التصحيح: '),
                          Math.tex(r'\frac{1}{q^5}', textStyle: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Question 3
        _buildQuizCard(
          title: 'س3: أكمل الحل لتبسيط العبارة:',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Math.tex(r'(\frac{a}{4})^{-3}', textStyle: const TextStyle(fontSize: 18))),
              const SizedBox(height: 10),
              const Text('باستخدام تعريف الأس السالب، نقوم بقلب الكسر لتصبح العبارة:'),
              const SizedBox(height: 10),
              if (_q3ShowAnswer)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  color: Colors.green.shade50,
                  child: Center(
                    child: Math.tex(
                      r'(\frac{4}{a})^3',
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                )
              else
                Center(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _q3ShowAnswer = true),
                    child: const Text('إظهار الإجابة'),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuizCard({required String title, required Widget content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }
}
