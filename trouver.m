function[reponse,indice]=trouver(P,i,tP)
reponse=false;
indice=1;
for j=1:tP
    if P(j,1)==i
        reponse=true;
        indice=j;
    end
end