function Create_Sys_kuramoto(N,A)

    fileID = fopen('SK_model.m','w+');
    fprintf(fileID,'%0s\n','function dy=SK_model(t,x, alpha, omega, K1, K2 )');
    fprintf(fileID,'%0s','dy=zeros(');
    fprintf(fileID,'%0d',N);
    fprintf(fileID,'%0s\n',',1);');
    for i=1:N
        fprintf(fileID,'%0s','dy(');
        fprintf(fileID,'%0d',i);
         fprintf(fileID,'%0s',')=');
         fprintf(fileID,'%0s','omega(');
            fprintf(fileID,'%0d',i);
             fprintf(fileID,'%0s',')');
         for j=1:N
             if (A(i,j)~=0 & i~=j)
                   fprintf(fileID,'%0s','+K1*');
                   fprintf(fileID,'%0s','(sin');
                   fprintf(fileID,'%0s','(x(');
                   fprintf(fileID,'%0d',j);
                   fprintf(fileID,'%0s',')-x(');
                   fprintf(fileID,'%0d',i);
                   fprintf(fileID,'%0s',')-alpha');
                   fprintf(fileID,'%0s','))');
                   for l=1:N
                       if(A(i,l)~=0 & A(j,l)~=0)
                           fprintf(fileID,'%0s','+K2*');
                           fprintf(fileID,'%0s','0.5*');
                           fprintf(fileID,'%0s','(sin');
                           fprintf(fileID,'%0s','(2*');
                           fprintf(fileID,'%0s','x(');
                           fprintf(fileID,'%0d',j);
                           fprintf(fileID,'%0s',')-x(');
                           fprintf(fileID,'%0d',l);
                           fprintf(fileID,'%0s',')-x(');
                           fprintf(fileID,'%0d',i);
                           fprintf(fileID,'%0s',')-alpha))');
                       end
                   end
             end
         end
         fprintf(fileID,'%0s\n',';');
    end
    fclose(fileID);
end
