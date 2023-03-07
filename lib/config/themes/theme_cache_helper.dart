import 'package:comments_with_clean_architecture/core/strings/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheThemeIndex(int themeIndex) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(AppStrings.themeIndex, themeIndex);
  }

  Future<int> getCachedThemeIndex() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final cachedThemeIndex = preferences.getInt(AppStrings.themeIndex);
    if (cachedThemeIndex != null) {
      return cachedThemeIndex;
    } else {
      return 0;
    }
  }
}
