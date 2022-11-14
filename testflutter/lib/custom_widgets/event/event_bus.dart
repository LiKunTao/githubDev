typedef void EventCallback(arg);

class EventBus {
  //私有化构造
  // EventBus._internal();
  EventBus._init();

  //保存单例
  static EventBus _singleton = EventBus._init();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key事件名，value对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallback>>();

  // var _emap = new Map<dynamic, List<EventCallback>>();

  //  添加订阅者
  void busOn(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;
    _emap[eventName] = <EventCallback>[];
    _emap[eventName]?.add(callback);
  }

  //取消
  void busOff(eventName, List<EventCallback> callback) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (callback == null) {
      _emap[eventName] = [];
    } else {
      list.remove(callback);
    }
  }

  void emit(eventName,[arg]){
    var list=_emap[eventName];
    if (list==null) return;
    int len=list.length-1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (int i = len; i > -1; i--) {
      list[i](arg);
    }
  }
}
var bus=EventBus();