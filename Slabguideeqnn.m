close all;
clear all;
nc=1.45;    %cladding
nf=1.5;
ns=1.4;    %substrate
   h=5;  %width of waveguide
   k_0=2*pi;
   q=max([ns nc]);
   w=sqrt((k_0^2*(nf^2-q^2)));
   kappa=linspace(0,w,10000);
   beta=sqrt(k_0^2*nf^2-kappa.^2);
   gammas=sqrt(beta.^2-k_0^2*ns^2);
   gammac=sqrt(beta.^2-k_0^2*nc^2);
   z=tan(h*kappa);
   %TE mode
   a=(gammac+gammas)./(kappa-gammas.*gammac./kappa);
   %TM mode
   %b=(nf^2*gammas/ns^2+nf^2*gammac/nc^2)./(kappa-gammas.*gammac./kappa*nf^4/nc^2/ns^2);
   plot(kappa,a);
   hold on
   plot(kappa,z);
   %legend TE
   ylim([-20 20])
   %xlabel kappa(m^-1)
   xlabel kappa(m^-1)
  
   figure(1)
   
   

   