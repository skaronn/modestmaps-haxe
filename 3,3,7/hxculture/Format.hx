package hxculture;

class Format {
	static var re = ~/{(\d+)(?::([a-zA-Z]+))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?}/m;
	/**
	* Take a string pattern and replaces the placeholders with the value contained in values.
	* The culture parameter is needed for proper localization of numeric and date values.
	* Placeholders follows this schema:
<pre>
{pos[:format][,param]*}
</pre>
	* <em>pos</em> is the position in the array
	* <em>format</em> is a string sequence that identifies a specific value format (see below)
	* <em>param</em> is one or more optional parameters specific to certain format values.
	*
	* <pre>
Numeric Formats
---------------
D (default) Decimal format. The default number of decimals is set by culture. This value can overriden
            using the length parameter.
I           Integer format.
C           Currency format. The default number of decimals is set by culture. This value can overriden
            using the length parameter. The symbol can be overridden appending a string value after C
			Ei. "{0:C,3,USD}" will print something like "USD2.000" instead of "$2.00"
P           Percent format.
M           Permille format.

Date Formats
---------------
D (default) Date format.
DS          Short Date format.
DST         Short date / long time format.
DSTS        Short date / short time format.
DT          Long date / long time format.
DTS         Long date / short time format.
Y           Year format.
YM          Year Month format.
M           Month format.
MN          Month name format.
MS          Short Month name format.
MD          Month Day format.
WD          Week day format.
WDN         Week day name format.
WDS         Short week day name format.
R           RFC Date format.
DT          Date Time format.
U           Universal format.
S           Sortable format.
T           Time format.
TS          Short Time format.

TODO:
List Formats
---------------
J           Joins the elements of the list. The first parameter is the separator.
            The second optional parameter is the maximum number of values to show
			(default to nolimit). The third parameter the ellipsis for not
			included values (defaults to '...')
C           Concats the elements of the list
String Formats
---------------
T           Truncate. First parameter is the length to trim, second is the ellipsis
			(optional parameter, defaults to '...')
PL          Pad left. First parameter is the length, second is filling char
			(optional parameter, defaults to ' ')
PR          Pad right. First parameter is the length, second is filling char
			(optional parameter, defaults to ' ')

Other things to do. Nested placeholders
</pre>
	*/
	public static function string(pattern : String, values : Array<Dynamic>, culture : Culture, nullstring = 'null') {
		var buf = new StringBuf();
		while(true) {
			if(!re.match(pattern)) {
				buf.add(pattern);
				break;
			}

			var pos = Std.parseInt(re.matched(1));
			var format = re.matched(2);
			var params = [];
			var p = null;
			var i = 3;
			while(true) {
				var p = re.matched(i);
				if(p == null)
					break;
				if(p.charAt(0) == "'")
					p = p.substr(1, p.length-2);
				params.push(p);
				i++;
			}
			pattern = re.matchedRight();
			buf.add(re.matchedLeft());
			var v : Dynamic = values[pos];
			switch(Type.typeof(v)) {
				case TNull:
					buf.add(nullstring);
				case TInt, TFloat:
					buf.add(formatNumber(v, format, params, culture));
				case TClass(c):
					if(c == String) {
						buf.add(v);
					} else if(c == Date) {
						buf.add(formatDate(v, format, params, culture));
					} else {
						buf.add(Std.string(v));
					}
				default:
					throw "Unsupported format: " + Type.typeof(v);
			}
		}
		return buf.toString();
	}

	static function formatDate(d : Date, format = 'D', params : Array<String>, culture : Culture) {
		switch(format) {
			case 'D':
				return FormatDate.date(d, culture);
			case 'DS':
				return FormatDate.dateShort(d, culture);
			case 'DST':
				return FormatDate.dateShort(d, culture)+' '+FormatDate.time(d, culture);
			case 'DSTS':
				return FormatDate.dateShort(d, culture)+' '+FormatDate.timeShort(d, culture);
			case 'DTS':
				return FormatDate.date(d, culture)+' '+FormatDate.timeShort(d, culture);
			case 'Y':
				return FormatDate.year(d, culture);
			case 'YM':
				return FormatDate.yearMonth(d, culture);
			case 'M':
				return FormatDate.month(d, culture);
			case 'MN':
				return FormatDate.monthName(d, culture);
			case 'MS':
				return FormatDate.monthNameShort(d, culture);
			case 'MD':
				return FormatDate.monthDay(d, culture);
			case 'WD':
				return FormatDate.weekDay(d, culture);
			case 'WN':
				return FormatDate.weekDayName(d, culture);
			case 'WS':
				return FormatDate.weekDayNameShort(d, culture);
			case 'R':
				return FormatDate.dateRfc(d, culture);
			case 'DT':
				return FormatDate.dateTime(d, culture);
			case 'U':
				return FormatDate.universal(d, culture);
			case 'S':
				return FormatDate.sortable(d, culture);
			case 'T':
				return FormatDate.time(d, culture);
			case 'TS':
				return FormatDate.timeShort(d, culture);
			default:
				throw "Unsupported date format: " + format;
		}
	}

	static function formatNumber(v : Float, format = 'D', params : Array<String>, culture : Culture) {
		var f = format.charAt(0);
		var length : Null<Int> = params.length > 0 ? Std.parseInt(params[0]) : null;

		switch(f) {
			case 'D':
				return FormatNumber.decimal(v, culture, length);
			case 'I':
				return FormatNumber.int(v, culture);
			case 'C':
				var s = params.length > 1 ? params[1] : null;
				return FormatNumber.currency(v, culture, s, length);
			case 'P':
				return FormatNumber.percent(v, culture, length);
			case 'M':
				return FormatNumber.permille(v, culture, length);
			default:
				throw "Unsupported number format: " + format;
		}
	}
}