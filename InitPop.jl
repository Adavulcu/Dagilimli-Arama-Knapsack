
#.....M =>  oluşturalacak çözümün büyüklüğü
#.....m =>  oluşturalacak populasyonun büyüklüğü
#.....C => kapasite kısıtı
#.....W => ağırlık verktörü
#.....val => değer vektörü
#.....Bu deosyanın içinde 2 farklı populasyon oluşurma metotdu vardır.
#.....InitPop1() => rastsal olarak oluşan bireylerden sadece sahip oluğu toplam ağırlık değerlerinin
#     kapasite kısıtının yarıs ile 1.5 katı arasındaki bireyleri populasyona dahil eder.
#.....InitPop2() => rastsal olarak oluşan bireylerden sadece sahip oluğu toplam ağırlık değerlerinin
#     kapasite kısıtınından az olan bireyleri populasyona dahil eder.
function InitPop1(M,m,C,val,W)
    pop=zeros(Int64, m, M);

    counter=1;
    while counter<=m
        random=rand([0,1],(1,M))
        fitnes=sum(random.*W)

        if ((sum(random.*W)<=(C*3)/2) & (sum(random.*W)>=C/2) )
            pop[counter,:]=random;
            counter=counter+1;
        end

    end

    return pop;

end;

function InitPopTest2(M,m,C,val,W)

    pop=zeros(Int64, m, M);


    counter=1;
    weight=0

    while counter<=m
    flag=true;

    while (flag)
        index=rand(1:M);
            prev=pop[counter,:]';
            pop[counter,index]=1;

                if ((sum(pop[counter,:]'.*W)>=C))
                    pop[counter,:]=prev;
                    flag=false;
                    counter=counter+1

                end

    end
    end
    #dipslay(pop);
    return pop;
end
