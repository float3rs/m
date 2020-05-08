%% PREPARETION

clc

clear  
close

disp('>< ALL CLEARED')
disp('>< ALL CLOSED')
disp(' ')

%% PARAMETERS
disp('/-/-/-/-/-/-/-/-/-/-/-/-/-')
disp('-> SYSTEM PARAMETER VALUES')
disp('/-/-/-/-/-/-/-/-/-/-/-/-/-')

% m1=10; 
% m2=55; 
% m3=100;
% 
% k1=5000; 
% k2=10000; 
% k3=15000;
% 
% c2=100; 
% c3=200;

m1=100; 
m2=55; 
m3=10;

k1=15000; 
k2=10000; 
k3=5000;

c2=200; 
c3=100;

disp(' ')
disp('MASSES: ')
disp(['m1: ', num2str(m1)])
disp(['m2: ', num2str(m2)])
disp(['m3: ', num2str(m3)])

disp(' ')
disp('ELASTICITIES: ')
disp(['k1: ', num2str(k1)])
disp(['k2: ', num2str(k2)])
disp(['k3: ', num2str(k3)])

disp(' ')
disp('ATTENUATIONS: ')
disp(['c2: ', num2str(c2)])
disp(['c3: ', num2str(c3)])

% fprintf('m1: %5.0f        m2: %5.0f        m3: %5.0f\n', m1, m2, m3)
% fprintf('k1: %5.0f        k2: %5.0f        k3: %5.0f\n', k1, k2, k3)
% fprintf('                 c2: %5.0f        c3: %5.0f\n', c2, c3)

disp(' ')

%% MATRICES
disp('/-/-/-/-/-/-/-/-/-/-/-/')
disp('-> STATE SPACE MATRICES')
disp('/-/-/-/-/-/-/-/-/-/-/-/')

disp(' ')
disp('STATE MATRIX:')

A=[          0       1            0            0       0       0;
   -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
             0       0            0            1       0       0;
         k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
             0       0            0            0       0       1;
             0       0         k3/m3        c3/m3  -k3/m3  -c3/m3]
        
% Input matrix.

disp(' ')
disp('INPUT MATRIX:')

B=[   0     0     0;
   1/m1     0     0;
      0     0     0;
      0  1/m2     0;
      0     0     0;
      0     0  1/m3]
  
% Output matrix.

disp(' ')
disp('OUTPUT MATRIX:')

C=[          1       0            0            0       0       0;
             0       0            1            0       0       0;
             0       0            0            0       1       0;
             0       1            0            0       0       0;
             0       0            0            1       0       0;
             0       0            0            0       0       1;
   -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
         k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
             0       0        k3/m3        c3/m3  -k3/m3  -c3/m3;
            k1       0            0            0       0       0;
            k2       0          -k2            0       0       0;
             0      c2            0          -c2       0       0;
             0       0           k3            0     -k3       0;
             0       0            0           c3       0     -c3]
         
 % Input matrix.
 
disp(' ')
disp('INPUT MATRIX:')

 D=[0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    1/m1    0     0;
    0    1/m2     0;
    0       0  1/m3;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0]

% disp(' ')
% disp('### PAUSE ###')
% pause
% disp(' ')

%% TRANSFER FUNCTIONS 
disp('/-/-/-/-/-/-/-/-/-/-/')
disp('-> TRANSFER FUNCTIONS')
disp('/-/-/-/-/-/-/-/-/-/-/')

% /////////////////////////////////////
% Transfer functions w.r.t first input.
% /////////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 1')

[num1,den]=ss2tf(A,B,C,D,1)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

% disp(' ')
% disp('### PAUSE ###')
% pause
% disp(' ')

disp(' ')
disp(' ')
disp('SYSTEM 1 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num1,den)

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 1')
disp('### PAUSE 1/3 ###')
pause
disp(' ')
disp(' ')

% //////////////////////////////////////
% Transfer functions w.r.t second input.
% //////////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 2')

[num2,den]=ss2tf(A,B,C,D,2)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

% disp(' ')
% disp('### PAUSE ###')
% pause
% disp(' ')

disp(' ')
disp(' ')
disp('SYSTEM 2 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num2,den) 

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 2')
disp('### PAUSE 2/3 ###')
pause
disp(' ')
disp(' ')

% /////////////////////////////////////
% Transfer functions w.r.t third input.
% /////////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 3')

[num3,den]=ss2tf(A,B,C,D,3)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

% disp(' ')
% disp('### PAUSE ###')
% pause
% disp(' ')

disp(' ')
disp(' ')
disp('SYSTEM 3 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num3,den) 

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 3')
disp('### PAUSE 3/3 ###')
pause
disp(' ')
disp(' ')

%% ASSIGNMENT
 
disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('|-----------------------------|')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:          A') 
disp('>>> INPUT:            f3') 
disp('>>> STEP MAGNITUDE:  100')

disp(' ')
disp(' ')
disp('$ OUTPUT:   x1')
sysA_01=tf(num3(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x2')
sysA_02=tf(num3(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x3')
sysA_03=tf(num3(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u1')
sysA_04=tf(num3(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u2')
sysA_05=tf(num3(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u3')
sysA_06=tf(num3(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a1')
sysA_07=tf(num3(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a2')
sysA_08=tf(num3(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a3')
sysA_09=tf(num3(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k1')
sysA_10=tf(num3(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k2')
sysA_11=tf(num3(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c2')
sysA_12=tf(num3(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k3')
sysA_13=tf(num3(13,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c3')
sysA_14=tf(num3(14,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 2 <- QUESTION A')
disp('### PAUSE 1/2 ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>>> QUESTION:                       B') 
disp('>>> INPUT:                         f1') 
disp('>>> SINUSOIDAL:  f_p    - p = 1000 Nt')
disp('>>>              f_mean     =    0 Nt')

disp(' ')
disp(' ')
disp('$ OUTPUT:   x1')
sysB_01=tf(num1(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x2')
sysB_02=tf(num1(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x3')
sysB_03=tf(num1(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u1')
sysB_04=tf(num1(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u2')
sysB_05=tf(num1(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u3')
sysB_06=tf(num1(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a1')
sysB_07=tf(num1(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a2')
sysB_08=tf(num1(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a3')
sysB_09=tf(num1(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k1')
sysB_10=tf(num1(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k2')
sysB_11=tf(num1(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c2')
sysB_12=tf(num1(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k3')
sysB_13=tf(num1(13,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c3')
sysB_14=tf(num1(14,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 2 <- QUESTION B')
disp('### PAUSE 2/2 ###')
pause
disp(' ')
disp(' ')

%% STEP RESPONCES

disp(' ')
disp('/-/-/-/-/-/-/-/')
disp('RESPONSES: STEP')
disp('/-/-/-/-/-/-/-/')
close 

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 1')

f_step1 = figure('Name','step(A,B,C,D,1)');
step(A,B,C,D,1) 

disp(' ') 
disp('###  PAUSE 1/3 -> FIGURE step(A,B,C,D,1) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 2')

f_step2 = figure('Name','step(A,B,C,D,2)');
step(A,B,C,D,2) 

disp(' ') 
disp('###  PAUSE 2/3 -> FIGURE step(A,B,C,D,2) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 3')

f_step3 = figure('Name','step(A,B,C,D,3)');
step(A,B,C,D,3) 

disp(' ') 
disp('###  PAUSE 3/3 -> FIGURE step(A,B,C,D,3) ###')
pause
disp(' ')
disp(' ')

%% IMPULSE RESPONSES

disp(' ')
disp('/-/-/-/-/-/-/-/-/-')
disp('RESPONSES: IMPULSE')
disp('/-/-/-/-/-/-/-/-/-')
close 

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 1')

f_impulse1 = figure('Name','impulse(A,B,C,D,1)');
impulse(A,B,C,D,1) 

disp(' ') 
disp('###  PAUSE 1/3 -> FIGURE impulse(A,B,C,D,1) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 2')

f_impulse2 = figure('Name','impulse(A,B,C,D,2)');
impulse(A,B,C,D,2) 

disp(' ') 
disp('###  PAUSE 2/3 -> FIGURE impulse(A,B,C,D,2) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 3')

f_impulse3 = figure('Name','impulse(A,B,C,D,3)');
impulse(A,B,C,D,3) 

disp(' ') 
disp('###  PAUSE 3/3 -> FIGURE impulse(A,B,C,D,3) ###')
pause
disp(' ')
disp(' ')

%% SYSTEM ANALYSIS

% clc

disp(' ')
disp('/-/-/-/-/-/-/-/')
disp('SYSTEM ANALYSIS')
disp('/-/-/-/-/-/-/-/')
disp(' ')
close 


disp('>>>>>>>>>>>>>>> POLES')
disp('>>> EIGEN-FREQUENCIES')
disp('>>>>> DAMPING FACTORS')

damp(den) 

disp(' ')
disp('...OR')

damp(A), [wn,zita]=damp(A); 

disp(' ')
disp('> POLES/EIGEN-FREQUENCIES/DAMPING FACTORS')
disp('### PAUSE 1/2 ###')
pause
disp(' ')

disp('>>> DAMPING FREQUENCIES')

wd=wn.*sqrt(1-zita.^2)

disp(' ')
disp('> DAMPING FREQUENCIES')
disp('### PAUSE 2/2 ###')
pause
disp(' ')

% disp(' ')
% disp('### PAUSE ###')
% pause
% disp(' ')

%% SYSTEM PARAMETERS BECAUSE OF INPUTS

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 1')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

% All system parameters due to first input.
[z1,p,k1]=tf2zp(num1,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 1')
disp('### PAUSE 1/3###')
pause
disp(' ')

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 2')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

% All system parameters due to second input.
[z2,p,k2]=tf2zp(num2,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 2')
disp('### PAUSE 2/3 ###')
pause
disp(' ')

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 3')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

% All system parameters due to third input.
[z3,p,k3]=tf2zp(num3,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 3')
disp('### PAUSE 3/3 ###')
pause
disp(' ')

%% TIME CONSTANTS

disp(' ')
disp('/-/-/-/-/-/-/-')
disp('TIME CONSTANTS')
disp('/-/-/-/-/-/-/-')
disp(' ')
close 

% Time constants.
taf=1./abs(real(p)) 

disp(' ')
disp('> TIME CONSTANTS')
disp('### PAUSE ###')
pause
disp(' ')

%% BODE PLOTS BECAUSE OF ALL INPUTS

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('   BODE PLOTS   ')
disp('DUE TO INPUTS: ALL')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

% Bode plots all outputs due to all inputs.

f_bode_1 = figure('Name','bode(A,B,C,D,1)');
bode(A,B,C,D,1), grid 
f_bode_2 = figure('Name','bode(A,B,C,D,2)');
bode(A,B,C,D,1), grid 
f_bode_3 = figure('Name','bode(A,B,C,D,3)');
bode(A,B,C,D,1), grid 

disp(' ') 
disp('###  PAUSE -> 3 FIGURES // bode(A,B,C,D) ###')
pause
disp(' ')
disp(' ')

%% ASSIGNMENT ANALYSIS A

disp('|-------------|')
disp('| ANALYSIS: A |')
disp('|-------------|')
close all

optA = stepDataOptions('StepAmplitude',100)

fA_01=figure('Name','sysA_01_x1');
step(sysA_01, optA), grid, zoom
disp('do FIGURE sysA_01_x1')
fA_02=figure('Name','sysA_02_x2');
step(sysA_02, optA), grid, zoom
disp('do FIGURE sysA_02_x2')
fA_03=figure('Name','sysA_03_x3');
step(sysA_03, optA), grid, zoom
disp('do FIGURE sysA_03_x3')
fA_04=figure('Name','sysA_04_u1');
step(sysA_04, optA), grid, zoom
disp('do FIGURE sysA_04_u1')
fA_05=figure('Name','sysA_05_u2');
step(sysA_05, optA), grid, zoom
disp('do FIGURE sysA_05_u2')
fA_06=figure('Name','sysA_06_u3');
step(sysA_06, optA), grid, zoom
disp('do FIGURE sysA_06_u3')
fA_07=figure('Name','sysA_07_a1');
step(sysA_07, optA), grid, zoom
disp('do FIGURE sysA_07_a1')
fA_08=figure('Name','sysA_08_a2');
step(sysA_08, optA), grid, zoom
disp('do FIGURE sysA_08_a2')
fA_09=figure('Name','sysA_09_a3');
step(sysA_09, optA), grid, zoom
disp('do FIGURE sysA_09_a3')
fA_10=figure('Name','sysA_10_fk1');
step(sysA_10, optA), grid, zoom
disp('do FIGURE sysA_10_fk1')
fA_11=figure('Name','sysA_11_fk2');
step(sysA_11, optA), grid, zoom
disp('do FIGURE sysA_11_fk2')
fA_12=figure('Name','sysA_12_fc2');
step(sysA_12, optA), grid, zoom
disp('do FIGURE sysA_12_fc2')
fA_13=figure('Name','sysA_13_fk3');
step(sysA_13, optA), grid, zoom
disp('do FIGURE sysA_13_fk3')
fA_14=figure('Name','sysA_14_fc3');
step(sysA_14, optA), grid, zoom
disp('do FIGURE sysA_14_fc3')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM A ###')
pause 
disp(' ')

%% ASSIGNMENT ANALYSIS B

disp('|-------------|')
disp('| ANALYSIS: B |')
disp('|-------------|')
close all


% ///////////////////////
% fp     - p = 1000    Nt
% f_mean     =    0    Nt
% ///////////////////////
% frequency:      1    Hz
% duration:     120     s
% sampling:     100 spl/s
% ///////////////////////

[u,t] = gensig('sin', 1, 60, 0.01);
disp(' ')

fB_01=figure('Name','sysB_01_x1');
lsim(sysB_01, 500*u, t);
disp('do FIGURE sysB_01_x1')
fB_01=figure('Name','sysB_02_x2');
lsim(sysB_02, 500*u, t);
disp('do FIGURE sysB_02_x2')
fB_01=figure('Name','sysB_03_x3');
lsim(sysB_03, 500*u, t);
disp('do FIGURE sysB_03_x3')
fB_01=figure('Name','sysB_04_u1');
lsim(sysB_04, 500*u, t);
disp('do FIGURE sysB_04_u1')
fB_01=figure('Name','sysB_05_u2');
lsim(sysB_05, 500*u, t);
disp('do FIGURE sysB_05_u2')
fB_01=figure('Name','sysB_06_u3');
lsim(sysB_06, 500*u, t);
disp('do FIGURE sysB_06_u3')
fB_01=figure('Name','sysB_07_a1');
lsim(sysB_07, 500*u, t);
disp('do FIGURE sysB_07_a1')
fB_01=figure('Name','sysB_08_a2');
lsim(sysB_08, 500*u, t);
disp('do FIGURE sysB_08_a2')
fB_01=figure('Name','sysB_09_a3');
lsim(sysB_09, 500*u, t);
disp('do FIGURE sysB_09_a3')
fB_01=figure('Name','sysB_10_fk1');
lsim(sysB_10, 500*u, t);
disp('do FIGURE sysB_10_fk1')
fB_01=figure('Name','sysB_11_fk2');
lsim(sysB_11, 500*u, t);
disp('do FIGURE sysB_11_fk2')
fB_01=figure('Name','sysB_12_fc2');
lsim(sysB_12, 500*u, t);
disp('do FIGURE sysB_12_fc2')
fB_01=figure('Name','sysB_13_fk3');
lsim(sysB_13, 500*u, t);
disp('do FIGURE sysB_13_fk3')
fB_01=figure('Name','sysB_14_fc3');
lsim(sysB_14, 500*u, t);
disp('do FIGURE sysB_14_fc3')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM B ###')
pause 
disp(' ')

%% FREQUENCY RESPONSES

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('| <><><>< QUESTION: M ><><><> |')
disp('|-----------------------------|')
disp(' ')

close all

f_bode_sysA_01 = figure('Name','bode(sysA_01) => x1');
bode(sysA_01), grid
disp('do BODE-FIGURE sysA_01_x1')
f_bode_sysA_04 = figure('Name','bode(sysA_04) => u1');
bode(sysA_04), grid 
disp('do BODE-FIGURE sysA_04_u1')
f_bode_sysA_07 = figure('Name','bode(sysA_07) => a1');
bode(sysA_07), grid 
disp('do BODE-FIGURE sysA_07_a1')

disp(' ')

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('| <><><>< QUESTION: N ><><><> |')
disp('|-----------------------------|')
disp(' ')

fA_06=figure('Name','sysA_04_u1');
step(100*sysA_04,1), grid, zoom
disp('do FIGURE sysA_04_u1')

disp(' ')
stepinfo(100*sysA_04);
