#!/usr/bin/perl 

use strict; 
use HTML::TableExtract;
#get the number of listeners on a icecast stream 
#(find out total bytes later) 

my $staturl = qq~http://stream.kpsu.org:8080/~;
my $user = 'kpsu'; 
my $pass = 'poop'; 
my $stream = "kpsu"; 
my $uptime = '420 days'; 

my $listeners = 0; 
my $sources = 0; 

#get listeners 
use LWP::UserAgent; 
my $ua = LWP::UserAgent->new; 
my $req = HTTP::Request->new(GET => $staturl); 
#$req->authorization_basic($user, $pass); 
my $stats = $ua->request($req)->as_string; 
#$stats =~ /<listeners>(\d+)<\/listeners>/; 
#$listeners = $1;  
#$stats =~ /<sources>(\d+)<\/sources>/; 
#$sources = $1; 
#if (!$listeners) {$listeners = 0;} 
#if (!$sources) {$sources = 0;} 

#my $tme = timelocal();

my $te = new HTML::TableExtract( count => 2);
$te->parse($stats);


foreach my $table ( $te->tables ) { 
    foreach my $row ($table->rows) {
        print "   ", join(' ', @$row), "\n";
    }
}

#print qq~$stats\n~;

#get uptime 
#use Date::Manip; 
#my $stuff = `ps --no-headers -C icecast -o pid,fname,lstart --sort lstart`; 
#my @stuff = split(/\n/,$stuff); 
#$stuff[0] =~ /icecast\s+(.*?)$/gi; 
#my $start = ParseDate($1); 
#my $now = ParseDate("Now"); 
#my $delta = DateCalc($start,$now); 
#$uptime = Delta_Format($delta,0,"%dh days %hv hours"); 

#print qq~$listeners\n$sources\n$uptime\n$stream\n~; 
exit; 