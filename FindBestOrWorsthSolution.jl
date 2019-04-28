#.....FindBest => Bu metot her bir iterasyonda oluşturulan  ve üzerinde işlemler yapılan alt kümeye
#     ait en iyi bireyi bulur.
#.....FindWorst => Bu metot Combination işlemi sonucunda daha iyi bir birey bulunduğunda alt kümedeki
#     bu birey ile kötü bir çözümü kendi arasında yer değiştirmek için geriye alt kümeden kötü bir çözümün indeksini bularak geriye döndürür.
#.....best => Alt kümeden seçilecek en iyi birey
#.....worstIndex => Kötü bir çözümün indeksi

function FindBest(refSet,val,W,C)
    N,M=size(refSet);
    best=zeros(Int64,1,M);
    for i=1:N
        fitnes=sum(refSet[i,:]'.*W);

        if (fitnes<C)
            if (sum(refSet[i,:]'.*val)>sum(best.*val))
            best=refSet[i,:]';

            end
        end
    end

    return best;
end

function FindWorst(refSet,W)
    N,M=size(refSet);
    fitnes=sum(refSet[1,:]'.*W);
    worstIndex=1;
    for i=2:N
        if (sum(refSet[i,:]'.*W)<fitnes)
            worstIndex=i;
        end
    end
    return worstIndex;
end
