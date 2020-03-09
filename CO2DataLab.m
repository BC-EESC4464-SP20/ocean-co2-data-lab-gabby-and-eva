%% Add your names in a comment here at the beginning of the code!

% Instructions: Follow through this code step by step, while also referring
% to the overall instructions and questions from the lab assignment sheet.

%% 1. Read in the monthly gridded CO2 data from the .csv file
% The data file is included in your repository as �LDEO_GriddedCO2_month_flux_2006c.csv�
% Your task is to write code to read this in to MATLAB
% Hint: you can again use the function �readtable�, and use your first data lab code as an example.

filename ='LDEO_GriddedCO2_month_flux_2006c.csv';
CO2data = readtable(filename);


%% 2a. Create new 3-dimensional arrays to hold reshaped data
%Find each unique longitude, latitude, and month value that will define
%your 3-dimensional grid
longrid = unique(CO2data.LON); %finds all unique longitude values
latgrid= unique(CO2data.LAT);
month= unique(CO2data.MONTH);
%<-- following the same approach, find all unique latitude values
 %<-- following the same approach, find all unique months

reshapeddata_PCO2=NaN(length(latgrid),length(longrid),length(month));

for i=1:height(CO2data)
    a=find(CO2data.LAT(i)==latgrid);
    b=find(CO2data.LON(i)==longrid);
    c=find(CO2data.MONTH(i)==month);
    reshapeddata_PCO2(a,b,c)= CO2data.PCO2_SW(i);
end
 
reshapeddata_SST=NaN(length(latgrid),length(longrid),length(month));

for i=1:height(CO2data)
   a=find(CO2data.LAT(i)==latgrid);
   b=find(CO2data.LON(i)==longrid);
   c=find(CO2data.MONTH(i)==month);
   reshapeddata_SST(a,b,c)= CO2data.SST(i);
end




%Create empty 3-dimensional arrays of NaN values to hold your reshaped data
    %You can make these for any variables you want to extract - for this
    %lab you will need PCO2_SW (seawater pCO2) and SST (sea surface
    %temperature)
%LLM= [oceandata.LAT, oceandata.LON, oceandata.MONTH]
%lat,log,month to put in pCO@ and SST
%look one , by one, by one and then drop



%% 2b. Pull out the seawater pCO2 (PCO2_SW) and sea surface temperature (SST)
%data and reshape it into your new 3-dimensional arrays


%<--

%% 3a. Make a quick plot to check that your reshaped data looks reasonable
%Use the imagesc plotting function, which will show a different color for
%each grid cell in your map. Since you can't plot all months at once, you
%will have to pick one at a time to check - i.e. this example is just for
%January


imagesc(reshapeddata_PCO2(:,:,1));


imagesc(reshapeddata_SST(:,:,1));


%% 3b. Now pretty global maps of one month of each of SST and pCO2 data.
%I have provided example code for plotting January sea surface temperature
%(though you may need to make modifications based on differences in how you
%set up or named your variables above).

figure(1); clf
worldmap world
contourfm(latgrid, longrid, reshapeddata_SST(:,:,1),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
title('January Sea Surface Temperature (^oC)')
%%
%Check that you can make a similar type of global map for another month
%and/or for pCO2 using this approach. Check the documentation and see
%whether you can modify features of this map such as the contouring
%interval, color of the contour lines, labels, etc.

%<--
figure(2); clf
worldmap world
contourfm(latgrid, longrid, reshapeddata_PCO2(:,:,1),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
title('January pCO2')


%% 4. Calculate and plot a global map of annual mean pCO2
%<--


annualmeanPCO2=nanmean(reshapeddata_PCO2,3);

imagesc(annualmeanPCO2);

%%
figure(3); clf
worldmap world
contourfm(latgrid, longrid, annualmeanPCO2(:,:,1),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
title('Annual Mean PCO2')


%% 5. Calculate and plot a global map of the difference between the annual mean seawater and atmosphere pCO2
%<--

reshapeddata_PCO2AIR=NaN(length(latgrid),length(longrid),length(month));

for i=1:height(CO2data)
   a=find(CO2data.LAT(i)==latgrid);
   b=find(CO2data.LON(i)==longrid);
   c=find(CO2data.MONTH(i)==month);
   reshapeddata_PCO2AIR(a,b,c)= CO2data.PCO2_AIR(i);
end

annual_mean_PCO2_AIR=reshapeddata_PCO2AIR;

difference=annualmeanPCO2-annual_mean_PCO2_AIR

figure(4); clf
worldmap world
contourfm(latgrid, longrid, difference(:,:,1),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
title('The difference annual mean PCO2 between seawater and air')

%% 6. Calculate relative roles of temperature and of biology/physics in controlling seasonal cycle
%<--
Tmean=nanmean(reshapeddata_SST,3)
Tmean_rep=repmat(Tmean,1,1,12)
PCO2_Tmean=reshapeddata_PCO2.*exp(0.0423*(Tmean_rep-reshapeddata_SST))
PCO2_BP=PCO2_Tmean

annualmeanPCO2_rep=repmat(annualmeanPCO2,1,1,12)
PCO2_Tobs=annualmeanPCO2_rep.*exp(0.0423*(reshapeddata_SST-Tmean_rep))
PCO2_T=PCO2_Tobs


%% 7. Pull out and plot the seasonal cycle data from stations of interest
%Do for BATS, Station P, and Ross Sea (note that Ross Sea is along a
%section of 14 degrees longitude - I picked the middle point)

%<--

%Bermuda

[M_BATS_LAT,I_BATS_LAT]=min(abs(latgrid-32.5))
[M_BATS_LON,I_BATS_LON]=min(abs(longrid-64.1))


% Ross Sea

[M_RS_LAT,I_RS_LAT]=min(abs(latgrid+76.5))
[M_RS_LON,I_RS_LON]=min(abs(longrid-173))

% P station

[M_PS_LAT,I_PS_LAT]=min(abs(latgrid-50))
[M_PS_LON,I_PS_LON]=min(abs(longrid-145))



%% 8. Reproduce your own versions of the maps in figures 7-9 in Takahashi et al. 2002
% But please use better colormaps!!!
% Mark on thesese maps the locations of the three stations for which you plotted the
% seasonal cycle above

%Seasonal Biological Drawdown of Seawater pCO2
figure(5); clf
worldmap world
contourfm(latgrid, longrid, PCO2BP(:,:,1),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
title('The difference annual mean PCO2 between seawater and air')

%<--
