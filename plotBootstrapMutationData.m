%plot the bootstrap of mutation data on a given graph

A=getBootstrapFunction(AspergiliusExpanded);
h1=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(betaLacExpanded);
h2=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(HartelExpanded);
h3=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(EColiExpanded);
h4=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(M9expanded);
h5=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(H1299Expanded);
h6=plot(A(3,:),A(2,:),'.','MarkerSize',20);

A=getBootstrapFunction(HelaExpanded);
h7=plot(A(3,:),A(2,:),'.','MarkerSize',20);






legend([h1,h2,h3,h4,h5,h6,h7],{'A. niger','Beta Lacamase','Digydrofolate reductase','E. coli fitness','Sesquiterpene synthases','H1299','Hela'})
legend boxoff