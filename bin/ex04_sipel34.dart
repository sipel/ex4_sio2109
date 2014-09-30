// importer la librairie Mathématique de DART
import 'dart:math' as math;

void main() {
  ex4_1();
  ex4_2();
  ex4_3('1989-05-12 00:00:00');
  ex4_4();
  ex4_5(16);
}

/*Print the first 10 numbers, starting with 0, of the Fibonacci sequence.
 * 
Inspire du code du projet https://github.com/dzenanr/example_console
 */
Map ex4_fibonnaci(int fibonnaci) {
  var map = new Map();
  map[0] = 0; map[1] = 1;
  int fib(int p) {
    if (!map.containsKey(p)) {
      map[p] = fib(p - 1) + fib(p - 2);
    }
    return map[p];
  }
  fib(fibonnaci);
  return map;
}

void ex4_1() {
  var q = 10;
  var map = ex4_fibonnaci(q-1);
  print('les $q premiers nombres incluant 0 de la suite de Fibonnaci :');
  map.forEach((k,v) => print('$k : $v'));
}

void ex4_2(){
  /*
   * There is a point in the center of a rectangle with the width of 800 and the height of 600 pixels (or millimeters on paper).
   *  The north-west corner of the rectangle has zero coordinates (x = 0, y = 0). Positive x numbers go towards the east of the rectangle.
   *  Positive y numbers go towards the south of the rectangle.

Draw a line on paper of the length of 160 pixels (millimeters) from the center of the rectangle under the angle of 45 degrees
 *  towards the south-east of the rectangle. This is only to help you calculate the following:

Given the center of the rectangle as the starting point and the angle of 45 degrees, calculate the end point of the line
   * 
   */
  var x0 = 0;
  var y0 = 0;
  var width = 800;
  var height = 600;
  var angle = 45;
  var length = 160;
  var radians = angle * (math.PI / 180);
  var xcenter = width/2;
  var ycenter = height/2;
  var x1 = xcenter + length * math.cos(radians);
  var y2 = ycenter + length * math.sin(radians);
  print('La ligne débute à (${(xcenter).toStringAsFixed(2)},${(ycenter).toStringAsFixed(2)}) et se termine à (${x1.toStringAsFixed(2)},${y2.toStringAsFixed(2)})');
 }

/*Calculate the time in years, months and days passed between your birthday at midnight and today at midnight.*/
void ex4_3(birthday){
  DateTime now = new DateTime.now();
  DateTime birthdate = DateTime.parse(birthday);
  DateTime format = new DateTime(now.year - birthdate.year, now.month - birthdate.month, now.day - birthdate.day);
    print('''Temps écoulé de puis ma date de naissance soit ${birthdate.toString()} et aujourd'hui :''');
  print('${format.toString()}');
}

/*Calculate a compound interest each year for 5 years, for the initial investement of 1000$
 *  with the fixed interest rate of 4.8
  */
void ex4_4() {
  num investissement = 1000;
  num interet = 0.048;
  num annees = 5;
  num interetcumule = 1;
  for (num i = 1; i <= annees ; i++){
    interetcumule *= interet + 1;
    num moneyaccumulated = investissement * interetcumule;
    print('Montant total par année ${i} :${moneyaccumulated.toStringAsFixed(1)}');
  }
}

//Calculate the first 16 terms of the 8 times table.
void ex4_5(int termes) {   
  var table = new Map();
  for(num i=1 ; i <= termes; i++){
    table[i] = 8 * i;
  }
  print('table de 8 ${table.toString()}');
}
 