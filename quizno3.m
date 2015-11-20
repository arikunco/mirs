clear; 
%bikin matrix A (kolom menunjukkan image ke-i (i = 1, 2), 
%disusun vertikal)
A = [0,0;5,0;0,0;0,5;5,5;0,5;0,0;5,0;0,0];
%bikin matrix query
q = [0;0;0;7;5;5;3;5;0];
%bikin matrix USV
[U,S,V] = svd(A);
%bikin S inverse
S1 = S;
S1(S1>0) = 1./S1(S1>0);
%bikin Vtranspose
Vt = transpose(V);
%bikin q transpose
qT = transpose(q);
%hitung query vector
qVector = qT * U * S1;

%cosine similarity
for i=1 : 2
   normq = norm(qVector);
   d = Vt(:,i);    
   normI = norm(d);
   sim(i,1) = dot(qVector,d) / (normq * normI);
   sim(i,2) = i;
end

display(sortrows(sim,-1));

% ans =
% 
%     0.9532    2.0000
%     0.3022    1.0000

%kolom kedua adalah index image. Jadi, yang paling mirip 
%dengan image query adalah image yang kedua. :-)





