%a = [2 4 -6 -4;1 5 3 10; 1 3 2 5]% 3.1a
%a = [1 1 -6 7;1 2 9 2;1 2 3 10]% 3.1b
%a = [4 8 4 0 8;1 5 4 -3 -4;1 4 7 2 10;1 3 0 -2 4]% 3.1 c
a=[1 6 2 0 2; 1 6 1 1 0; 2 1 3 0 1; 3 2 4 -1 1]% original
n=size(a)
for i=1:n(1)-1 % move to new pivots & shifts rows
    if abs(a(i,i)) < 0.000001 % check if pivot is zero and swap rows
        atemp=a(i, :);%extracts ith row
        for k=i+1:n(1)
            a(k-1,:) = a(k,:);% replaces previous row with next row
        end
        a(n(1),:) = atemp;
        a %by the end all rows move up 1, row 1 goes to 4
    end
    for j=i+1:n(1) %move down the rows
        if abs(a(j,i)) > 0.00001 % make sure the row element is not already zero
            fac=a(i,i)/a(j,i);%factor between two rows
            for m=i:n(2) %move across a row
                a(j,m)=fac*a(j,m)-a(i,m);%scales each entry and subtracts
            end
            a
        end
    end
    
end
sol = zeros(1,n(1));
for z = n(1):-1:1
    temp = a(z,n(2));
    for w = n(1):-1:z+1
        temp = temp - a(z,w)*sol(w);
    end
    sol(z) = temp / a(z,z);
end    
disp(sol);
