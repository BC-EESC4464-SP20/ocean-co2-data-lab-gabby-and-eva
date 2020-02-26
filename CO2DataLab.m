%% Add your names in a comment here at the beginning of the code!

% Instructions: Follow through this code step by step, while also referring
% to the overall instructions and questions from the lab assignment sheet.

%% 1. Read in the monthly gridded CO2 data from the .csv file
% The data file is included in your repository as �LDEO_GriddedCO2_month_flux_2006c.csv�
% Your task is to write code to read this in to MATLAB
% Hint: you can again use the function �readtable�, and use your first data lab code as an example.
filename = 'LDEO_GriddedCO2_month_flux_2006c.csv'; %change this to select a different station
CO2data = readtable(filename);


%% 2a. Create new 3-dimensional arrays to hold reshaped data
%Find each unique longitude, latitude, and month value that will define
%your 3-dimensional grid
longrid = unique(CO2data.LON); %finds all unique longitude values
latgrid= unique(CO2data.LAT);
month= unique(CO2data.MONTH);%<-- following the same approach, find all unique latitude values
 %<-- following the same approach, find all unique months

%Create empty 3-dimensional arrays of NaN values to hold your reshaped data
    %You can make these for any variables you want to extract - for this
    %lab you will need PCO2_SW (seawater pCO2) and SST (sea surface
    %temperature)
%LLM= [oceandata.LAT, oceandata.LON, oceandata.MONTH]
%lat,log,month to put in pCO@ and SST
%look one , by one, by one and then drop
reshapeddata= NaN(length(latgrid),length(longrid),length(month));

% find(CO2data(PCO2_SW(i))= latgrid(i),longrid(i), month(i)

% find in co2data where pco2sw has a latgrid,longrid, month in the same row 
%% 2b. Pull out the seawater pCO2 (PCO2_SW) and sea surface temperature (SST)
%data and reshape it into your new 3-dimensional arrays

% for i= 1:height(CO2data)
% a=find(CO2data.LAT(i)==latgrid);
% b=find(CO2data.LON(i)==longrid);
% c=find(CO2data.MONTH(i)==month);
% reshapeddata(a,b,c)=CO2data.PCO2_SW(i);
% end

%% 3a. Make a quick plot to check that your reshaped data looks reasonable
%Use the imagesc plotting function, which will show a different color for
%each grid cell in your map. Since you can't plot all months at once, you
%will have to pick one at a time to check - i.e. this example is just for
%January



%% 3b. Now pretty global maps of one month of each of SST and pCO2 data.
%I have provided example code for plotting January sea surface temperature
%(though you may need to make modifications based on differences in how you
%set up or named your variables above).

% figure(1); clf
% worldmap world
% contourfm(latgrid, longrid, SST(:,:,1)','linecolor','none');
% colorbar
% geoshow('landareas.shp','FaceColor','black')
% title('January Sea Surface Temperature (^oC)')

%Check that you can make a similar type of global map for another month
%and/or for pCO2 using this approach. Check the documentation and see
%whether you can modify features of this map such as the contouring
%interval, color of the contour lines, labels, etc.

%<--

%% 4. Calculate and plot a global map of annual mean pCO2
%<--

%% 5. Calculate and plot a global map of the difference between the annual mean seawater and atmosphere pCO2
%<--

%% 6. Calculate relative roles of temperature and of biology/physics in controlling seasonal cycle
%<--

%% 7. Pull out and plot the seasonal cycle data from stations of interest
%Do for BATS, Station P, and Ross Sea (note that Ross Sea is along a
%section of 14 degrees longitude - I picked the middle point)

%<--

%% 8. Reproduce your own versions of the maps in figures 7-9 in Takahashi et al. 2002
% But please use better colormaps!!!
% Mark on thesese maps the locations of the three stations for which you plotted the
% seasonal cycle above
C= hypotenuse(15,47)
C2 = hypotenuse(12, 50);

if Csquared > C2squared

              C2 = C;

end 

function C = hypotenuse(A,B);

% Computes the length C of the hypotenuse of a right-angle triangle

% in terms of the lengths A and B of the other sides

              Csquared = (A.^2 + B.^2);

              C = sqrt(Csquared)
              
              

end

