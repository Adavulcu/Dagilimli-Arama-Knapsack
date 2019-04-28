

#..... Burada 2 noktalı çaprazlama uygulanmıştır
#..... m => birinci ve ikinci çaprazlama noktalarının vekrörün iki farklı tarafından seçilebilmesi için
#      vektör uzunlğunun yarısını belirtir.
#..... X1 => birinci çaprazlama noktası
#..... X2 => ikinci çaprazlama  noktası
#.....rnd =>rand metotudan üretilen 0 ie 1 arasında 1 tane değer tutan array
#.....random => rnd array inden ilk elemanı bulunduran değişken
function Combination(parent1,parent2)

    N,M=size(parent1);
    child1=zeros(Int64, 1, M);
    child2=zeros(Int64, 1, M);
    m= convert(Int64,ceil(M/2));
    x1=rand(2:m);
    x2=rand(m+1:M-1)

    child1[x1:x2]=parent2[x1:x2]
    child2[x1:x2]=parent1[x1:x2]
    #display(x);
    #child1[1:x1]=parent1[1:x1];
    #child1[x1+1:end]=parent2[x1+1:end];
    #child2[1:x1]=parent2[1:x1];
    #child2[x1+1:end]=parent1[x1+1:end];
    #display(child1);
    #display(child2);
    return child1,child2;
end

function Mutation(solution,mutChance)
N,M=size(solution);
    for i=1:M
        rnd=rand(1);
        random=rnd[1];
        if (random<mutChance)
            if (solution[1,i]==0)
                solution[1,i]=1;
            else
                solution[1,i]=0;
            end
        end
    end
return solution;
end
