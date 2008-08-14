#!/usr/bin/perl

use Test::More tests => 4;

BEGIN {
	use_ok( 'accessors::related' );
}

{
    package Something;
    use accessors qw(child);
    use accessors::related qw(parent);
    sub new { bless { name => $_[1] }, $_[0] }
}

my $child;
{
    my $parent = Something->new("parent");
       $child  = Something->new("child");
    $parent->child($child);
    $child->parent($parent);

    is($parent->child, $child);
    is($child->parent, $parent);
}
is($child->parent, undef);
