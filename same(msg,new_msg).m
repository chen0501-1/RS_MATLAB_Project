function a = same(msg,new_msg)
    % 统计译码正确的码元总数量
    temp = 0;
    [N,M] = size(msg);
    for i = 1:N
        for j = 1:M
            if msg(i,j) == new_msg(i,j)
                temp = temp + 1;
            end
        end
    end
    a = temp;
    end