clear all;              %%��������ռ�����б���
linearWidth = 1.2;      %�������
all_nodeNums = [10; 20; 30; 40; 50; 60; 70; 80; 90; 100];
filesNum = 5;          %ʵ��Ĵ���
nodeNum = 10;           %ʵ��ڵ�Ĵ���
zValue = 1.96;          %���������zֵ
%%����20��ʵ�飬ÿ��ʵ��ȡ10����
result1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_energy',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid1);
        data1 = [C1{3}];                         %%ȡ����3��Ԫ��
        s1 = sum(data1);
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid2);
        data2 = [C2{3}];                         %%ȡ����3��Ԫ��
        len1 = length(data2);
        if len1 ~= 0
            result1(j) = (s1 / len1) + result1(j);
        end 
    end
end
result1 = result1./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_energy',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid1);
        data1 = [C1{3}];                         %%ȡ����3��Ԫ��
        s1 = sum(data1);
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid2);
        data2 = [C2{3}];                         %%ȡ����3��Ԫ��
        len1 = length(data2);
        if len1 ~= 0
            Variance1(j) = ((s1 / len1) - result1(j))^2 + Variance1(j);
        end
    end
end
Variance1 = sqrt(Variance1)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result1(:,1),Variance1, '--xg','LineWidth',linearWidth);
ylabel('Transmission average energy comsumption(pJ)'); xlabel('Number of nano-nodes(n)');
% ylabel('���ݰ�����ƽ���ܺ�(pJ)');
% xlabel('���׽ڵ�����(��)');
hold on


result2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_energy',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid3);
        data3 = [C3{3}];                         %%ȡ����3��Ԫ��
        s2 = sum(data3);
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid4);
        data4 = [C4{3}];                         %%ȡ����3��Ԫ��
        len2 = length(data4);
        if len2 ~= 0
            result2(j) = (s2 / len2) + result2(j);
        end  
    end
end
result2 = result2./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_energy',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid3);
        data3 = [C3{3}];                         %%ȡ����3��Ԫ��
        s2 = sum(data3);
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid4);
        data4 = [C4{3}];                         %%ȡ����3��Ԫ��
        len2 = length(data4);
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
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_energy',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid5);
        data5 = [C5{3}];                         %%ȡ����3��Ԫ��
        s3 = sum(data5);
        file6 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid6 = fopen(file6);
        C6 = textscan(fid6, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid6);
        data6 = [C6{3}];                         %%ȡ����3��Ԫ��
        len3 = length(data6);
        if len3 ~= 0
            result3(j) = (s3 / len3) + result3(j);   
        end 
    end
end
result3 = result3./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_energy',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid5);
        data5 = [C5{3}];                         %%ȡ����3��Ԫ��
        s3 = sum(data5);
        file6 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid6 = fopen(file6);
        C6 = textscan(fid6, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid6);
        data6 = [C6{3}];                         %%ȡ����3��Ԫ��
        len3 = length(data6);
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
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_energy',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid7);
        data7 = [C7{3}];                         %%ȡ����3��Ԫ��
        s4 = sum(data7);
        file8 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid8 = fopen(file8);
        C8 = textscan(fid8, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid8);
        data8 = [C8{3}];                         %%ȡ����3��Ԫ��
        len4 = length(data8);
        if len4 ~= 0
            result4(j) = (s4 / len4) + result4(j);   
        end 
    end
end
result4 = result4./filesNum;            %�����ֵ���飬Ȼ���������׼���
for i = 1:filesNum
    for j=1:nodeNum
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_energy',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid7);
        data7 = [C7{3}];                         %%ȡ����3��Ԫ��
        s4 = sum(data7);
        file8 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid8 = fopen(file8);
        C8 = textscan(fid8, '%f%f%f%f%f%f%f');          %%����fidΪfopen����ص��ļ���ʶ����formatʵ���Ͼ���һ���ַ�����������ʾ��ȡ���ݼ�����ת���Ĺ���
        fclose(fid8);
        data8 = [C8{3}];                         %%ȡ����3��Ԫ��
        len4 = length(data8);
        if len4 ~= 0
            Variance4(j) = ((s4 / len4) - result4(j))^2 + Variance4(j);   
        end   
    end
end
Variance4 = sqrt(Variance4)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result4(:,1),Variance4, '--sr','LineWidth',linearWidth);
legend('Flooding', 'Random', 'FGOR based on relative position model', 'FGOR based on mobility gradient model','Location','northwest');




