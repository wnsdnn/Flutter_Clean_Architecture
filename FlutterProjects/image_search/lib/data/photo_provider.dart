import 'package:flutter/material.dart';
import 'package:image_search/screen/home_view_model.dart';

// InheritedWidget - 어떤 위젯트리에도 원하는 데이터를 꽃아줄수 있는 방법을 제공함 (상태관리)
// 생성자로 계속 주기에는 위젯트리가 많아 졌을때 복잡해지기 때문에 InheritedWidget을 사용
class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  PhotoProvider({
    required super.child,
    required this.viewModel,
  });

  // InheritedWidget 문서에 있는 코드를 그대로 작성함
  // context - 위젯 트리의 정보를 가지고 있는 객체
  // 위젯 트리 근처에서 가장 가까운 PhotoProvider 객체를 반환해주는 코드
  // 만약의 없으면 메시지 반환
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();

    // assert - 앞에 조건이 안 맞으면 실행 (코드 상에서는 null이면 실행)
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  // PhotoProvider가 변경이 되면 다시 전달을 해줘야 하는데 어떨때 다시 전달 해줄건지 규칙을 정하는 곳
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
