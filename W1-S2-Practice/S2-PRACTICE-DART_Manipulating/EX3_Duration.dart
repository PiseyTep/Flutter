class MyDuration {
  final int _milliseconds;
// Constructor 
  MyDuration._(this._milliseconds); 
  factory MyDuration.fromHours(int hours) {
    return MyDuration._(hours * 60 * 60 * 1000); 
  }
  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration._(minutes * 60 * 1000); 
  }

  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration._(seconds * 1000); 
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }
  MyDuration operator +(MyDuration other) {
    return MyDuration._(_milliseconds + other._milliseconds);
  }
  MyDuration operator -(MyDuration other) {
    if (_milliseconds - other._milliseconds < 0) {
      throw Exception('Resulting duration is negative');
    }
    return MyDuration._(_milliseconds - other._milliseconds);
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return 'Duration: ${_milliseconds}ms ($hours hours, $minutes minutes, $seconds seconds)';
  }
}
void main() {
  MyDuration duration1 = MyDuration.fromHours(1); 
  MyDuration duration2 = MyDuration.fromMinutes(1); 

  print(duration1 + duration2); 
  print(duration1 > duration2); 

  try {
    print(duration2 - duration1); 
  } catch (e) {
    print(e); 
  }
}
