file_head  = 'D:\MATLAB_GIT\APMCM2018';
fold_head = '2015';
mouth = '09';
file_name = strcat(file_head,'\',fold_head,'\',mouth,'.xlsx');
file = fopen(file_name);
[num,txt,raw] = xlsread(file_name);