clear
job_list = job('Computer software ');
file_head  = 'D:\MATLAB_GIT\APMCM2018';
mouth = [{'01'},{'02'},{'03'},{'04'},{'05'},{'06'},{'07'},{'08'},{'09'},{'10'},{'11'},{'12'}];
for year = 2015:2018
    fold_head = num2str(year);
    for k = 1:12
        file_name = strcat(file_head,'\',fold_head,'\',mouth{k},'.xlsx');
        disp(['正在处理<---',file_name])
        file = fopen(file_name);
        if file == -1
            continue
        end  %没有这个月份就下一个
        fclose(file);
        [num,txt,temp] = xlsread(file_name);  %读取一个数据
        
        for job_num = 4 : size(temp,1)-3         %按照职业逐个
            new_job_name = temp{job_num,2};      %职业名称取出来准备对照
            if isnan(new_job_name)
                continue;
            end
            dup = 0;
            for list_num = 1:size(job_list,2)    %与列表进行对照
                result = job_list(1).find_dup(job_list(list_num),new_job_name);
                if result
                    dup = list_num;   %记录一下重复了
                    break
                end
            end
            
            if dup == 0    %没重复的话，就要新建一个工作
                job_list = [job_list,job(new_job_name)];
                list_num = list_num + 1;
            end
            
                education = 'Total';   %总数那一栏位置和别的不一样，单独处理一下
                mouth_list = [fold_head,mouth{k}];
                job_list(1).add_data(job_list(list_num),mouth_list,education,temp{job_num,3})
                
            for i = 4:12   %其他所有职业水平的，求一下
                education = temp{3,i};
                mouth_list = [fold_head,mouth{k}];
                job_list(1).add_data(job_list(list_num),mouth_list,education,temp{job_num,i})
            end
        end
    end
end
for list_num = 1:size(job_list,2) 
job_list(list_num).data(end,:) = [];
job_list(list_num).data(:,end) = [];
end
for list_num = 1:size(job_list,2)
    temp = job_list(list_num).data;
    job_list(list_num).data3 = [sum(temp(:,2:5),2),sum(temp(:,6:6),2),sum(temp(:,7:9),2)];
end
save all_job_data.mat



