import utils.FileServices;

using StringTools;

class Day3 {
    public var solutionOne:Int;
    public var solutionTwo:Int;

    var bgamma:StringBuf;
    var bepsilon:StringBuf;

    var gamma:Int;
    var epsilon:Int;

    var O2:Int;
    var CO2:Int;

    static public var test:String = "00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010";

    static public function run() {
        var raw = FileServices.textAsArray("input/day3.txt");
        //var raw = test.split("\n");
        return new Day3(raw);
    }

    private function new(raw:Array<String>) {
        trace("Day 3");
        this.solutionOne = 0;
        this.solutionTwo = 0;
        this.gamma = 0;
        this.epsilon = 0;
        this.O2 = 0;
        this.CO2 = 0;
        this.bgamma = new StringBuf();
        this.bepsilon = new StringBuf();

        var o2List:Array<String> = raw;
        var co2List:Array<String> = raw;

        var totLength = raw.length;
        var blength = raw[0].length;

        // Part 1
        for (i in 0...blength) {
            var counter = 0;
            for (e in raw) {
                if (e.charAt(i) == "1") {
                    counter++;
                }
            }

            // more 1's than 0's
            if (counter >= (totLength - counter)) {
                this.bgamma.add("1");
                this.bepsilon.add("0");
            } else {
                this.bgamma.add("0");
                this.bepsilon.add("1");
            }
        }



        this.gamma = this.toBase10(this.bgamma.toString());
        this.epsilon = this.toBase10(this.bepsilon.toString());
        this.solutionOne = this.gamma * this.epsilon;

        trace("Part_1: " + this.solutionOne);

        // Part 2
        this.O2 = this.toBase10(this.filterList(o2List, "1", "0"));
        this.CO2 = this.toBase10(this.filterList(co2List, "0", "1"));
        this.solutionTwo = this.O2 * this.CO2;

        trace("Part_2: " + this.solutionTwo);
    }

    private function filterList(list:Array<String>, val_1:String, val_2:String):String {
        var i = 0;
        while (list.length > 1 && i < list[0].length) {
            var counter = 0;
            for (e in list)
                if (e.charAt(i) == "1") counter++;

            if (counter >= (list.length - counter))
                list = list.filter((s) -> {return s.charAt(i) == val_1;});
            else
                list = list.filter((s) -> {return s.charAt(i) == val_2;});

            i++;
        }
        return list.shift();
    }

    private inline function toBase10(bits:String):Int {
        var ret = 0;
        for (i in 0...bits.length) {
            ret = (ret * 2) + Std.parseInt(bits.charAt(i));
        }
        return ret;
    }
}
