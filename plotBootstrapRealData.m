%plot bootstrap of data

A=getBootstrapFunction(TaxolCisDox);
h1=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(cancer_doses_A549_1);
h2=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(mutations_Hartl);
h3=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(Wood_bacteria);
h4=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(EcoliEmergent);
h5=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(cancer_H1299);
h6=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(cancer_HeLa);
h7=plot(A(2,:),A(1,:),'.','MarkerSize',20)

A=getBootstrapFunction(yeast_effects);
h8=plot(A(2,:),A(1,:),'.b','MarkerSize',20)


legend([h1,h2,h3,h4,h5,h6,h7,h8],{'A549','A549 extra','Digydrofolate reductase','E. coli antibiotics ','E. coli antibiotics 2','H1299','HeLa','Yeast'})
legend boxoff







% %plot bootstrap of data
% A=getBootstrapFunction(Wood_bacteria);
% h1=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(cancer_doses_A549_1);
% h2=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(cancer_doses_A549_2);
% h3=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(mutations_Hartl);
% h4=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(cancer_H1299);
% h5=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(cancer_HeLa);
% h6=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(TaxolCisDox);
% h7=plot(A(2,:),A(1,:),'.','MarkerSize',20)

% A=getBootstrapFunction(EcoliEmergent);
% h8=plot(A(2,:),A(1,:),'xr','MarkerSize',20)

% legend([h1,h2,h3,h4,h5,h6,h7,h8],{'Wood Bacteria','Cancer doses (1) A549','Cancer doses (2) A549','Mutations Hartl','Cancer H1299','Cancer HeLa','TaxolCisDox','EcoliEmergent'})



