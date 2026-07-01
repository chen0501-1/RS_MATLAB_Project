% RS(7,3)编译码仿真主程序
% 组长：陈海阳
% 功能：统筹编码、信道噪声、译码、正确率统计全仿真流程
% 依赖子函数：a_msg.m、rs_rscode.m、rs_interpret.m、gf2num.m、gf_dis.m、rs_code_dis.m、same.m
clear; clc; close all;

%% 1 预加载全部标准信息与完整码字库
all_msg = a_msg();
all_msg_gf = gf(all_msg,3);
all_code_lib = rs_rscode(all_msg_gf);

%% 2 设置仿真测试组数，生成随机原始信息
test_num = 5;
raw_msg = floor(rand(test_num,3)*8);
msg_gf = gf(raw_msg,3);
disp('原始发送信息序列：');
disp(raw_msg);

%% 3 调用编码模块生成7位RS码字
code_out = rs_rscode(msg_gf);
disp('编码完成码字：');
disp(code_out.x);

%% 4 模拟信道叠加随机传输噪声
zero_noise = zeros(test_num,5);
rand_err = floor(rand(test_num,2)*8);
noise_mat = [zero_noise, rand_err];
noise_gf = gf(noise_mat,3);
recv_code = code_out + noise_gf;
disp('叠加噪声后的接收码字：');
disp(recv_code.x);

%% 5 循环调用译码模块纠错还原信息
decode_result = zeros(test_num,3);
for idx = 1:test_num
    decode_result(idx,:) = rs_interpret(recv_code(idx,:), all_code_lib, all_msg);
end
disp('译码还原信息：');
disp(decode_result);

%% 6 调用比对函数统计译码正确率
total_bits = test_num * 3;
correct_cnt = same(raw_msg, decode_result);
acc_rate = correct_cnt / total_bits;

%% 7 格式化输出仿真统计结果
fprintf('\n====仿真数据汇总====\n');
fprintf('总码元数量：%d \n', total_bits);
fprintf('译码正确码元：%d \n', correct_cnt);
fprintf('整体译码正确率：%.4f \n', acc_rate);