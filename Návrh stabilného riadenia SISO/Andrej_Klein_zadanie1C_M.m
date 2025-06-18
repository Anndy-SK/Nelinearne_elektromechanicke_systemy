%   Projekt 1
%   Zadanie typ C - Navrh SISO systemu s blokovou schemou.
%   Sucastou je model navrhnuty v Simulinku "P1S_AndrejKlein".
%   Autor:  Bc. Andrej Klein
%   Date:   10.11.2022
%*********************************************************************
%
%Parametre systemu:
a1 = -0.47; b1 = -3.32; c1 = -0.05; d1 = -0.13; e1 = 2.5; v = 0.12;
%
disp("Blokova schema SISO systemu podla stavoveho popisu:");
A = [0 e1 -e1;-b1 -a1 0;-c1 0 -d1]
B = [0 0;-b1 0;0 c1]
C = [1 0 0];
D = [0 0];
%
disp("Navrh referencneho modelu podla stavoveho popisu:");
% Pozadovany aperiodicky priebeh a cas ustalenia: Tust = 5 [s].
% Navrhnute zosilnenie: alfa = 6.
Al = 6;
Am = [0 1 0;0 0 1;-Al^3/2 -3*Al^2/2 -3*Al/2]
Bm = [0;0;Al^3/2]
Cm = [1 0 0;0 1 0;0 0 1];
Dm = [0;0;0];
%
% Navrhnuta ljapunovova matica:
disp("Ljapunovova matica P:");
P = [ Al^5/2  Al^4  Al^3/2; Al^4 5*Al^3/2 3*Al^2/2; Al^3/2 3*Al^2/2 3*Al/2]
% Matica "-Q":
Q = ((Am'*P)+(P*Am))
P2 = lyap(Am',Q')