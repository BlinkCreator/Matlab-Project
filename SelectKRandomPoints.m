%SelectKRandomPoints function will generate a list of randomly selected pixels from an
%image.
%
%Inputs:  - img(A 3D array corrasponding to an image)
%         - num(an interger that is the length of the list)
%
%Outputs: - RndPoints(A 2D array of Randomly selected pixels represented by Points)
%
%Author:  Miyyceo

function RndPoints = SelectKRandomPoints(img,num)

%Tests if the number of unique points is smaller or equal to than any of the array
%indices, if it passes it will do method one.
%Method 1
%it will assign random collmn and row indices to produce
%random points
if num <= size(img,1) && num <= size(img,2)
    RndPoints1 = randperm(size(img,1),num);
    RndPoints2 = randperm(size(img,2),num);
    %Rotates the 1D arrays by 90 degrees
    RndPoints1 = rot90(RndPoints1);
    RndPoints2 = rot90(RndPoints2);
    RndPoints = horzcat(RndPoints1,RndPoints2);
else
    %If it fails the test then it will resort to method 2
    %Method 2
    %Assigns a random row and collumn number and then produces n by 2 array
    %that is then sorted into unique points and then updates accordingly
    RndPoints1 = randi(size(img,1),[num,1]);
    RndPoints2 = randi(size(img,2),[num,1]);
    RndPoints = horzcat(RndPoints1,RndPoints2);
    
    [NonRepeatedOccurances,~] = unique(RndPoints,'first','rows','legacy');
    NonRepeatedOccurances = sort(NonRepeatedOccurances);
    RndPoints(1:size(NonRepeatedOccurances,1),1:size(NonRepeatedOccurances,2)) = NonRepeatedOccurances;
    
    
    while (size(RndPoints,1)) ~= size(unique(RndPoints,'rows'))
        for i = (size(NonRepeatedOccurances,1)):(size(RndPoints,1))
            RndPoints1 = randi(size(img,1));
            RndPoints2 = randi(size(img,2));
            RndPoints(i,:) = horzcat(RndPoints1,RndPoints2);
        end
    end
end

end