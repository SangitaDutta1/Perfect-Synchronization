
N=1000;
% K1=0.1; 
K2=0.5;
alpha=0.5;
K1_t=0.1;
K2_t=0.5;
alpha_t=0.5;
load Sample_network.mat

%%%%%%%%%%%%%%%%% omega set%%%%%%%%%%%%%%%%%
omega=Create_omega(A,K1_t,K2_t,alpha_t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%0.5%%%%%%%%%%%%%%%%%
Create_Sys_kuramoto(N,A);
op=odeset('Abstol',1e-9,'Reltol',1e-9);
tt=0.0; data=[]; data1=[];
ystart1=-pi+2*pi*rand(1,N); 
 
  for K1=0:0.001:0.3
%%%%%%%%% uncomment for fig.11 (noise in derived frequency) %%%%%%%%%%%
%  for m=logspace(-3,1)          %% m = sigma
%       p=(m)*omega_p;        %% omega_p is the derived frequency omega
%       noise=normrnd(0,p);
%       omega=omega_p+noise;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       tic
      for yy=1:2
          [t, y] = ode45(@SK_model,[tt:0.01:tt+500], ystart1, op, alpha, omega, K1, K2);
          y_dat=y;
          ystart1=y_dat(end,1:end); 
          tt=t(end);
      end
      toc
 sin_x=(sin(y(:,1:end)))';
 cos_x=(cos(y(:,1:end)))';
 X=mean(sin_x);
 Y=mean(cos_x);
 R=mean(sqrt(X.^2+Y.^2));
 data=[data;K1,R];
 fprintf('K1=%f\t R=%f\n',K1,R); 
 save data_forward.mat data
 end
  toc
  
ystart2=y(end,1:end);
 for K1=0.2990:-0.001:0
     tic
     for yy=1:2
         [t, y] = ode45(@SK_model,[tt:0.01:tt+500], ystart2, op, alpha, omega, K1, K2);
         y_dat=y;
         ystart2=y_dat(end,1:end); 
         tt=t(end);
     end
     toc
 sin_x=(sin(y(:,1:end)))';
 cos_x=(cos(y(:,1:end)))';
 X=mean(sin_x);
 Y=mean(cos_x);
 R=mean(sqrt(X.^2+Y.^2));
 data1=[data1;K1,R];
 fprintf('K1=%f\t R=%f\n',K1,R); 
 save data_backward.mat data1
 end


