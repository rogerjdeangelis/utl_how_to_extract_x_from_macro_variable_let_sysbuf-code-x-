How do I extract the argument 'X' from macro variable %let sysbuf=(code=X);

Two solutions

  1. clean datastep
  2, '% q %nrstr %)' Klingon macro solution

INPUT (extract X from macro variable)
=====================================

  %let sysbuf=(code=X);

PROCESS
=======

  * just datastep knowledge needed;
  %let rc=%sysfunc(dosubl('
       data _null_;
          call symputx("arg",scan("&sysbuf",-1,"=)"));
       run;quit;
  '));

  %put &=arg;

  ARG=X

  * a little too Klingon for me '% q %nrstr %)';
  %let arg=%qsysfunc(scan(&sysbuf,-1,%nrstr(=%))));

  %put &=arg;

  ARG=X

OUTPUT
======

  ARG=X


