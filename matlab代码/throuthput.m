clear all;              %%清除工作空间的所有变量
linearWidth = 1.2;      %线条宽度
all_nodeNums = [10; 20; 30; 40; 50; 60; 70; 80; 90; 100];
filesNum = 15;          %实验的次数
nodeNum = 10;           %实验节点的次数
zValue = 1.96;          %置信区间的z值
duration = 15;          %仿真总时长 
%%做了20组实验，每组实验取10个点
result1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance1 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid1);
        dataRx1 = [C1{7}];                         %%取出第7个元素
        result1(j) = (length(dataRx1) * 100 / duration) + result1(j);  
    end
end
result1 = result1./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid1);
        dataRx1 = [C1{7}];                         %%取出第7个元素
        Variance1(j) = ((length(dataRx1) * 100 / duration) - result1(j))^2 + Variance1(j);
    end
end
Variance1 = sqrt(Variance1)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result1(:,1),Variance1, '--xg','LineWidth',linearWidth);
ylabel('Throuthput(byte/s)');
xlabel('Number of nano-nodes(n)');
% % ylabel('系统吞吐量(比特/秒)');
% % xlabel('纳米节点数量(个)');
hold on


result2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid3);
        dataRx2 = [C3{7}];                         %%取出第7个元素
        result2(j) = (length(dataRx2) * 100 / duration) + result2(j); 
    end
end
result2 = result2./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid3);
        dataRx2 = [C3{7}];                         %%取出第7个元素
        Variance2(j) = (length(dataRx2) * 100 / duration - result2(j))^2 + Variance2(j);
    end
end
Variance2 = sqrt(Variance2)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result2(:,1),Variance2, '--db','LineWidth',linearWidth);
hold on


result3 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance3 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid5);
        dataRx3 = [C5{7}];                         %%取出第7个元素
        result3(j) = (length(dataRx3) * 100 / duration) + result3(j); 
    end
end
result3 = result3./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid5);
        dataRx3 = [C5{7}];                         %%取出第7个元素
        Variance3(j) = (length(dataRx3) * 100 / duration - result3(j))^2 + Variance3(j); 
    end
end
Variance3 = sqrt(Variance3)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result3(:,1),Variance3, '--om','LineWidth',linearWidth);
hold on


result4 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance4 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid7);
        dataRx4 = [C7{7}];                         %%取出第7个元素
        result4(j) = (length(dataRx4) * 100 / duration) + result4(j); 
    end
end
result4 = result4./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid7);
        dataRx4 = [C7{7}];                         %%取出第7个元素
        Variance4(j) = (length(dataRx4) * 100 / duration - result4(j))^2 + Variance4(j); 
    end
end
Variance4 = sqrt(Variance4)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result4(:,1),Variance4, '--sr','LineWidth',linearWidth);
legend('Flooding', 'Random', 'FGOR based on relative position model', 'FGOR based on mobility gradient model','Location','northwest');




