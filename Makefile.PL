use strict;
use ExtUtils::MakeMaker;

my $is_devel_host = defined $ENV{USER} && $ENV{USER} eq 'eserte' && $^O =~ /bsd/i && -f "../../perl.release.mk";

WriteMakefile(
    NAME                => 'accessors::related',
    AUTHOR              => 'Slaven Rezic <srezic@cpan.org>',
    VERSION_FROM        => 'lib/accessors/related.pm',
    ABSTRACT_FROM       => 'lib/accessors/related.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'accessors'  => 0,
    },
);

sub MY::postamble {
    my $postamble = '';

    if ($is_devel_host) {
	$postamble .= <<'EOF';

.include "../../perl.release.mk"
.include "../../perl.cvs.mk"

EOF
    }

    $postamble;
}
