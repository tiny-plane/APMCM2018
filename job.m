classdef job<handle
    properties
        name;
        mouth;     %row
        education;      %column
        data = 0;
        data3 = 0;
    end
    methods
        function obj = job(name)
            obj.name = name;
        end
    end
    methods (Static)
        function dup = find_dup(job,name)
            dup = false;
            if strcmp(job.name,name)
                dup = true;
            end
        end
        function add_mouth(job,mouth)
            job.mouth = [job.mouth,{mouth}];
            [n,m]=size(job.data);
            temp  = zeros(n+1,m);
            temp(1:n,1:m) = job.data;
            job.data = temp;
        end
        function add_education(job,education)
            job.education = [job.education,{education}];
            [n,m]=size(job.data);
            temp  = zeros(n,m+1);
            temp(1:n,1:m) = job.data;
            job.data = temp;
        end
        function add_data(job,mouth,education,data)
            n = 0;
            for i = 1 : size(job.mouth,2)
                if strcmp(job.mouth{i},mouth)
                    n = i;
                    break;
                end
            end
            if n == 0
                job.add_mouth(job,mouth);
                for i = 1 : size(job.mouth,2)
                    if strcmp(job.mouth{i},mouth)
                        n = i;
                        break;
                    end
                end
            end
            m = 0;
            for j =1 : size(job.education,2)
                if strcmp(job.education{j},education)
                    m = j;
                    break;
                end
            end
            if m == 0
                job.add_education(job,education);
                for j =1 : size(job.education,2)
                    if strcmp(job.education{j},education)
                        m = j;
                        break;
                    end
                end
            end
            job.data(n,m) = data;
        end
        function name = Getname(job)
            name = job.name;
        end
        function mouth = Getmouth(job)
            mouth = job.mouth;
        end
        function education = Geteducation(job)
            education = job.education;
        end
        function data = Getdata(job)
            data = job.data;
        end
    end
end
