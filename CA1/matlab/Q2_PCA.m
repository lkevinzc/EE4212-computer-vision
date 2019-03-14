X = [];
Files=dir('*.png');
for k=1:length(Files)
   FileNames=Files(k).name;
   I = im2double(imread(FileNames));
   I = I(:);
   X = [X I];
end
mean_X = mean(X, 2);
de_mean_X = X - mean_X;

[U S V] = svd(de_mean_X,0); % to produce "economy size"
X_PCAed = U(:,1:10) * S(1:10, :) * V';
X_reconstructed = X_PCAed + meanX;
for i=1:150
    Mat = X_reconstructed(:,i);
    Name = strcat('img_', int2str(i), '.png');
    imwrite(reshape(Mat, [161, 261]) ,Name,'png');
end
