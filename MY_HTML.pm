package MY_HTML;
use strict;
use warnings;
use Exporter;

our @ISA= qw( Exporter );

# these are exported by default.
our @EXPORT = qw( print_top print_bottom print_form );

sub print_top {   # subroutine emits top of html document
   my ($title, $header, $stylesheet, $backlink) = @_;
   print "Content-type: text/html\n\n";
   print "<!DOCTYPE html>\n";
   print "<html>\n";
   print "<head>\n";
   print "<meta name='viewport' content='width=device-width, initial-scale=1.0'>\n";
   print "<link rel='stylesheet' media='all' href='$stylesheet'>\n";
   print "<title>$title</title>\n";
   print "</head>\n";
   print "<body>\n";
   print "<header><p>$header</p></header>\n";
   print "<p></p>\n";
   if ( defined($backlink) && $backlink ne "" ) {
      print "<div><a href='/index.php'>Home</a> | <a href='$backlink'>Back</a></div>\n";
   } else {
      print "<div><a href='/index.php'>Home</a></div>\n";
   }   
   print "<p></p>\n";
}

sub print_bottom {   # subroutine emits bottom of html document
   my ($footer, $backlink) = @_;
   print "<p></p>\n";
   if ( defined($backlink) && $backlink ne "" ) {
      print "<div><a href='/index.php'>Home</a> | <a href='$backlink'>Back</a></div>\n";
   } else {
      print "<div><a href='/index.php'>Home</a></div>\n";
   }   
   print "<p></p>\n";
   print "<footer><p>$footer</p></footer>\n";
   print "</body>\n";
   print "</html>\n";
}

sub print_form {  # subroutine prints hash based html form
   my ($action, %field_hash) = @_;
   # print out the form
   print "<form action='$action' method='POST'>\n";
   foreach my $key (sort keys %field_hash) {
      my $label = $field_hash{$key}[0];
      my $type = $field_hash{$key}[1];
      my $name = $field_hash{$key}[2];
      my $value = $field_hash{$key}[3];
      if ($type eq 'submit') {
         print "<input type='$type' name='$name'>\n";
      } elsif ($type eq 'radio') {
         my $status = $field_hash{$key}[4];
         print "<div><label>$label</label><input type='$type' name='$name' value='$value' $status></div>\n";
      } elsif ($type eq 'textarea') {
         print "<label>$label</label><div><$type name='$name' rows='12' cols='80'>$value</textarea></div>\n";
      } else {
         print "<label>$label</label><div><input type='$type' name='$name' value='$value'></div>\n";
      }
   }   
   print "</form>\n";
}

1;
