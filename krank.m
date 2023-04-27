function k = krank(A)

% Brute-force algorithm (semi-exhaustive search) to determine
% the k (Kruskal) rank of a matrix  

% coded by: Michael Sorochan Armstrong (mdarmstr@ugr.es) - 
%           Computational Data Science (CoDaS) Laboratory at the
%           University of Granada, Spain
% credit to Rasmus Bro (University of Copenhagen) for the concept.
% last modification: 27/04/2023
%
% Copyright (C) 2022  University of Granada, Granada
% Copyright (C) 2022  Jose Camacho Paez
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

col = size(A,2);
cols = 1:1:col;

rnk = rank(A);
k = rnk;

for ii = 1:col
    C = nchoosek(cols,ii);
    for jj = 1:size(C,1)
        Atemp = A;
        Atemp(:,C(jj,:)) = [];
        if rank(Atemp) == rnk
            k = ii;
            break;
        end
    end
end
