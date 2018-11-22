% file_head  = 'D:\MATLAB_GIT\APMCM2018';
% fold_head = '2015';
% mouth = [{'09'},{'10'},{'11'},{'12'}];
% raw = cell(60,60,4);
% for k = 1:4
% file_name = strcat(file_head,'\',fold_head,'\',mouth{k},'.xlsx');
% file = fopen(file_name);
% [num,txt,temp] = xlsread(file_name);
% [n,m] = size(temp);
% raw(1:n,1:m,k) = temp;
% end

job_list = job('Computer software');
for i = 4:12
education = raw{3,i,1};
job_list.add_education(job_list,education);
end

    

