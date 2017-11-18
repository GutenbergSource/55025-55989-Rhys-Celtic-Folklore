
use strict;

my $saxon   = "java -jar ../../../../../Tools/tei2html/tools/lib/saxon9he.jar "; # (see http://saxon.sourceforge.net/)

print "Create complete XML version of Celtic Folklore...\n";

processVolume("1", "CelticFolklore1-1.0.tei");
processVolume("2", "CelticFolklore2-1.0.tei");

system ("$saxon CelticFolklore.xsl CelticFolklore.xsl > CelticFolklore.xml");

system ("perl -S tei2html.pl -h -r -v -k CelticFolklore.xml");
system ("perl -S tei2html.pl -e CelticFolklore.xml");


sub processVolume($) {
    my $volume = shift;
    my $file = shift;
    chdir "Volume $volume";
    system ("perl -S tei2html.pl -x " . $file);
    chdir "..";
}
