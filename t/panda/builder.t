use Test;
use Panda::Builder;
use Panda::Resources;

plan 3;

my $srcdir = 'testmodules';

my $r = Panda::Resources.new(srcdir => $srcdir);
my $b = Panda::Builder.new(resources => $r);

my $p = Pies::Project.new(name => 'dummymodule');


lives_ok { $b.build($p) };

ok "$srcdir/dummymodule/blib/lib/foo.pir".IO ~~ :f, 'module compiled';
ok "$srcdir/dummymodule/blib/lib/foo.pm".IO ~~ :f, 'module copied to blib';

shell "rm -rf $srcdir/dummymodule/blib $srcdir/dummymodule/Makefile";

# vim: ft=perl6
