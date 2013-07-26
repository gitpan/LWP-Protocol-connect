
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Provides HTTP/CONNECT proxy support for LWP::UserAgent",
  "AUTHOR" => "Markus Benning <me\@w3r3wolf.de>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "LWP-Protocol-connect",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "LWP::Protocol::connect",
  "PREREQ_PM" => {
    "IO::Socket::SSL" => 0,
    "LWP::Protocol" => 0,
    "LWP::Protocol::https" => 0,
    "Net::HTTP" => 0,
    "Net::HTTPS" => 0,
    "URI::http" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "6.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



