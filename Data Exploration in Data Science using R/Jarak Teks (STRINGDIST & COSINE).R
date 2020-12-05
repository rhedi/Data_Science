library("stringdist")

#Melakukan perhitungan jarak teks
stringdist("Agus Cahyono", "Agus Cahyono", method="cosine")
stringdist("Agus Cahyono", "agus cahyono", method="cosine")
stringdist("Agus Cahyono", "Agus Tjahyono", method="cosine")
stringdist("Agus Cahyono", "Cahyono Agus", method="cosine")
stringdist("Agus Cahyono", "Cahyono, Agus", method="cosine")
stringdist("Agus Cahyono", "Justin Bieber", method="cosine")


#lv: Levenstein distance. Perhitungan jarak berdasarkan berapa banyak karakter yang dihapus, ditambahkan, dan dirubah sehingga kedua teks menjadi sama. Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu.
#dl: Damerau-Levenstein distance. Pengembangan dari Levenstein distance dimana memperbolehkan transposisi karakter (berpindah tempat). Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu.
#hamming: jarak Hamming - jumlah karakter yang berbeda antara kedua teks - dan panjang kedua teks harus sama. Jika tidak, akan mengembalikan Inf. Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu.
#osa: Optimal string alignment - mirip dengan dl tapi setiap teks hanya boleh diedit sekali. Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu. Ini adalah metode default untuk stringdist.
#lcs: longest common substring - berapa banyak karakter yang harus dibuang dari kedua teks sehingga menjadi teks yang sama. Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu.
#qgram: Berapa banyak pasangan n-gram (yaitu potongan n karakter dari teks) yang berbeda. Nilai jaraknya adalah bilangan integer dari 0 sampai dengan nilai integer tertentu.
#jaccard: Adalah jarak yang dihitung berdasarkan berapa banyaknya pasangan n-gram yang berbeda dibagi jumlah pasangan n-gram total. Nilai jaraknya adalah nilai desimal antara 0 sampai dengan 1.
#jw: metode Jaro Wrinkler menghitung perpindahan karakter minimum yang diperlukan sehingga satu teks bertransformasi menjadi teks lain. Nilai jaraknya adalah nilai desimal antara 0 sampai dengan 1.
#soundex: metode jarak antara teks berdasarkan perbedaan pengucapan dalam bahasa Inggris.