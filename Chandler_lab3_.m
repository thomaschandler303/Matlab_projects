%Program takes user input to find the shortest route between 2 cities
%that don't currently have a direct flight for that date
%Author: Thomas Chandler
%Date: February 3, 2022

%initiate data for cities and distances
city = ["1. Brantford", "2. Collingwood", "3. Elora", "4. Fort Erie", ...
    "5. Dogerich", "6. Grand Bend"];

a = [0 234 70 149 155 144; 234 0 110 282 176 220; 70 110 0 208 128 149; ...
    149 282 208 0 282 316; 115 175 128 282 0 49; 144 220 149 316 49 0];

%display choice for user and have them input 2 cities
disp(['Find the shortest route between cities without a direct flight',...
    ' for your chosen date'])
disp(city')
prom1 = 'Choose starting destination: ';
prom2 = 'Choose final destination: ';

%assign choices to variables that can be passed to function
start = input(prom1);
stop = input(prom2);
%call function to calculate shortest distance and city
[distance, layover] = f6(start, stop, a);

%find city from list by index and remove unnecessary leading characters
city1 = city([layover]);
city1 = extractAfter(city1, " ");

%display final result
disp(['Minimum distance is ', num2str(distance), ' kilometers', ...
    ' with a layover in ', num2str(city1)])

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



