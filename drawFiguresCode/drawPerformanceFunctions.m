%get the relevant performance function
getParetoParams

figure

subplot(2,2,1)
contour(C,B,first_order,30,'LineWidth',2);
setPlotPropertiesFormulaNames

subplot(2,2,2)
contour(C,B,sec_order,30,'LineWidth',2);
setPlotPropertiesFormulaNames

subplot(2,2,3)
contour(C,B,noiseDC,30,'LineWidth',2);
setPlotPropertiesFormulaNames

subplot(2,2,4)
contour(C,B,noiseFL,30,'LineWidth',2);
setPlotPropertiesFormulaNames
