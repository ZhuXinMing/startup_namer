import 'package:event_bus/event_bus.dart';
import 'package:startupnamer/common/event.dart';
///
///   @Name    : startup_namer/ bus_Util
///   @author  : simon
///   @date    : 2020/8/12 10:51 AM
///   @desc    :
///   @version : 1.0

class BusUtil{

  static final BusUtil _instance = BusUtil._internal();

  final EventBus _bus = EventBus();

  factory BusUtil() => _instance;

  BusUtil._internal();

  void fire(Event event){
    _bus.fire(event);
  }

  Stream<Event> on() => _bus.on<Event>();
}