load conics.txt
c = fit_conic(conics);
x = conics(:,1);
y = conics(:,2);
scatter(x,y)
hold on
fimplicit(@(x,y) c(1)*x^2 + c(2)*x*y + c(3)*y^2 + c(4)*x + c(5)*y + c(6))
xlabel('x')
ylabel('y')

function c = fit_conic(pts)
    x = pts(:,1);
    y = pts(:,2);
    A = [x.^2, x.*y, y.^2, x, y, ones(size(x))];
    [U, S, V] = svd(A);
    c = V(:,length(V)); % last column is the null vector
end


