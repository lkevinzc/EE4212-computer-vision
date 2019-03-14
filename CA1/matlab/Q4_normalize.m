function [ normalized_pts, T_s ] = normalize( pts )
%   Input: points on an image
%   Output: normalized points for the use of eight_point_algo
    n = size(pts, 1);
    centroid = sum(pts, 1) / n;
    disp('The centroid is');
    disp(centroid);
    
    pts_demean = pts - centroid;
    
    squared_distance_sum = sum(sum(pts_demean.^2));
    
    scale_factor = sqrt(mean(squared_distance_sum) / 2);    % scale to sqrt(2)
    
    normalized_pts = pts_demean / scale_factor;
    
    disp('Check for the RMS average distance:');
    disp(sqrt(mean(sum(sum(normalized_pts.^2)))));
    
    % x' = s * (x + t_x) ; y' = s * (y + t_y)
    t_x = -centroid(1);
    t_y = -centroid(2);
    s = 1 / scale_factor;
    
    T_s = [s 0 s*t_x; 0 s s*t_y; 0 0 1];
    disp('The similarity transformation is');
    disp(T_s);

end