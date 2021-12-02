import utils.FileServices;

class Day1 {
    public var solutionOne:Int;
    public var solutionTwo:Int;

    var values:Array<Int>;
    var sums:Array<Int>;

    static public var test:String = "199
    200
    208
    210
    200
    207
    240
    269
    260
    263";

    static public function run() {
        var raw = FileServices.textAsArray("input/day1.txt");
        //var raw = test.split("\n");
        return new Day1(raw);
    }

    private function new(raw:Array<String>) {
        this.solutionOne = 0;
        this.solutionTwo = 0;
        this.values = [];
        this.sums = [];

        // Part 1
        for (e in raw) {
            this.values.push(Std.parseInt(e));
        }

        for (i in 1...this.values.length) {
            if (this.values[i] > this.values[i-1])
                this.solutionOne++;
        }
        trace("Part_1: " + solutionOne);

        // Part 2
        var i = 2;
        while (i < this.values.length) {
            var v1 = this.values[i-2];
            var v2 = this.values[i-1];
            var v3 = this.values[i];

            this.sums.push(v1 + v2 + v3);
            i += 1;
        }

        for (i in 1...this.sums.length) {
            if (this.sums[i] > this.sums[i-1]) {
                this.solutionTwo++;
            }
        }
        trace("Part_2: " + solutionTwo);
    }
}
