#.....Burasu parametre olarak aldığı iki bireyin fitnes değerlerini kıyaslar ve en iyi olan bireyi geriye döndürür.
#.....fitnes1 => solution1 e ait fitnes değeri
#.....fitnes2 => solution2 e ait fitnes değeri

function Eval(solution1,solution2,val,w,C)
fitnes1=0;
fitnes2=0;
N,M=size(val);
bestSolution=zeros(Int64,1,M);
    if (sum(solution1.*w)>C)
        fitnes1=0;
    else
        fitnes1=sum(solution1.*val);
    end
    if (sum(solution2.*w)>C)
        fitnes2=0;
    else
        fitnes2=sum(solution1.*val);
    end
    if (fitnes1>fitnes2)
        bestSolution=solution1;
    else
        bestSolution=solution2;
    end
    return bestSolution;
end
