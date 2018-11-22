clear
load all_job_data.mat
%%%主要内容检视
% for list_num = 1 : size(job_list,2)
%     name = job_list(list_num).Getname(job_list(list_num));
%     disp(name);
%     mouth = job_list(list_num).Getmouth(job_list(list_num));
%     disp(size(mouth,2));
% end
%  num = size(job_list,2);
%  n = ceil(sqrt(num));
% for list_num = 1 : size(job_list,2)
%     subplot(n,n,list_num)
%     title(job_list(list_num).Getname(job_list(list_num)));
%     mesh(job_list(list_num).Getdata(job_list(list_num)));
% end

%%%绘制某一个职业的变化情况
list_num = 2;
name = job_list(list_num).Getname(job_list(list_num));
data = job_list(list_num).Getdata(job_list(list_num));
mesh(data);
[nn,mm]= size(data);
set(gca,'ytick',1:nn,'yticklabel',job_list(list_num).Getmouth(job_list(list_num)))
set(gca,'xtick',1:mm,'xticklabel',job_list(list_num).Geteducation(job_list(list_num)))
title(name);
ylabel('Time')
xlabel('Education requirements')
zlabel('Market Demand')