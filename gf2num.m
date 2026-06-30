function num = gf2num(gf_vec)
    % GF(2)多项式系数向量转十进制整数
    % gf_vec：二进制系数数组，gf_vec(1)为最高次项系数
    num = 0;
    len = length(gf_vec);
    for i = 1:len
        bit = gf_vec(i);
        power = len - i;
        num = num + bit * (2 ^ power);
    end
    end
    
    %测试代码
    v1 = [1 0 1];
    n1 = gf2num(v1)
    
    v2 = [1 1 0 1];
    n2 = gf2num(v2)