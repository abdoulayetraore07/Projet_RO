function [cout,P] = BL(A,s,t,centers,radii)

if s==t
    cout='Impossible de trouver un chemin entre les deux sommets';
    P=zeros(1,1);
else
    dimA = size(A);
    ta = dimA(1,1);
    c1 = zeros(ta,1);
    P = zeros(ta,1);
    
    for j=1:ta
        if A(s,j) == 0
            c1(j,1) = inf;
        else 
            c1(j,1) = A(s,j);
        end
    end
    c1(s,1) = 0;
    c2 = c1 ;
    
for n=1:ta-1
    for k=2:ta
        if c1(k,1) ~= inf
            for j=2:ta
                if (A(k,j) ~= 0) && (c2(j,1) > c1(k,1) + A(k,j)) 
                    c2(j,1) = c1(k,1) + A(k,j);
                    if A(s,k) ~= 0
                        P(k,1) = s ;
                    end
                    if c1(j,1) ~= c2(j,1)
                        P(j,1) = k;
                    end
                end 
            end
        end 
    end
    
    for i=2:ta
        c1(i,1) = min(c1(i,1),c2(i,1)); 
    end
    
end

P=Ordre(P,s,t,dimA);
cout = c2(t,1);
graphique(A,P,centers, radii,cout)

end
    
