use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Posterous',
    VERSION_FROM      => 'lib/Posterous.pm',
    ABSTRACT_FROM     => 'lib/Posterous.pm',
    MIN_PERL_VERSION  => '5.010',
    PREREQ_PRINT      => 1,
    PREREQ_PM         => {
          'LWP::UserAgent'        => 0,
          'HTTP::Request'         => 0,
          'Rubyish::Attribute'    => 0,
          'MIME::Base64'          => 0,
          'Attribute::Protected'  => 0,
          'XML::Simple'           => 0,
    }, 
    AUTHOR            => 'shelling <shelling@cpan.org>',
    clean             => { FILES => "Posterous-* MANIFEST.bak" },
);
