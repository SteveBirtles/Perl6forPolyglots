say "\n- - - S I G I L S - - -";

say "\n\$ sigil (defines a single item variable)";

my $x = 9001;
say $x;

say "\n\@ sigil (defines a list variable)";

my @y = [2, 4, 6, 8, 10];
say @y;

say "\n\% sigil (defines a map variable)";

my %z = 1=>1, 2=>4, 3=>9, 4=>16, 5=>25;
say %z;

say "\n- - - T W I G I L S - - -";

say "\n* twigil (dynamically scoped variable)";

sub dynamic-say() { say $*d; }
my $*d = "outside";
if (True)
{	
	my $*d = "inside";
	dynamic-say();
}
dynamic-say();

say "\n. and ! twigils (public and private attributes)";

my class Point {
    has $.x is rw;	#read-write attribute
    has $.y;		#read only attribute
    has $!z;		#private attribute
    
    submethod BUILD() { $!z = 30 }

    method getZ() { $!z; }	#getter for private attribute
}

my $p = Point.new( x => 0, y => 20 );

$p.x = 10;
say $p.x;
say $p.y;
say $p.getZ();

say "\n^ twigil ()";

say "\n- - - P R E F I X   O P E R A T O R S - - -";

say "\n! operator (not / boolean negation)";

my $booleanValue = False;
say !$booleanValue;

say "\n+ and - operators (unary positive and negative)";

my $integerValue = 42;
say -$integerValue;

say "\n? operator (tests for truthyness)";

say ?$booleanValue;
say ?$integerValue;

say "\n~ operator (convert to string)";

say (~$integerValue).WHAT;

say "\n++ and -- (pre increment and decrement)";

say ++$integerValue;
say $integerValue;

say "\n^ operator (the 'up to' operator)";

say ^5;
say (^5).list;

say "\n| operator (flatten a structure into an arguement list)";

sub addThreeThings($x, $y, $z) { $x + $y + $z; }

my @collection = [5, 10, 15];

say addThreeThings(@collection[0], @collection[1], @collection[2]);
say addThreeThings(|@collection);

say "\n- - - P O S T F I X   O P E R A T O R S - - -";

say "\n++ and -- (post increment and decrement)";

say $integerValue++;
say $integerValue;

say "\n- - - I N F I X   O P E R A T O R S - - -";

say "\n+, -, * and / operators (ordinary maths operators)";

say 1 + 4;
say 5 * 10;

say "\n** operator (exponent / to the power of)";

say 2 ** 8;

say "\n% and div operators (modulus and integer division)";

say 10 % 3;
say 10 div 3;

say "\ngcd and lcm operators (greatest common divisor and lowest common multiple)";

say 100 gcd 6;
say 50 lcm 15;

say "\n~ operator (string concatination)";

say "Hello " ~ "world!";

say "\nx operator (value replication)";

say "Badger " x 12 ~ "Mushroom " x 2;

say "\nxx operator (list replication)";

say [1, 2, 3] xx 3;


say "\n<=> operator (three way comparitor)";

say 5 <=> 10;

say "\n.. operator (inclusive range)";

say 1..10;
say (1..10).list;

say "\n^.., ^..^ and ..^ (exclusive ranges)";

say 1..^10;
say (1..^10).list;

say "\n==, !=, <=, >=, < and > operators (numeric comparissons)";

say 10 == 10;

say "\neq, ne, gt, lt, ge and le operators (string comparissons)";

say "alpha" lt "beta";

say "\nbefore and after operators (generic comparissons)";

say 10 before 20;

say "\n=== operator (referencing same object)";

say $integerValue === $integerValue;

say "\n~~ operator (smart match / regex)";

say "cake 123" ~~ /\w\w\w\w/;
say "cake 123" ~~ /\d\d\d/;
say "cake 123" ~~ /\w**2/;
say "cake 123" ~~ /\d**3/;
say "cake 123" ~~ /\w+/;
say "cake 123" ~~ /\d+/;
say "cake 123" ~~ /\w+|d+/;

say "\n... operator (smart / lazy sequence)";

say 1, 2, 4 ... 256;
say 1, 3, 9 ... 6561;

say "\nmin and max operators";

say 5 min 10;
say 5 max 10;

say "\n&&, || and ^^ operators (boolean and, or and xor)";

say True && False;
say True || False;
say True ^^ False;
say True ^^ True;

say "\n?? !! operator (ternary)";

say True ?? "It's true" !! "It's false";

say "\nR operator (reverse arguements)";

say 10 / 5;
say 10 R/ 5;

say "\nZ operator (zip two lists)";

say [1, 2, 3, 4] Z [10, 20, 30, 40];

say "\nX operator (cross product of two lists)";

say [1, 2, 3, 4] X [10, 20, 30, 40];

say "\n= meta-operator (apply and assign)";

say $integerValue += 10;
say $integerValue *= 10;
say $integerValue div= 7;

say "\n[] meta-operator (reduces list using enclosed operator)";

say [+] [1, 2, 3, 4, 5];

say "\n<< >> hyper-operators (performs map using encolsed operator)";

say -<< [1, 2, 3, 4];
say ++<< [1, 2, 3, 4];

say [1, 2, 3, 4] <<+>> 10;
say [1, 2, 3, 4] <<*>> [10, 100, 1000, 10000];

say "\n-------------------------------------------\n";

say 1 + 2;
say infix:<+>(1, 2);

sub postfix:<!>(Int $x) {
	if ($x <= 1) { 
		return 1; 
	}
    else {
    	return $x * ($x - 1)!;
    }
}

say 6!;

sub infix:<^_^>(Str $x, Str $y) {
	$x ~ "-CAT-" ~ $y;
}

say "hello" ^_^ "world";

say "\n-------------------------------------------\n";

my @bigList = 1..20;

my @lessThan100 = grep({ $^a < 10 }, @bigList);
say @lessThan100;

my @evenList = grep({ $^a % 2 == 0 }, @bigList);
say @evenList;

my @doubledList = map({ $^a * 2}, @evenList);
say @doubledList;

my $totalOfList = reduce({ $^a + $^b }, @bigList);
say $totalOfList;

