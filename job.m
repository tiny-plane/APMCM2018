classdef job<handle
    properties
        name;
        mouth;     %row
        education;      %column
        data = 0;
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
    job.data = data;
        end
    end
end
        