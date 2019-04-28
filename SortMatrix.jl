
#......SortMatrix() => parametre olarak aldığı populasyon matrisini o populasyonda bulunan her bir bireyin
#      fitnes değerlerine göre sıralar. Yaptığı işlem basittir. Her bir bireye ait hesaplanan fitnes değeri
#      bir matriste tututlur. Bu fitnes matrisi , populasyon matrisinin son sutununa eklenir. Sonra julia dilinin
#      içerisinde barınan sortrows() metotdu kullanılarak son sutuna göre tüm matris sıralanır. En son olarak sıralanan
#      matristen son sutun cıkartılarak sıralanmış bir populasyon olarak geriye döndürülür.

function SortMatrix(_matrix,val,C,W)
      N,M=size(_matrix);
      temp=zeros(Int64, N,M+1 );

      for i=1:N

          fitnes=sum(_matrix[i,:]'.*val)
          weight=sum(_matrix[i,:]'.*W)
          if (weight > C)
              fitnes=0;
          end
          temp[i,:]=[_matrix[i,:]' fitnes]
      end

      _newMatrix=sortrows(temp,lt=(x,y)->isless(x[M+1],y[M+1]),rev=true)
     # display(_newMatrix);
     _matrix=_newMatrix[:,1 : M];

    return _matrix;
end
