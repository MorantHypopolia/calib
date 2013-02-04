%GPDEMO1 GPTIPS demo of simple symbolic regression on Koza's quartic polynomial.
%   Also demonstrates some post run analysis functions such as SUMMARY,
%   RUNTREE and GPPRETTY to simplify expressions if the Symbolic Math Toolbox
%   is present.
%
%   (c) Dominic Searson 2009
%
%   v1.0
%
%   See also GPDEMO1_CONFIG, QUARTIC_FITFUN, GPDEMO2, GPDEMO3, GPDEMO4, GPREFORMAT, SUMMARY,
%   RUNTREE

clc;
disp('GPTIPS Demo 1: simple symbolic regression');
disp('-----------------------------------------');
disp('Simple symbolic regression on 20 data points genenerated by the'); 
disp('quartic polynomial y=x+x^2+x^3+x^4 in the range -1 < x < 1'); 
disp('The GP run configuration file is gpdemo1_config.m ');
disp('Refer to this for details of how problems may be configured in GPTIPS.');
disp(' ');
disp('In this example, the output of a single evolved GP tree is used to');
disp('model the data generated by the quartic polynomial.');
disp('The function nodes used are TIMES, MINUS, PLUS, RDIVIDE and PLOG.');
disp('The only terminal node used is the input x and trees are constrained');
disp('to have a maximum depth of 12.');
disp('A population size of 50 is run for 100 generations.');
disp('The ''fitness'' is sum of absolute differences between the actual and');
disp('the predicted y values and GPTIPS tries to minimise this.');
disp(' ');

disp('First, call GPTIPS program using the configuration in gpdemo1_config.m'); 
disp('using:');
disp('>>gp=rungp(''gpdemo1_config'');');
disp('Press a key to continue');
disp(' ');
pause;
gp=rungp('gpdemo1_config');




disp('Next, plot summary information of run using:');
disp('>>summary(gp)');


disp('Press a key to continue');
disp(' ');
pause;
summary(gp);

disp('Run the best individual of the run on the fitness function using:');
disp('>>runtree(gp,''best'');');


disp('Press a key to continue');
disp(' ');
pause;
runtree(gp,'best');

%The best individual
disp(' ');
disp('The best individual of the run is stored in the field:');
disp('gp.results.best.eval_individual{1} :');
disp(' ');
disp( gp.results.best.eval_individual{1});
disp(' ');

disp(['This expression has a tree depth of ' int2str( getdepth(gp.results.best.individual{1}))]);
disp(['It was found at generation ' int2str(gp.results.best.foundatgen)]);
disp(['and has fitness ' num2str(gp.results.best.fitness)]);





%If Symbolic Math toolbox is present
if license('test','symbolic_toolbox')
    
    
    
    disp(' ');
    disp('Using the symbolic math toolbox simplified versions of this');
    disp('expression can be found: ')
    disp('E.g. using the the GPPRETTY command on the best individual: ');
   
    disp('>>gppretty(gp,''best'') ')
    disp(' ');
    disp('Press a key to continue');
    disp(' ');
    pause;
    
    gppretty(gp,'best');
    disp(' ');
    disp('If you are lucky then this is the quartic polynomial used to');
    disp('generate the data.');
    disp('NOTE: In general, it is unusual for GP to evolve the exact form'); 
    disp('of the generative function.');
end
