class RadiusTokens {
  RadiusTokens._();

  static final RadiusTokens i = RadiusTokens._();

  // ────────────────────────────────────────────────
  // Основная семантическая шкала (самый частый выбор)
  // ────────────────────────────────────────────────
  final double none = 0; // Нет скругления (явно)
  final double xs = 2; // Очень маленькое (chips, tags)
  final double sm = 4; // Small (inputs, small buttons)
  final double md = 8; // Medium/default (cards, buttons, lists)
  final double lg = 12; // Large (dialogs, cards, prominent elements)
  final double xl = 16; // Extra large (bottom sheets, hero cards)
  final double xxl = 24; // Очень большое (modals, drawers)
  final double full = 9999; // Pill / circle (аватарки, pill buttons)

  // ────────────────────────────────────────────────
  // Дополнительные точные значения (если нужна гранулярность)
  // ────────────────────────────────────────────────
  final double radius1 = 1; // Микро-скругление (очень тонкие границы)
  final double radius05 = 0.5; // Почти плоское, но чуть мягче none
  final double radius2 = 2; // = xs, но для явного использования
  final double radius3 = 3; // Редко, но бывает в некоторых стилях
  final double radius6 = 6; // Между sm и md
  final double radius10 = 10; // Альтернатива lg в некоторых брендах
  final double radius20 = 20; // Близко к Material 3 "large"
  final double radius28 = 28; // Material 3 extra-large / pill-like
  final double radius32 = 32; // Очень мягкие углы (hero)

  // ────────────────────────────────────────────────
  // Material 3 inspired scale (если следуешь M3)
  // ────────────────────────────────────────────────
  final double m3None = 0;
  final double m3ExtraSmall = 4;
  final double m3Small = 8;
  final double m3Medium = 12;
  final double m3Large = 16;
  final double m3ExtraLarge = 28;
  final double m3ExtraExtraLarge = 32; // или 9999 для full
}
