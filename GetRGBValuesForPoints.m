%GetRGBValuesForPoints function will return the colour values in RGB form
%for a list of specified points from an image.
%
%Inputs:  - img(A 3D image array from which to gather RGB values from)
%         - Points( 2D array of k rows and 2 collumns to identify which
%         points to compute colour values for)
%
%Outputs: - ColourKmeans (A 3D array with k rows, 1 collumn and 3 layers
%         which are the colour values for the supplied points)
%
%Author:  Miyyceo

function ColourKmeans = GetRGBValuesForPoints(img,Points)

ColourKmeans = zeros([size(Points,1), 1, 3]);%Creates an empty array for speed

%Cycles through RndPoints and selects the point from Pic
for i = 1:size(Points,1)
    SelectRow = Points(i,:); %Grabs the point from the row
    ColourKmeans(i,:,:) = img(SelectRow(1),SelectRow(2),:);
end

end


