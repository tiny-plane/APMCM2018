clear
job_list = job('Computer software ');
file_head  = 'D:\MATLAB_GIT\APMCM2018';
mouth = [{'01'},{'02'},{'03'},{'04'},{'05'},{'06'},{'07'},{'08'},{'09'},{'10'},{'11'},{'12'}];
for year = 2015:2015
    fold_head = num2str(year);
    for k = 1:12
        file_name = strcat(file_head,'\',fold_head,'\',mouth{k},'.xlsx');
        disp(['���ڴ���<---',file_name])
        file = fopen(file_name);
        if file == -1
            continue
        end  %û������·ݾ���һ��
        
        [num,txt,temp] = xlsread(file_name);  %��ȡһ������
        
        for job_num = 4 : size(temp,1)-3        %����ְҵ���
            new_job_name = temp{job_num,2};      %ְҵ����ȡ����׼������
            dup = 0;
            for list_num = 1:size(job_list,2)    %���б���ж���
                result = job_list(1).find_dup(job_list(list_num),new_job_name);
                if result
                    dup = list_num;   %��¼һ���ظ���
                    break
                end
            end
            if dup == 0
                job_list = [job_list,job(new_job_name)];
                list_num = list_num + 1;
            end
            for i = 4:12
                education = temp{3,i};
                mouth_list = [fold_head,mouth{k}];
                job_list(1).add_data(job_list(list_num),mouth_list,education,temp{4,i})
            end
        end
    end
end
for list_num = 1:size(job_list,2) 
job_list(list_num).data(end,:) = [];
job_list(list_num).data(:,end) = [];
end




