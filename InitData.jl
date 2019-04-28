test1LowPath="instances_01_KP/low-dimensional/f1_l-d_kp_10_269.txt";#optimal çözüm 295
test1LowOptimal="295";
test2LowPath="instances_01_KP/low-dimensional/f8_l-d_kp_23_10000.txt";#optimal çözüm 9767
test2LowOptimal="9767";
test3LowPath="instances_01_KP/low-dimensional/test1.txt";#optimal çözüm 13549094
test3LowOptimal="13549094";
test4LowPath="instances_01_KP/low-dimensional/f10_l-d_kp_20_879.txt"#optimal çözüm 1025
test4LowOptimal="1025"
test1LargePath="instances_01_KP/large_scale/knapPI_1_100_1000_1.txt";#optimal çözüm 9147
test1LargeOptimal="9147"
test2LargePath="instances_01_KP/large_scale/knapPI_1_1000_1000_1.txt";#optimal çözüm 54503
test2LargeOptimal="54503"

#.....C => Kapasite Kısıtı
#.....val => Değer Vektörü
#.....W => Ağırlık Vektörü
#.....M => Problem Boyutu
#.....counter => Dosya Okuma Sayacı

#.....GetDataFromFile Metodunun İşleyişi:
        #Test problemleri large_scale ve low-dimensional dosyalarının içerisindedir
        #Test problemlerinin çözümleri ise aynı dosya adı altında sondan optimum yazan dosyanın içerisindedir
        # Test dosyalarını formatı şu şekildedir ;
        # -> Dosyanın en üst satırındaki 2 parametrenin ilki problem boyutunu verir , ikicici parametre ise Kapasite kısıtını verir.
        # -> Alt satırlar ise değer ve ağırlık değerlerini verir.
        # -> Bu satırlardaki ilk parametre değer , ikinci parametre ise ağılığı verir.
function InitData()

    return GetDataFromFile(test2LowPath);
end

#verilen dosya yolu ile gerekli parametreleri oluşturarak geriye döndürür.
function GetDataFromFile(path)
    workspace();
    counter=0
    C=0;
    val=[];
    W=[];
    M=0;

    open(path) do file
    for ln in eachline(file)
            str=split(ln, " ");
        if (counter==0)

            C=parse(Int64,str[2]);
            M=parse(Int64,str[1]);
            val=zeros(Int64 ,1,M);
            W=zeros(Int64 ,1,M);
        else
            val[counter]=parse(Int64,str[1]);
            W[counter]=parse(Int64,str[2]);

        end
        counter=counter+1;
        end
    end

    println("Problem Boyutu =$M");
    println("Kapasite (C) Kısıtı =$C");
    println("Değer (val) Matrisi =$val");
    println("Ağırlık (W) Matrisi =$W");
    println("Problemin Optimal Çözümü = $test2LowOptimal")

return val,W,C;
end
