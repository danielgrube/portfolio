#!/usr/bin/perl

while (true){
print "Pick a Bible verse:\n";
$verse=<>;

if ($verse =~ /[0-9]?[a-zA-Z]+([0-9]+(:([0-9]+(-[0-9]+)?(,[0-9]+(-[0-9]+)?)*))?(;[0-9]+(:([0-9]+(-[0-9]+)?(,[0-9]+(-[0-9]+)?)*))?)*)?(\([a-zA-Z]+\))?/){
  print "This is a verse.\n";
}
else{
  print "This is not a verse\n";
}
}
