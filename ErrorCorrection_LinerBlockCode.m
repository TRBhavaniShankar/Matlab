function linerBlockCode = BhavaniShankar_9871_A2_Prob2(noOfRuns)
%Generator Matrix
G = [1 1 0 1 0 0 0
0 1 1 0 1 0 0
1 1 1 0 0 1 0
1 0 1 0 0 0 1];

%Get a matrix of 16X4, for all 16 combinations of 4 binary bits in each
n=4
M = dec2bin(2^n-1:-1:0)-'0'

%get the soze of matrix
[mM,nM] = size(M)
[mG,nG] = size(G)

%initializatioin
C = []
randX = []
loopCount = 0
x = 0
i = 0
j = 0
k = 0

%generating matrix C
for i = 1:noOfRuns
    x = randsample(mM,1)
    randX = [randX x]
    loopCount = loopCount+1
    mTry = []
    for j = 1:nG
        val_xor = 0
        g1 = G(:,j).'
        m1 = M(x,:)
        c1 = m1 & g1
        for k = 1:length(c1)
            val_xor = xor(val_xor,c1(k))
        end
        mTry = [mTry val_xor]
    end
    C = [C; mTry];
end

x = 0
i = 0
j = 0
k = 0

%generating the matrix e
e = []
for i = 1: noOfRuns
    error = []
    for j = 1:nG
        x = rand
        if (x <= 0.002)
          error = [error 1]
        else
          error = [error 0]
        end
    end
    e = [e; error];
end

x = 0
i = 0
j = 0
k = 0

%get the matrix y from C+e
y = []
for i = 1: noOfRuns
    corruptBit = []
    for j = 1:nG
        if e(i,j) == 1
            corruptBit = [corruptBit ~C(i,j)]
        else
            corruptBit = [corruptBit C(i,j)]
        end
    end
    y = [y; corruptBit]
end

x = 0
i = 0
j = 0
k = 0

%initialize counts to calculate the probablilities of no error, 
%correctable error and uncorrectable errors
countC = 0
countCE = 0
countB = 0

% calculate the count of no error, correctable error and uncorrectable
% errors
for i = 1: noOfRuns
    if (sum(e(i,:)) == 0)
        countC = countC +1
    elseif (sum(e(i,:)) == 1)
        countCE = countCE+1
    elseif (sum(e(i,:)) >= 2)
        countB = countB+1
    end
end
%calcuate the probabilites of no error, correctable error and uncorrectable
PC = countC/noOfRuns
PCE = countCE/noOfRuns
PB = countB/noOfRuns
end  
