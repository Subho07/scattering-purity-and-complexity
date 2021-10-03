%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Eig_bounds_polsar_3D.m
%
%  Project:
%  Purpose:  Estimation of scattering purity and complexity from polarimetric SAR data
%  Author:   Avik Bhattacharya and Subhadip Dey
%  Emails:   avik.bhattach@gmail.com and sdey2307@gmail.com
%  Created:  October 2021
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Copyright (c) 2021, Avik Bhattacharya and Subhadip Dey
%
%  Permission is hereby granted, free of charge, to any person obtaining a
%  copy of this software and associated documentation files (the "Software"),
%  to deal in the Software without restriction, including without limitation
%  the rights to use, copy, modify, merge, publish, distribute, sublicense,
%  and/or sell copies of the Software, and to permit persons to whom the
%  Software is furnished to do so, subject to the following conditions:
%
%  The above copyright notice and this permission notice shall be included
%  in all copies or substantial portions of the Software.
%
%  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
%  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
%  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%  DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



[filename, path] = uigetfile('*.txt', 'Select Full Pol config file');
FolderName = path;


config_ID = fopen(strcat(FolderName,'/','config.txt'),'rb');
tline = fgetl(config_ID);
tline = fgetl(config_ID);
b = str2num(tline); %row
tline = fgetl(config_ID);
tline = fgetl(config_ID);
tline = fgetl(config_ID);
a = str2num(tline); %column
nrow = b;
ncol = a;

fileList = dir('*.bin');

folderName = strcat(FolderName,'/','T11.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T11 = fread(fileID,[a b],'float32');
T11 = T11';

folderName = strcat(FolderName,'/','T12_imag.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T12_imag = fread(fileID,[a b],'float32');
T12_imag = T12_imag';

folderName = strcat(FolderName,'/','T12_real.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T12_real = fread(fileID,[a b],'float32');
T12_real = T12_real';

T12 = complex(T12_real,T12_imag);
T21 = conj(T12);

folderName = strcat(FolderName,'/','T13_imag.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T13_imag = fread(fileID,[a b],'float32');
T13_imag = T13_imag';

folderName = strcat(FolderName,'/','T13_real.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T13_real = fread(fileID,[a b],'float32');
T13_real = T13_real';

T13 = complex(T13_real,T13_imag);
T31 = conj(T13);

folderName = strcat(FolderName,'/','T22.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T22 = fread(fileID,[a b],'float32');
T22 = T22';

folderName = strcat(FolderName,'/','T23_imag.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T23_imag = fread(fileID,[a b],'float32');
T23_imag = T23_imag';

folderName = strcat(FolderName,'/','T23_real.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T23_real = fread(fileID,[a b],'float32');
T23_real = T23_real';

T23 = complex(T23_real,T23_imag);
T32 = conj(T23);

folderName = strcat(FolderName,'/','T33.bin');
disp(folderName);
fileID = fopen(folderName,'rb');
T33 = fread(fileID,[a b],'float32');
T33 = T33';

disp('load complete');

%%
wsi = 7;
disp('Taking window size as 7')

kernel = ones(wsi, wsi)./(wsi*wsi);
t11s = conv2(T11,kernel,'same');
t12s = conv2(T12,kernel,'same');
t13s = conv2(T13,kernel,'same');
t21s = conv2(T21,kernel,'same');
t22s = conv2(T22,kernel,'same');
t23s = conv2(T23,kernel,'same');
t31s = conv2(T31,kernel,'same');
t32s = conv2(T32,kernel,'same');
t33s = conv2(T33,kernel,'same');
%%

n = 3; % size of matrix
det_T3 = t11s.*(t22s.*t33s-t23s.*t32s)-t12s.*(t21s.*t33s-t23s.*t31s)+t13s.*(t21s.*t32s-t22s.*t31s);
trace_T3 = t11s + t22s + t33s;
m = trace_T3/n; % Matrix mean

aux_a = t11s.*t11s + t12s.*t21s + t13s.*t31s;
aux_b = t21s.*t12s + t22s.*t22s + t23s.*t32s;
aux_c = t31s.*t13s + t32s.*t23s + t33s.*t33s;
trace_T_sqr = aux_a + aux_b + aux_c;

s = real(sqrt((trace_T_sqr./n) - m.^2)); % Matrix std

% lower bound
z1 = real(s./(sqrt(n - 1)));
z2 = real((s.*n)./(sqrt((n.^2) - 1)));
lb2 = 1 + (2.*z2./(m - z1));

% upper bound
z3 = real(sqrt(2.*n).*s.*(m + s./(sqrt(n - 1))).^(n - 1))./(det_T3);
lb3 = 1 + z3;

% Measure of purity
pp10 = (1 - (1./lb2))./(1 + (1./lb2));
pp20 = (1 - (1./lb3))./(1 + (1./lb3));

p_av = sqrt((pp10.^2 + pp20.^2)./2); % Average amount of polarization

P_3d_temp = real(s./(m.*sqrt(n - 1))); % New formulation Degree of Purity

% Measure of complexity
d_max = 1/5; %n = 3
delta = real(atand((pp20 - pp10)./(2.*d_max))); % Difference between the bounds
%%
path = FolderName;
if ~exist(strcat(path,'Results_'), 'dir')
    mkdir(strcat(path,'Results_'));
end
fclose('all');
FolderName = path;
Fold = strcat(FolderName,'Results_/');

path = Fold;
cd(path);
%%

fName = 'P_av';
f_name_dopFP = strcat('/', char(fName), '.bin');
fileandpath_dopFP=strcat([path f_name_dopFP]);
fid_011 = fopen(fileandpath_dopFP,'wb');
fwrite(fid_011,p_av', 'float32');

fName = 'delta';
f_name_thetaFP = strcat('/', char(fName), '.bin');
fileandpath_thetaFP=strcat([path f_name_thetaFP]);
fid_01 = fopen(fileandpath_thetaFP,'wb');
fwrite(fid_01,delta', 'float32');

fclose('all');
