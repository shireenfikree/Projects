% Single Class Grade Calculator
% Shireen Fikree
% shireenfikree@gmail.com
% Most recent update: 16th April 2017

clear all
clc

% Encourage sentient being
fprintf('May the Curve be with you.\n');

fprintf('\nThese are some default grade boundaries:\n');
fprintf('\n1. A = 93+; A- = 90+; B+ = 86+; B = 83+; B- = 80+; C+ = 76+; C = 73+; C- = 70+; D+ = 66+, D = 63+; D- = 60+; F = <60\n');
fprintf('\n2. A = 94+; A- = 90+; B+ = 87+; B = 84+; B- = 80+; C+ = 77+; C = 74+; C- = 70+; D+ = 67+, D = 64+; D- = 60+; F = <60\n');
fprintf('\n3. I''d like to manually define the grade boundaries.\n \n');
 
% Choose grade boundaries
bounds = input('Which the grade boundaries will you use? ');

% Make sure a set of grade boundaries is chosen
while bounds ~= 1 & bounds ~= 2 & bounds ~= 3
    disp('Sorry, you must enter either 1, 2, or 3.');
    bounds = input('\nWhich the grade boundaries will you use? ');
end

% Manually input bounds
if bounds == 3
    fprintf('\nWhat are the grade boundaries? ');
    ai = input('\nA = ');
    am = input('A- = ');
    bp = input('B+ = ');
    b = input('B = ');
    bm = input('B- = ');
    cp = input('C+ = ');
    c = input('C = ');
    cm = input('C- = ');
    dp = input('D+ = ');
    d = input('D = ');
    dm = input('D- = ');
    f = input('F = ');
elseif bounds == 1
    ai = 93;
    am = 90;
    bp = 86;
    b = 83;
    bm = 80;
    cp = 76;
    c = 73;
    cm = 70;
    dp = 66;
    d = 63;
    dm = 60;
    f = 60;
elseif bounds == 2
    ai = 94;
    am = 90;
    bp = 87;
    b = 84;
    bm = 80;
    cp = 77;
    c = 74;
    cm = 70;
    dp = 67;
    d = 64;
    dm = 60;
    f = 60;
end

% Number of assignments
n = input('\nHow many assignments have you done so far? ');

% Scores and weights
for i = 1:1:n
    fprintf('For assignment #%d\n',i);
    score = input('What was your grade (in percentage)? ');
    w = input('How much does it weigh (in percentage)? ');
    s(i,1) = score;
    s(i,2) = w;
    s(i,3) = w/100;
end

% Percentage total
sumw = sum(s(:,3));

% In case of overreach
while sumw > 1
    fprintf('\nWait! That''s over 100 percent! Let''s go from the top.\n');
    for i = 1:1:n
        fprintf('For assignment #%d\n',i);
        score = input('What was your grade (in percentage)? ');
        w = input('How much does it weigh (in percentage)? ');
        s(i,1) = score;
        s(i,2) = w;
        s(i,3) = w/100;
    end
    sumw = sum(s(:,3));
end

% Weight score
for i = 1:1:n
    s(i,4) = s(i,1)*s(i,3);
end

% Total weights and stuff
sums = sum(s(:,4));
sumq = sumw*100;
percy = 100*(sums/sumq);

% Display current standing in class
fprintf('\nYour current score is %.2f / %.2f.',sums,sumq);
fprintf('\nThat''s %.2f percent.\n',percy);

% Display requirements for A
if sumq < 99
    sumv = 100 - sumq; % final
    sumu = ai - sums;
    sumw = sumu/sumv;
    sump = 100*sumw;
    fprintf('You are %.2f / %.0f on the way to an A.\n',sumu,sumv);
    fprintf('If you want an A, you will need %.2f percent total in any remaining assignments.\n',sump);
    if sumu > sumv
        fprintf('You still have assignments left to do.\n');
    end
elseif percy < ai
    sumv = 0;
    fprintf('You have no more assignments left to do.\n');
else
    sumv = 0;
    fprintf('You''re awesome!\n');
end

if sumq == 100
    if percy >= ai
        fprintf('You will get an A!');
    elseif percy >= am
        fprintf('You will get an A-');
    elseif percy >= bp
        fprintf('You will get a B+');
    elseif percy >= b
        fprintf('You will get a B');
    elseif percy >= bm
        fprintf('You will get a B-');
    elseif percy >= cp
        fprintf('You will get a C+');
    elseif percy >= c
        fprintf('You will get a C');
    elseif percy >= cm
        fprintf('You will get a C-');
    elseif percy >= dp
        fprintf('You will get a D+');
    elseif percy >= d
        fprintf('You will get a D');
    elseif percy >= dm
        fprintf('You will get a D-');
    else
        fprintf('You will get an F');
    end
else
    inky = sums + sumv;
    if inky >= ai
        fprintf('Looks like you can still get that A!');
    elseif inky >= am
        fprintf('Looks like the highest you can get is an A-');
    elseif inky >= bp
        fprintf('Looks like the highest you can get is a B+');
    elseif inky >= b
        fprintf('Looks like the highest you can get is a B');
    elseif inky >= bm
        fprintf('Looks like the highest you can get is a B-');
    elseif inky >= cp
        fprintf('Looks like the highest you can get is a C+');
    elseif inky >= c
        fprintf('Looks like the highest you can get is a C');
    elseif inky >= cm
        fprintf('Looks like the highest you can get is a C-');
    elseif inky >= dp
        fprintf('Looks like the highest you can get is a D+');
    elseif inky >= d
        fprintf('Looks like the highest you can get is a D');
    elseif inky >= dm
        fprintf('Looks like the highest you can get is a D-.');
    else
        fprintf('It doesn''t look like you''ll be getting higher than an F...');
    end
end

% Congratulate sentient being
fprintf('\n\nYou have received Sleep Deprivation!');
fprintf('\nYou have received General Frustration!');
fprintf('\nYou have received Vague Sense Of Accomplishment!');
fprintf('\nYou have received Addiction To Beverage Of Choice!\n');

% End program
% Cry