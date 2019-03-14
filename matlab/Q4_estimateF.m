function F = estimateF(x1, x2)
    % x1 and x2 are each 2 x n matrices with the 
    % columns corresponding to the coordinates in the first
    % and the second image respectively
    pts1 = x1';
    pts2 = x2';
    
    [n_pts1, T_s1] = normalize(pts1);
    [n_pts2, T_s2] = normalize(pts2);
    
    % construct A
    A = [n_pts2(:,1).*n_pts1(:,1) n_pts2(:,1).*n_pts1(:,2) n_pts2(:,1) n_pts2(:,2).*n_pts1(:,1) n_pts2(:,2).*n_pts1(:,2) n_pts2(:,2) n_pts1(:,1) n_pts1(:,2) ones(size(n_pts1(:,1)))];
    
    % from svd(A), get F
    [U, S, V] = svd(A);
    F_temp = V(:,length(V));
    F_temp = reshape(F_temp, [3,3])';
    % enforce F singularity
    [U_f, S_f, V_f] = svd(F_temp);
    S_f(3,3) = 0;
    F_prime = U_f * S_f * V_f';
    
    %denormalization
    F = T_s2' * F_prime * T_s1;
    disp('The fundamental matrix is:')
    disp(F)
    
end
