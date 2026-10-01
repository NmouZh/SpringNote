import 'package:flutter_test/flutter_test.dart';
import 'package:spring_note/core/models/app_config.dart';

void main() {
  test('reportImageInputEnabled 默认开启并参与序列化往返', () {
    final defaults = AppConfig.defaults();
    expect(defaults.reportImageInputEnabled, isTrue);

    final restored = AppConfig.fromJson(defaults.toJson());
    expect(restored.reportImageInputEnabled, isTrue);
  });

  test('reportImageInputEnabled 缺失时回退为 true，copyWith 可关闭', () {
    final restored = AppConfig.fromJson(const <String, Object?>{});
    expect(restored.reportImageInputEnabled, isTrue);

    final disabled = AppConfig.defaults().copyWith(
      reportImageInputEnabled: false,
    );
    expect(disabled.reportImageInputEnabled, isFalse);
    expect(AppConfig.fromJson(disabled.toJson()).reportImageInputEnabled, isFalse);
  });

  test('desktopWidgetAlwaysOnTop 默认置顶并参与序列化往返', () {
    final defaults = AppConfig.defaults();
    expect(defaults.desktopWidgetAlwaysOnTop, isTrue);

    final restored = AppConfig.fromJson(defaults.toJson());
    expect(restored.desktopWidgetAlwaysOnTop, isTrue);
  });

  test('desktopWidgetAlwaysOnTop 缺失时回退为 true，copyWith 可关闭', () {
    final restored = AppConfig.fromJson(const <String, Object?>{});
    expect(restored.desktopWidgetAlwaysOnTop, isTrue);

    final nonTopmost = AppConfig.defaults().copyWith(
      desktopWidgetAlwaysOnTop: false,
    );
    expect(nonTopmost.desktopWidgetAlwaysOnTop, isFalse);
    expect(
      AppConfig.fromJson(nonTopmost.toJson()).desktopWidgetAlwaysOnTop,
      isFalse,
    );
  });
}
