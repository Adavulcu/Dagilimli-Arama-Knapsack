#.....UpdateRefSet => Alt küme yi güncelleyen metottur. Bulunan iyi bir çözüm ile kötü bir çözümün yerini değiştirir.

function UpdateRefSet(ref,newSolution,val,C,W)

N,M=size(ref);
worstIndex=FindWorst(ref,W);
ref[worstIndex,:]=newSolution
#ref= SortMatrix(ref,val,C,W);

    return ref;
end
