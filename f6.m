%function to calculate shortest distance for a layover flight
function [dist, city] = f6(start, stop, a)

    %initialize layover index list and empty sum list
    layover = [1, 2, 3, 4, 5, 6];
    sum = [];
    
    %iterate through possible layovers and sum the distance to both the
    %starting destination and final destination
    for i = 1:6

        sum([i]) = a([i],[start]) + a([i],[stop]);
   
    end
    
    %remove starting destination and final destination as possible layovers
    sum([start, stop]) = [];
    layover([start, stop]) = [];
   
    %find shortest distance and index
    [dist, j] = min(sum);
   
    %find city that matches the shortest distance
    city = layover([j]);
    
end

