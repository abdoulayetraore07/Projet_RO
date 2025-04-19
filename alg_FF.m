function [max_flot,P,C] = alg_FF(A,s,t,centers,radii)
     C=A;    %% Conserver la matrice d'adjacence A dès le ébut pour la répresentation graphique;
    [lA,cA] = size(A);
    F = zeros([lA,cA]); %matrice d'adjacence du flot max
    max_flot = 0;
    a = true;
    compteur=0;
    while a
    u = findPath(A); %trouver une chaine augmentante
    cmt = 0;
    
    v = zeros(lA,1); %vecteur de chaine augmentante mis dans le bon sens
    for i = 1:lA
        if u(i)~=0 
            cmt = cmt+1;
        end
    end
    
    for j = 1:cmt
        v(j,1) = u(cmt-j+1);
    end
    
    if v(1,1) == 0  %condition de sortie du while (plus de chemin possible)
        a = false;
        continue;
    end 
    mini = A(s,v(2,1));
   
    for i = 1:cmt-1 
        if v(i,1) ~= 0 && A(v(i,1),v(i+1,1)) < mini
            mini = A(v(i,1),v(i+1,1)); 
        end
    end
        j = 1;
        while v(j,1) ~= t
            A(v(j,1),v(j+1,1)) = A(v(j,1),v(j+1,1)) - mini;
            A(v(j+1,1),v(j,1)) = A(v(j+1,1),v(j,1)) + mini;
            F(v(j,1),v(j+1,1)) = F(v(j,1),v(j+1,1)) + mini;
            j = j+1;
        end
        max_flot = max_flot + mini;
        compteur=compteur+1;   
        for i=1:cA
            P(i,compteur)=v(i,1);
        end
        cout(compteur,1)=mini; 
    end 
 
    
 for j=1:compteur          %% Répresentation graphique des differentes chaines augmentantes trouvées;
     for  i=1:cA           
                 v(i,1)=P(i,j);
     end
     I = find(v,1,'last');                          %% Élimination des éléments nuls de la chaine;
     chem=v(1:I,1);
     figure
     graphique(C,chem,centers, radii,cout(j,1))
      mot=strcat("Flot maximal : " ,num2str(max_flot));
      xlabel(mot,'color','blue','Fontsize',15);
end
    
   
    
    
    
%Fonction pour trouver des chaines augmentantes (trouvée sur internet car on
%n'arrivait pas à la faire en incluant le marquage négatif de noeud ). Sur mathwork.com
function fl = findPath(A)           
        q = zeros(1,lA);           
        pred = zeros(1,lA);            
        front = 1; back = 2;
        pred(s) = s; q(front) = s;
        while front ~= back
            v = q(front);
            front = front + 1;
            for i = 1:lA
                if pred(i) == 0 && A(v,i) > 0
                    q(back) = i;
                    back = back + 1;
                    pred(i) = v;
                end
            end
        end
        path = zeros(1,lA);
        if pred(t) ~= 0
            i = t; c = 1;
            while pred(i) ~= i
                path(c) = i;
                c = c + 1;
                i = pred(i);
            end
            path(c) = s;
        end
        fl = path;
    end
end
