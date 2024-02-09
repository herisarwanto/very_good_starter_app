import 'package:very_good_starter_app/app/app.dart';
import 'package:very_good_starter_app/bootstrap.dart';
import 'package:very_good_starter_app/common/utils/constant.dart';

void main() {
  bootstrap(() => const App(), environment: AppConstant.staging);
}
