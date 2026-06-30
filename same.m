% same.m
function flag = same(a,b)
% 判断两个GF(2)数组是否完全相同11
% flag=1 相同；flag=0 不同
    % 长度不同直接判定不等
    if length(a) ~= length(b)
        flag = 0;
        return;
    end
    % 逐位异或，存在1则不相等
    xor_res = xor(a,b);
    flag = ~any(xor_res);
end