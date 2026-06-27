class RadiusTokens {
  RadiusTokens._();

  static final RadiusTokens i = RadiusTokens._();

  // ────────────────────────────────────────────────
  // Основная семантическая шкала (самый частый выбор)
  // ────────────────────────────────────────────────
  final double none = 0.0; // Нет скругления (явно)
  final double xs = 2.0; // Очень маленькое (chips, tags)
  final double sm = 4.0; // Small (inputs, small buttons)
  final double md = 8.0; // Medium/default (cards, buttons, lists)
  final double lg = 12.0; // Large (dialogs, cards, prominent elements)
  final double xl = 16.0; // Extra large (bottom sheets, hero cards)
  final double xxl = 24.0; // Очень большое (modals, drawers)
  final double full = 9999.0; // Pill / circle (аватарки, pill buttons)

  // ────────────────────────────────────────────────
  // Дополнительные точные значения (если нужна гранулярность)
  // ────────────────────────────────────────────────
  final double radius1 = 1.0; // Микро-скругление (очень тонкие границы)
  final double radius05 = 0.5; // Почти плоское, но чуть мягче none
  final double radius2 = 2.0; // = xs, но для явного использования
  final double radius3 = 3.0; // Редко, но бывает в некоторых стилях
  final double radius6 = 6.0; // Между sm и md
  final double radius10 = 10.0; // Альтернатива lg в некоторых брендах
  final double radius20 = 20.0; // Близко к Material 3 "large"
  final double radius28 = 28.0; // Material 3 extra-large / pill-like
  final double radius32 = 32.0; // Очень мягкие углы (hero)

  // ────────────────────────────────────────────────
  // Material 3 inspired scale (если следуешь M3)
  // ────────────────────────────────────────────────
  final double m3None = 0.0;
  final double m3ExtraSmall = 4.0;
  final double m3Small = 8.0;
  final double m3Medium = 12.0;
  final double m3Large = 16.0;
  final double m3ExtraLarge = 28.0;
  final double m3ExtraExtraLarge = 32.0; // или 9999 для full
}
