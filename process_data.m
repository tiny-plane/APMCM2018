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

% list_num = 2;
% name = job_list(list_num).Getname(job_list(list_num));
% data = job_list(list_num).Getdata(job_list(list_num));
% mesh(data);
% [nn,mm]= size(data);
% set(gca,'ytick',1:nn,'yticklabel',job_list(list_num).Getmouth(job_list(list_num)))
% set(gca,'xtick',1:mm,'xticklabel',job_list(list_num).Geteducation(job_list(list_num)))
% title(name);
% ylabel('Time')
% xlabel('Education requirements')
% zlabel('Market Demand')


%
% subplot(1,2,1)
% list_num = 1;
% name = job_list(list_num).Getname(job_list(list_num));
% data = job_list(list_num).Getdata(job_list(list_num));
% [nn,mm]= size(data);
% yue = sum(data(:,2:end)');
% plot(yue);
% mouth = job_list(list_num).Getmouth(job_list(list_num));
% set(gca,'xtick',1:nn,'xticklabel',mouth)
% title(name);
% ylabel('Demands')
% xlabel('Time')
% subplot(1,2,2)
%
%
% [nn,mm]= size(data);
% yue2 = data(:,1)';
% plot(yue2);
% set(gca,'xtick',1:nn,'xticklabel',mouth)
% title(name);
% ylabel('Demands')
% xlabel('Time')


%%%求一下总人数

total = zeros(1,36);
for k = 1:36
    for list_num = 1:size(job_list,2)
        for t1 = 1:size(job_list(list_num).mouth,2)
            finded = 0;
            if job_list(list_num).mouth{t1} == job_list(1).mouth{k}
                finded = t1;
                break
            end
        end
        if finded ~= 0
            data1 = job_list(list_num).data(finded,:);
            total(k) = total(k) + sum(data1);
        end
    end
end
plot(total)
mouth = job_list(1).Getmouth(job_list(1));
set(gca,'xtick',1:36,'xticklabel',mouth)