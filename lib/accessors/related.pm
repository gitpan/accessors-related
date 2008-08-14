package accessors::related;

use strict;
use base qw(accessors);

use Scalar::Util qw();

our $VERSION = '0.00_50';

sub create_accessor {
    my($class, $accessor, $property) = @_;
    $property = "-$property";
    no strict 'refs';
    *{$accessor} = sub {
	if (@_ > 1) {
	    $_[0]->{$property} = $_[1];
	    Scalar::Util::weaken($_[0]->{$property});
	    $_[0];
	} else {
	    $_[0]->{$property}
	}
    };

}

1;

__END__

=head1 NAME

accessors::related - weak accessors 

=head1 SYNOPSIS

    use accessors::related qw(foo bar);

    $obj->foo(...);
    $obj->bar(...);

=head1 DESCRIPTION

The B<accessors::related> pragma lets you create accessors which are
suitable for non-possesing relationships. Or, technically, accessors,
which are automatically marked as weak references.

This is useful to avoid circular references and thus possible memory
leaks.

=head1 AUTHOR

Slaven Rezic

=head1 COPYRIGHT & LICENSE

Copyright 2008 Slaven Rezic, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 SEE ALSO

L<accessors>, L<Scalar::Util>.

=cut
