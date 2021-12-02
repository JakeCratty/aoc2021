import utils.FileServices;

class Day2 {
    public var solutionOne:Int;
    public var solutionTwo:Int;

    var horiz:Int;
    var depth_part1:Int;
    var depth_part2:Int;
    var aim:Int;

    var re = ~/([a-z]*)\s([0-9]*)/gi;

    static public var test:String = "forward 5
down 5
forward 8
up 3
down 8
forward 2";

    static public function run() {
        var raw = FileServices.textAsArray("input/day2.txt");
        //var raw = test.split("\n");
        return new Day2(raw);
    }

    private function new(raw:Array<String>) {
        trace("Day 2");
        this.solutionOne = 0;
        this.solutionTwo = 0;
        this.horiz = 0;
        this.depth_part1 = 0;
        this.depth_part2 = 0;
        this.aim = 0;

        for (e in raw) {
            if (re.match(e)) {
                var inst = re.matched(1);
                var amt = Std.parseInt(re.matched(2));

                switch (inst) {
                    case "forward" : {
                        this.horiz += amt;
                        this.depth_part2 += (this.aim * amt);
                    }
                    case "down" : {
                        this.depth_part1 += amt;
                        this.aim += amt;
                    }
                    case "up" : {
                        this.depth_part1 -= amt;
                        this.aim -= amt;
                    }
                    case _ : trace('Invalid instruction ${inst}');
                }

                this.solutionOne = this.horiz * this.depth_part1;
                this.solutionTwo = this.horiz * this.depth_part2;
            } else {
                trace('Entry string ${e} not matched!');
            }
        }

        trace("Part_1: " + this.solutionOne);
        trace("Part_2: " + this.solutionTwo);
    }
}
