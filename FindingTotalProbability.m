function tossing = FindingTotalProbability(N)
    A = [];
    Code = [];
    for i = 1:N
        toss = randi([0,1]);
        if toss == 0
            A = [A 1];
            Code = [Code 0];
        else
            toss = randi([0,1]);
            if toss == 0
                A = [A 2];
                Code = [Code 10];
            else
                toss = randi([0,1]);
                if toss == 0
                    A = [A 3];
                    Code = [Code 110];
                else
                    toss = randi([0,1]);
                    if toss == 0
                        A = [A 4];
                        Code = [Code 1110];
                    else
                        A = [A 5];
                        Code = [Code 1111];
                    end
                end
            end
        end
    end

X_A = [];

x1_A = sum(A(:)==1);
X_A = [X_A x1_A];

x2_A = sum(A(:)==2);
X_A = [X_A x2_A];

x3_A = sum(A(:)==3);
X_A = [X_A x3_A];

x4_A = sum(A(:)==4);
X_A = [X_A x4_A];

x5_A = sum(A(:)==5);
X_A = [X_A x5_A];

prob_A = X_A/N;

fprintf('With N =%i,  frequencies of Alphabets of A : [1,2,3,4,5] is',N)
disp(X_A)
fprintf('With N =%i,  probability of Alphabets of A : [1,2,3,4,5] is',N)
disp(prob_A)

meanA = sum(A)/N;
varianceA = sum((A - meanA).^2)/N;
fprintf('mean of A = %i and variance of A = %i\n', meanA, varianceA)
end
