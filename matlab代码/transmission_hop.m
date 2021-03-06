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
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_phyTx',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid1);
        data1 = [C1{1}];                         %%取出第1个元素
        len1 = length(data1);
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid2);
        data2 = [C2{7}];                        %%取出第7个元素
        len2 = length(data2); 
        if len2 ~= 0
            result1(j) = (len1 / len2) + result1(j); 
        end          
    end
end
result1 = result1./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file1 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_phyTx',num2str(j), '.log'];
        fid1 = fopen(file1);
        C1 = textscan(fid1, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid1);
        data1 = [C1{1}];                         %%取出第1个元素
        len1 = length(data1);
        file2 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\flooding_Rx', num2str(j), '.log'];
        fid2 = fopen(file2);
        C2 = textscan(fid2, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid2);
        data2 = [C2{7}];                        %%取出第7个元素
        len2 = length(data2);
        if len2 ~= 0
            Variance1(j) = ((len1 / len2) - result1(j))^2 + Variance1(j); 
        end       
    end
end
Variance1 = sqrt(Variance1)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result1(:,1),Variance1, '--xg','LineWidth',linearWidth);
ylabel('Average hops(times)');
xlabel('Number of nano-nodes(n)');
% ylabel('数据包传输平均跳数(次)');
% xlabel('纳米节点数量(个)');
hold on


result2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
Variance2 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_phyTx',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid3);
        data3 = [C3{1}];                         %%取出第1个元素
        len3 = length(data3);
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid4);
        data4 = [C4{7}];                        %%取出第7个元素
        len4 = length(data4); 
        if len4 ~= 0
            result2(j) = (len3 / len4) + result2(j); 
        end
    end
end
result2 = result2./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file3 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_phyTx',num2str(j), '.log'];
        fid3 = fopen(file3);
        C3 = textscan(fid3, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid3);
        data3 = [C3{1}];                         %%取出第1个元素
        len3 = length(data3);
        file4 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\random_Rx', num2str(j), '.log'];
        fid4 = fopen(file4);
        C4 = textscan(fid4, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid4);
        data4 = [C4{7}];                        %%取出第7个元素
        len4 = length(data4);
        if len4 ~= 0
            Variance2(j) = ((len3 / len4) - result2(j))^2 + Variance2(j);
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
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_phyTx',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid5);
        temp = [C5{1}];                         %%取出第1个元素
        idx = find(temp(:,1)~=0);               %%取非零列元素
        data5 = temp(idx,:);
        len5 = length(data5);
        file6 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid6 = fopen(file6);
        C6 = textscan(fid6, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid6);
        data6 = [C6{7}];                        %%取出第7个元素
        len6 = length(data6); 
        if len6 ~= 0
            result3(j) = (len5 / len6) + result3(j);
        end     
    end
end
result3 = result3./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file5 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_phyTx',num2str(j), '.log'];
        fid5 = fopen(file5);
        C5 = textscan(fid5, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid5);
        temp = [C5{1}];                         %%取出第1个元素
        idx = find(temp(:,1)~=0);               %%取非零列元素
        data5 = temp(idx,:);
        len5 = length(data5);
        file6 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\relative_pos_Rx', num2str(j), '.log'];
        fid6 = fopen(file6);
        C6 = textscan(fid6, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid6);
        data6 = [C6{7}];                        %%取出第7个元素
        len6 = length(data6); 
        if len6 ~= 0
            Variance3(j) = ((len5 / len6) - result3(j))^2 + Variance3(j);
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
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_phyTx',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid7);
        temp = [C7{1}];                         %%取出第1个元素
        idx = find(temp(:,1)~=0);               %%取非零列元素
        data7 = temp(idx,:);
        len7 = length(data7);
        file8 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid8 = fopen(file8);
        C8 = textscan(fid8, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid8);
        data8 = [C8{7}];                        %%取出第7个元素
        len8 = length(data8); 
        if len8 ~= 0
            result4(j) = (len7 / len8) + result4(j);
        end     
    end
end
result4 = result4./filesNum;            %求出均值数组，然后下面求标准误差
for i = 1:filesNum
    for j=1:nodeNum
        file7 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_phyTx',num2str(j), '.log'];
        fid7 = fopen(file7);
        C7 = textscan(fid7, '%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid7);
        temp = [C7{1}];                         %%取出第1个元素
        idx = find(temp(:,1)~=0);               %%取非零列元素
        data7 = temp(idx,:);
        len7 = length(data7);
        file8 = ['D:\professional_install\matlab\bin\project_files\relative_position_chen\log', num2str(i),'\mobility_gradient_Rx', num2str(j), '.log'];
        fid8 = fopen(file8);
        C8 = textscan(fid8, '%f%f%f%f%f%f%f');          %%其中fid为fopen命令返回的文件标识符，format实际上就是一个字符串变量，表示读取数据及数据转换的规则。
        fclose(fid8);
        data8 = [C8{7}];                        %%取出第7个元素
        len8 = length(data8); 
        if len8 ~= 0
            Variance4(j) = ((len7 / len8) - result4(j))^2 + Variance4(j);
        end       
    end
end
Variance4 = sqrt(Variance4)./filesNum*zValue;
errorbar(all_nodeNums(:,1), result4(:,1),Variance4, '--sr','LineWidth',linearWidth);
legend('Flooding', 'Random', 'FGOR based on relative position model', 'FGOR based on mobility gradient model','Location','northwest');




