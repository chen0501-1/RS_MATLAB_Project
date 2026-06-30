function dis = rscode_dis(c1,c2)
dis = 0;
for i=1:7
    x = bitxor(c1(i),c2(i));
    dis = dis + sum(de2bi(x,3));
end
end