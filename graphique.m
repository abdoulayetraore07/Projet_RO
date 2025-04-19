function[]=graphique(A,P,centers, radii,cout)

[ta,tp]=cercle(centers,radii,A,P,cout);
 arete(A,P,centers, radii,ta(1),tp(1));


function[ta,tp]=cercle(centers,radii,A,P,cout)
      ta=size(A);
      tp=size(P);
      mot1=strcat("       Valeur optimale : " ,num2str(cout));
      mot2=strcat("  Départ : " ,num2str(P(1)));
      mot3=strcat("       Arrivée : " ,num2str(P(tp(1))));
      mot=strcat(mot2,mot3,mot1);
      title(mot,'color','blue','Fontsize',13);
      for i=1:ta(1)
            [ reponse,indice ] = trouver(P,i,tp(1));
            if reponse == true
                if  ( indice==1 ||  indice== tp(1) )
                  if indice==1
                     viscircles(centers(i,:), radii(i,1), 'color','green');
                     text(centers(i,1),centers(i,2),num2str(i),'color','green','Fontsize',24,'HorizontalAlignment','center')
                  else 
                     viscircles(centers(i,:), radii(i,1), 'color','red');
                     text(centers(i,1),centers(i,2),num2str(i),'color','red','Fontsize',24,'HorizontalAlignment','center')
                  end
                else 
                    viscircles(centers(i,:), radii(i,1), 'color','blue');
                    text(centers(i,1),centers(i,2),num2str(i),'color','blue','Fontsize',24,'HorizontalAlignment','center')          
                end 
            else 
                 viscircles(centers(i,:), radii(i,1), 'color','black');
                 text(centers(i,1),centers(i,2),num2str(i),'Fontsize',24,'HorizontalAlignment','center','color','black')
            end
      end  
      
      
        

function[]=arete(A,P,centers, radii,ta,tp)
for i=1:ta
          for j=1:ta
              if A(i,j)==0
                 continue
              else 
                   x1=centers(i,1);
                   y1=centers(i,2);
                   x2=centers(j,1);
                   y2=centers(j,2);
                   norme=norm([x2-x1,y2-y1],2);
                   teta=asind((y2-y1)/norme);
                   if x2>x1
                       x1=x1+radii(i,1)*abs(cosd(teta));
                       x2=x2-radii(j,1)*abs(cosd(teta));
                   else 
                       x1=x1-radii(i,1)*abs(cosd(teta));
                       x2=x2+radii(j,1)*abs(cosd(teta));
                       
                   end 
                   if y2>y1
                       y1=y1+radii(i,1)*abs(sind(teta));
                       y2=y2-radii(j,1)*abs(sind(teta)); 
                      
                   else 
                       y1=y1-radii(i,1)*abs(sind(teta));
                       y2=y2+radii(j,1)*abs(sind(teta)); 
                       
                   end
                   if x1==x2
                       X=[x1,x2];
                       Y=[y1,y2];
                   else 
                       a=(y2-y1)/(x2-x1);
                       b=y1-a*x1;
                       X=[x1,x2];
                       Y=a*X+b;
                   end
                   [reponse, indice]=trouver(P,i,tp);
                   if reponse==true 
                       if indice>tp-1
                           hold on
                           plot(X,Y,'color','black','LineWidth',1.5);
                           couleur='black';
                           fleche(x1,x2,y1,y2,i,j,A,couleur);    
                       else
                           if  P(indice+1)==j
                               hold on
                               plot(X,Y,'color','blue','LineWidth',1.5);
                               couleur='blue';
                               fleche(x1,x2,y1,y2,i,j,A,couleur);    
                           else 
                              hold on
                              couleur='black';
                              plot(X,Y,'color','black','LineWidth',1.5);
                              fleche(x1,x2,y1,y2,i,j,A,couleur);    
                           end
                       end
                   else
                      hold on
                      couleur='black';
                      plot(X,Y,'color','black','LineWidth',1.5);
                      fleche(x1,x2,y1,y2,i,j,A,couleur);  
                   end                                                                
              end
          end
end 
                   
                  
                
                                              
function[]=fleche(x1,x2,y1,y2,i,j,A,couleur)    
  x10=x1 ; x20=x2 ; y10=y1; y20=y2;                              %%Opter pour une enumeration des differents cas.
  if x2>x1 && y2>y1               
                      x3=x2-0.25;
                      y3=y2+0.05;
                      x4=x2-0.033;
                      y4=y2-0.25;
                      a1=(y3-y2)/(x3-x2);
                      a2=(y4-y2)/(x4-x2);
                      text((x10+x20)/2 - 0.12 ,(y10+y20)/2 + 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                   else 
                       if x2>x1 && y2<y1
                      x3=x2-0.27;
                      y3=y2+0.02;
                      x4=x2-0.027;
                      y4=y2+0.25;
                      a1=(y3-y2)/(x3-x2);
                      a2=(y4-y2)/(x4-x2);
                      text((x10+x20)/2 - 0.12 ,(y10+y20)/2 - 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                       else 
                           if x2>x1 && y2==y1
                              x3=x2-0.2;
                              y3=y2+0.2;
                              x4=x2-0.2;
                              y4=y2-0.2;
                              a1=(y3-y2)/(x3-x2);
                              a2=(y4-y2)/(x4-x2);
                              text((x10+x20)/2  ,(y10+y20)/2 - 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                           else 
                                 if x2<x1 && y2>y1               
                                    x3=x2+0.01;
                                    y3=y2-0.2;
                                    x4=x2+0.21;
                                    y4=y2+0.08;
                                    a1=(y3-y2)/(x3-x2);
                                    a2=(y4-y2)/(x4-x2);
                                    text((x10+x20)/2 + 0.12 ,(y10+y20)/2 + 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                                 else 
                                      if x2<x1 && y2<y1
                                         x3=x2+0.1;
                                         y3=y2+0.35;
                                         x4=x2+0.35;
                                         y4=y2-0.009;
                                         a1=(y3-y2)/(x3-x2);
                                         a2=(y4-y2)/(x4-x2);
                                         text((x10+x20)/2 + 0.12 ,(y10+y20)/2 - 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                                      else 
                                            if x2<x1 && y2==y1
                                                x3=x2+0.2;
                                                y3=y2+0.2;
                                                x4=x2+0.2;
                                                y4=y2-0.2;
                                                a1=(y3-y2)/(x3-x2);
                                                a2=(y4-y2)/(x4-x2);
                                                text((x10+x20)/2  ,(y10+y20)/2 + 0.12,num2str(A(i,j)),'color','black','Fontsize',18);
                                            else 
                                                  if x2==x1 && y2>y1               
                                                      x3=x2+0.2;
                                                      y3=y2-0.2;
                                                      x4=x2-0.2;
                                                      y4=y2-0.2; 
                                                      a1=(y3-y2)/(x3-x2);
                                                      a2=(y4-y2)/(x4-x2);
                                                      text((x10+x20)/2 + 0.12 ,(y10+y20)/2 ,num2str(A(i,j)),'color','black','Fontsize',18);
                                                     
                                                  else 
                                                        x3=x2+0.2;
                                                        y3=y2+0.2;
                                                        x4=x2-0.2;
                                                        y4=y2+0.2;
                                                        a1=(y3-y2)/(x3-x2);
                                                        a2=(y4-y2)/(x4-x2);
                                                        text((x10+x20)/2 - 0.12 ,(y10+y20)/2 ,num2str(A(i,j)),'color','black','Fontsize',18);
                                                  end
                                            end
                                      end
                                 end
                           end
                       end
  end
                   X1=[x2,x3];
                   Y1=a1*X1+ y2-a1*x2;
                   X2= [x2,x4];
                   Y2=a2*X2+ y2-a2*x2;
                   hold on
                   plot(X1,Y1,'color',couleur,'LineWidth',1.2);
                   hold on
                   plot(X2,Y2,'color',couleur,'LineWidth',1.2);
              
                   
             
                