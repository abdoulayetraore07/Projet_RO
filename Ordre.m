function [Q] =Ordre(P,s,t,tc)
 chem = zeros(tc(1),1);
 chem(1,1) = t;
 k = t;
 cmt = 2;
 while P(k,1) ~= s      
          k = P(k,1);
          chem(cmt,1) = k;
          cmt = cmt+1;
 end
 chem(cmt,1) = s;
 c = 0;
 for i = 1:tc(1) 
      if chem(i,1) ~= 0
         c = c+1;
      end
end
 for i = 1:c
      Q(i,1) = chem(c-i+1,1);
 end      