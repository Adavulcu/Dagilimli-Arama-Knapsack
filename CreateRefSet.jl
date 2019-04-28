
#..... Burası Populasyondan bir alt kümenin oluşturulduğu yerdir.
#..... stepCounter => Alt küme boyutunu belirtir.
#      Alt küme populasyonun 10 da 1 i olması gerektiriği için populasyon
#      büyüküğünü (N) 10 a bölünür.
#......x => stepCounter değişkeninin tam sayıya dönüştürülmüş halidir.
#......counter => Populasyondan kaç adımda bir eleman seçileceğini belirler.
#      İlk değeri 1 ile 10 arasından rastsal olarak belirlenir.
#      Her iterasyonda birbirinden  farklı bireyleri seçebilmek için değeri 10 artırılır.
#......ref => Oluşturulan Alt Küme
function CreateRefSet(pop)
N,M=size(pop);#populasyonun kac bireyde oluştugu buradan ögrenilir.

stepCounter=N/10;
ref=zeros(Int64,stepCounter ,M);

x=convert(Int64,round(stepCounter));
#println("index $x");
counter=rand(1:10);
for i=1:x;
ref[i,:]=pop[counter,:];
#display(counter);
counter=counter+10;
end

    return ref;
end
