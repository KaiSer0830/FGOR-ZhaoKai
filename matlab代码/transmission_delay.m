clear all;              %%��������ռ�����б���
linearWidth = 1.2;      %�������
all_nodeNums = [10; 20; 30; 40; 50; 60; 70; 80; 90; 100];
filesNum = 5;          %ʵ��Ĵ���
nodeNum = 10;           %ʵ��ڵ�Ĵ���
zValue = 1.96;          %���������zֵ
duration = 15;          %������ʱ�� 
%%����20��ʵ�飬ÿ��ʵ��ȡ10����
result1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid1);
        data1 = [C1{5}];                         %%ȡ����5��Ԫ��
        s1 = sum(data1);
        len1 = length(data1); 
        if len1 ~= 0
            result1(j) = (s1 / len1) + result1(j); 
        end
    end
end
result1 = result1./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid1);
        data1 = [C1{5}];                         %%ȡ����5��Ԫ��
        s1 = sum(data1);
        len1 = length(data1);
        if len1 ~= 0
            Variance1(j) = ((s1 / len1) - result1(j))^2 + Variance1(j); 
        end
    end
end
Variance1 = sqrt(Variance1)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result1(:,1),Variance1, '--xg','LineWidth',linearWidth);
ylabel('Transmission average delay(s)');
xlabel('Number of nano-nodes(n)');
% ylabel('���ݰ�����ƽ��ʱ��(s)');
% xlabel('���׽ڵ�����(��)');
hold on


result2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid2);
        data2 = [C2{5}];                         %%ȡ����5��Ԫ��
        s2 = sum(data2);
        len2 = length(data2);
        if len2 ~= 0
            result2(j) = (s2 / len2) + result2(j);
        end  
    end
end
result2 = result2./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid2);
        data2 = [C2{5}];                         %%ȡ����5��Ԫ��
        s2 = sum(data2);
        len2 = length(data2);
        if len2 ~= 0
            Variance2(j) = ((s2 / len2) - result2(j))^2 + Variance2(j);
        end       
    end
end
Variance2 = sqrt(Variance2)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result2(:,1),Variance2, '--db','LineWidth',linearWidth);
hold on


result3 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance3 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid3);
        data3 = [C3{5}];                         %%ȡ����5��Ԫ��
        s3 = sum(data3);
        len3 = length(data3);
        if len3 ~= 0
            result3(j) = (s3 / len3) + result3(j);
        end 
    end
end
result3 = result3./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid3);
        data3 = [C3{5}];                         %%ȡ����5��Ԫ��
        s3 = sum(data3);
        len3 = length(data3);
        if len3 ~= 0
            Variance3(j) = ((s3 / len3) - result3(j))^2 + Variance3(j);
        end      
    end
end
Variance3 = sqrt(Variance3)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result3(:,1),Variance3, '--om','LineWidth',linearWidth);
hold on


result4 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance4 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid4);
        data4 = [C4{5}];                         %%ȡ����5��Ԫ��
        s4 = sum(data4);
        len4 = length(data4);
        if len4 ~= 0
            result4(j) = (s4 / len4) + result4(j);
        end 
    end
end
result4 = result4./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid4);
        data4 = [C4{5}];                         %%ȡ����5��Ԫ��
        s4 = sum(data4);
        len4 = length(data4);
        if len4 ~= 0
            Variance4(j) = ((s4 / len4) - result4(j))^2 + Variance4(j);
        end      
    end
end
Variance4 = sqrt(Variance4)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result4(:,1),Variance4, '--sr','LineWidth',linearWidth);
legend('Flooding', 'Random', 'FGOR based on relative position model', 'FGOR based on mobility gradient model','Location','northeast');




