import 'package:flutter_test/flutter_test.dart';
import '../lib/features/diary/domain/diary_content_codec.dart';

void main() {
  test('decode extracts image tokens and strips object replacement chars', () {
    const raw = '今天记录\n[[img:%2Ftmp%2Fa.jpg]]\n\uFFFC\n[[img:%2Ftmp%2Fb.jpg]]';

    final decoded = DiaryContentCodec.decode(raw);

    expect(decoded.text, '今天记录');
    expect(decoded.imagePaths, ['/tmp/a.jpg', '/tmp/b.jpg']);
  });

  test('encode strips object replacement chars from text', () {
    final encoded = DiaryContentCodec.encode(
      text: 'hello\uFFFCworld',
      imagePaths: ['/tmp/a.jpg'],
    );

    expect(encoded, 'helloworld\n[[img:%2Ftmp%2Fa.jpg]]');
  });

  test('decode accepts legacy mg token and malformed encoded path safely', () {
    const raw = '正文\n[[mg:/tmp/legacy.jpg]]\n[[img:%E0%A4%A]]';

    final decoded = DiaryContentCodec.decode(raw);

    expect(decoded.text, '正文');
    expect(decoded.imagePaths, ['/tmp/legacy.jpg', '%E0%A4%A']);
  });
}
