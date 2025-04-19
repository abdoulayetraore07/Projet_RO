function [cout,P] = Algo_Dij(A,s,t,centers,radii)
if s==t
    cout='Impossible de trouver un chemin entre les deux sommets';
    P=zeros(1,1);
else 
ta = size(A);
D = zeros(ta(1),1);
D(:,1) = Inf;
D(s,1) = 0;
M = zeros(ta(1),1);
M(s,1) = 1;
P = zeros(ta(1),1);
for j = 1:ta 
    if A(s,j) ~= 0
        D(j,1) = A(s,j);
        P(j,1) = s;
    end
end

while M(t,1) == 0
    mini = inf;
    b = 0;
    for a = 1:ta 
        if M(a,1) == 0
            if mini > D(a,1)
                mini = D(a,1);
                b = a;
            end
        end
    end
    k = b; 
    for j = 1:ta
        if A(k,j) ~= 0
            if D(j,1) > D(k,1) + A(k,j)
                D(j,1) = D(k,1) + A(k,j);
                P(j,1) = k;
            end
        end
    end
    M(k,1) = 1;
end

P=Ordre(P,s,t,ta);
cout = D(t,1);

graphique(A,P,centers, radii,cout)

end





        




