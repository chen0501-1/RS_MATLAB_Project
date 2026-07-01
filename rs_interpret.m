function out_msg = rs_interpret(rx_code,all_code,all_info)
    N = size(all_code,1);
    dist = zeros(1,N);
    for i=1:N
        dist(i) = rscode_dis(rx_code, all_code(i,:));
    end
    [~,idx] = min(dist);
    out_msg = all_info(idx,:);
    end