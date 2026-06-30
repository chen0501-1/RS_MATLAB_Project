% 预生成全部码本
all_msg = a_msg();
all_code = rs_rscode(all_msg);

% 生成测试信息（纯数字0~7）
msg = floor(rand(5,3)*8);
code = rs_rscode(msg);

% 加噪声（随机替换码元）
rx_code = code;
err_pos = randi(7,5,2);
for i=1:5
    rx_code(i,err_pos(i,1)) = randi(7);
    rx_code(i,err_pos(i,2)) = randi(7);
end

% 逐行译码
new_msg = zeros(5,3);
for ii=1:5
    new_msg(ii,:) = rs_interpret(rx_code(ii,:),all_code,all_msg);
end

% 统计正确率
correct_num = same(msg,new_msg);
total_bit = size(msg,1)*size(msg,2);
correct_rate = correct_num / total_bit;

disp("原始信息：");disp(msg);
disp("加噪接收码字：");disp(rx_code);
disp("译码恢复信息：");disp(new_msg);
disp("译码正确率：");disp(correct_rate);