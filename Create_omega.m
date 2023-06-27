function omega=Create_omega(A,K1_t,K2_t,alpha_t)
N=size(A,1);
T=[];
for i=1:N
    c=0;
    for j=1:N
        if(A(i,j)~=0)
            for k=j+1:N
                if(A(i,k)~=0 && A(j,k)~=0 )
                    T=[T;i j k];
                    c=c+1;
                end
            end
        end
    end
    ki_2(i)=c;
end
ki_1=sum(A);


 omega1=K1_t*sin(alpha_t)*(ki_1);
 omega2=K2_t*sin(alpha_t)*(ki_2);
 omega=omega1+omega2;
end




    
