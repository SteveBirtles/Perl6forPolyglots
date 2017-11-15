
sub infix:<plus>(Int $x, Int $y) { $x + $y; };
say 21 plus 1;            
 

sub postfix:<factorial>(Int $x where { $x >= 0 }) { [*] 1..$x };
say 6factorial;                     

sub circumfix:<s e>(*@elems) {
    @elems
}
say s 'a', 'b', 'c' e;  