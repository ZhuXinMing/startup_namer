///
///   @Name    : startup_namer/ event
///   @author  : simon
///   @date    : 2020/8/12 10:55 AM
///   @desc    :
///   @version : 1.0

class Event{
  String tag;
  dynamic obj;

  Event(this.tag,{this.obj});

  T asT<T>(){
    return obj as T;
  }

  Event.from(this.tag);

  Event.fromObj(this.tag, this.obj);
}