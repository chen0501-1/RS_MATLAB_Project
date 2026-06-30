function all_msg = a_msg()
% 生成GF(8)下全部3位信息元组合，共8^3=512组
all_msg = zeros(512,3);
idx = 1;
% 三重循环遍历0~7全部组合
for i0 = 0:7
    for i1 = 0:7
        for i2 = 0:7
            all_msg(idx,:) = [i0,i1,i2];
            idx = idx + 1;
        end
    end
end
end