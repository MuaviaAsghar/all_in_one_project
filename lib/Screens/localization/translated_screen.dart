import 'package:flutter_localization/flutter_localization.dart';

List<MapLocale> LOCALES = [
  const MapLocale("en", LocaleData.EN),
  const MapLocale("de", LocaleData.DE),
  const MapLocale("fr", LocaleData.FR),
  const MapLocale("ps", LocaleData.PS),
  MapLocale("ur", LocaleData.UR)
];

mixin LocaleData {
  static const String translationScreenTitle = 'Translation';
  static const String translatedScreenText =
      'Once upon a time, in a small village, there was a wise old man who knew the secrets of the stars. People came from far and wide to seek his counsel. He always greeted them with a warm smile and a cup of tea, ready to share his wisdom.';
  static const Map<String, dynamic> EN = {
    translationScreenTitle: 'Translation',
    translatedScreenText:
        'Once upon a time, in a small village, there was a wise old man who knew the secrets of the stars. People came from far and wide to seek his counsel. He always greeted them with a warm smile and a cup of tea, ready to share his wisdom.'
  };

  static const Map<String, dynamic> DE = {
    translationScreenTitle: 'Übersetzung',
    translatedScreenText:
        'Er was eens, in een klein dorp, een wijze oude man die de geheimen van de sterren kende. Mensen kwamen van heinde en verre om zijn raad te zoeken. Hij begroette hen altijd met een warme glimlach en een kop thee, klaar om zijn wijsheid te delen.'
  };
  static const Map<String, dynamic> FR = {
    translationScreenTitle: 'Traduction',
    translatedScreenText:
        'Il était une fois, dans un petit village, un vieil homme sage qui connaissait les secrets des étoiles. Les gens venaient de loin pour solliciter ses conseils. Il les accueillait toujours avec un sourire chaleureux et une tasse de thé, prêt à partager sa sagesse.'
  };
  static const Map<String, dynamic> PS = {
    translationScreenTitle: 'ژباړه',
    translatedScreenText: '''
یو وخت، په یوه وړوکي کلي کې، یو هوښیار سپین ږیری و چې د ستورو رازونه یې پېژندل. خلک د لیرې او نږدې څخه د ده مشورې اخيستلو لپاره راتلل. هغه به هغوی ته تل په تودې مسکا او د چای په پیاله ښه راغلاست ویل، د خپلې پوهې د شریکولو لپاره چمتو و.'''
  };
  static Map<String, dynamic> UR = {
    translationScreenTitle: 'ترجمہ',
    translatedScreenText:
        'ایک دفعہ کا ذکر ہے، ایک چھوٹے سے گاؤں میں، ایک دانا بوڑھا آدمی تھا جو ستاروں کے راز جانتا تھا۔ لوگ دور دراز سے اس کے مشورے لینے آتے تھے۔ وہ ہمیشہ انہیں گرمجوشی سے مسکراہٹ اور ایک کپ چائے کے ساتھ خوش آمدید کہتا تھا، اپنی دانشمندی بانٹنے کے لیے تیار رہتا تھا۔'
  };
}
