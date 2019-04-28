
include("CreateRefSet.jl");
include("InitData.jl");
include("InitPop.jl");
include("SortMatrix.jl");
include("UpdateRefSet.jl");
include("Combination.jl");
include("Eval.jl");
include("FindBestOrWorsthSolution.jl");



#.....MainSS() => tüm algoritmayı çalıştıran metottur. Kullanılan metotların detayları bulundukları dosyaların içinde yorum satırı olrak eklenmiştir.
#.....bestSolution => En iyi çözümü tutacak olan vektör.
#.....pop => Populasyon kümesi
#.....ref => Populasyondan üretilen alt küme
#.....parent1 => Populasyondan rastge olrak seçilen ve çaprazlamaya uğratılacak ilk parent
#.....parent2 => Populasyondan rastge olrak seçilen ve çaprazlamaya uğratılacak ikinci parent
#.....cmbIndex1 =>ref den seçilecek parent1 için rastsal olarak bir indis değeri tutan değişken
#.....cmbIndex2 =>ref den seçilecek parent2 için rastsal olarak bir indis değeri tutan değişken
#.....child1 => Oluşturulan birinci çocuk
#.....child2 => Oluşturulan ikinci çocuk
#.....bestParent => Seçilen 2 parentten en iyisi tutan değişken
#.....BestChild => Oluşturulan 2 çocuktan en iyisi tutan değişken
#.....LocalBest =>  iterasyonlar sonucunda ortaya çıkan çözümlerden en iyisini temsil eder. bestSolution ile kıyaslanmak için tutlur.
#.....mutChance => mutasyon şansı

global mutChance=0.07;
function MainSS()

    workspace();
    tic();
m=250;#popukasyon büyüklüğü
display("Starting");

val,W,C=InitData();#Gerekli test verileri olşuturulur.
N,M=size(val);
bestSolution=zeros(Int64, 1,M );# en iyi çözümü atamak istediğimiz  0 lardan oluşan bir vektör olşuturulur.
    for i=1:10

        pop=InitPop2(M,m,C,val,W);# Populasyon oluşturulur
        ref=CreateRefSet(pop);# Populasyondan bir alt küme oluşturulur
        ref=SortMatrix(ref,val,C,W); #Oluşturulan alt küme fitnes değerlerine göre sıralanır.
        for j=1:10

            for z=1:10
                cmbIndex1=rand(1:N);
                cmbIndex2=rand(1:N);
                parent1=ref[cmbIndex1,:]';
                parent2=ref[cmbIndex1,:]';

                bestParent=Eval(parent1,parent2,val,W,C);
                child1,child2=Combination(parent1,parent2);
                BestChild=Eval(child1,child2,val,W,C);

                BestChild=Mutation(BestChild,mutChance);

                if (sum(BestChild.*val)> sum(bestParent.*val))

                    UpdateRefSet(ref,BestChild,val,C,W);
                end
                LocalBest=FindBest(ref,val,W,C);


                if (sum(LocalBest.*val)> sum(bestSolution.*val))
                    bestSolution=LocalBest;
                end

            end
            ref=CreateRefSet(pop);
            ref=SortMatrix(ref,val,C,W);
        end

    end
    bestSolutionVal=0;
    bestSolutionW=0;
    bestSolutionVal=sum(bestSolution.*val);
    bestSolutionW=sum(bestSolution.*W);
    time=toq();
    println("En İyi Çözüm = $bestSolution \nAğırlık = $bestSolutionW \nDeğer=$bestSolutionVal\nHesaplama Süresi = $time");
end
MainSS();
