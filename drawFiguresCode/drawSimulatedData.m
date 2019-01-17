figure;

subplot(2,2,1);
drawParetoFL;
load('../sim_data.mat')
[m,n]=size(sim_beta);
plot(reshape(sim_gamma,[m*n 1]),reshape(sim_beta,[m*n 1]),'r.','MarkerSize',20)


subplot(2,2,2)
colormap jet
imagesc(sim_gamma([m:-1:1],:))
axis off
xlabel('Effect Size','FontSize',24)
ylabel('Noise','FontSize',24)
title('\gamma','FontSize',24)
colorbar

subplot(2,2,3)
colormap jet
imagesc(sim_beta([m:-1:1],:))
axis off
xlabel('Effect Size','FontSize',24)
ylabel('Noise','FontSize',24)
title('\beta','FontSize',24)
colorbar


subplot(2,2,4)
colormap jet
zero_err=abs(sim_alpha+3*sim_beta+3*sim_gamma-1);
imagesc(zero_err([m:-1:1],:))
axis off
xlabel('Effect Size','FontSize',24)
ylabel('Noise','FontSize',24)
title('Zero order deviation','FontSize',24)
colorbar