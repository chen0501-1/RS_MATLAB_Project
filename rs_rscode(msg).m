function code = rs_rscode(msg)
    % msg: N行3列数字矩阵，元素0~7
    g_mat = [1 0 0 3 2 1 3;
             0 1 0 5 5 1 4;
             0 0 1 7 6 1 6];
    % GF(8)矩阵乘法，模2^3本原多项式 x^3+x+1
    [n,k] = size(msg);
    code = zeros(n,7);
    for i = 1:n
        info = msg(i,:);
        temp = mod(info * g_mat, 8);
        code(i,:) = temp;
    end
    end