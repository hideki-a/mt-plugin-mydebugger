package MyDebugger;

use strict;

sub doLog {
    use Data::Dumper;

    local $Data::Dumper::Sortkeys = 1;
    local $Data::Dumper::Indent = 1;
    local $Data::Dumper::Terse = 1;

    my ($msg, $use_dumper) = @_; 
    return unless defined($msg);

    my ($sec, $min, $hour, $day, $month, $year, $wday, $yday, $isdst) = localtime(time);
    my $date = sprintf("%04d/%02d/%02d %02d:%02d:%02d",
                   $year + 1900, $month + 1, $day, $hour, $min, $sec);

    open  FH, ">>mt_debug.log";
    print FH "$date\n";
    if ($use_dumper) {
        my $dump_msg = Dumper $msg;
        print FH "$dump_msg\n";
    } else {
        print FH "$msg\n";
    }
    close FH;
}

1;
