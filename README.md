# e-ticaret-veritaban-
Bu proje, bir ürün, tedarikçi, sevkiyat, tedarikçi iade ve depo yönetim sistemini içeren bir veritabanı tasarımını kapsamaktadır. Proje kapsamında veritabanı tabloları oluşturulmuş, bu tablolar arasında ilişkiler kurulmuş ve bazı örnek SQL sorguları hazırlanmıştır.


Projede aşağıdaki tablolar oluşturulmuştur:

urun: Ürün bilgilerini tutar.

urun_id: Ürün kimlik numarası (Primary Key)
urun_ad: Ürün adı
stok: Ürün stoğu
fiyat: Ürün fiyatı
tedarikci: Tedarikçi bilgilerini tutar.

tedarikci_id: Tedarikçi kimlik numarası (Primary Key)
tedarikci_adi: Tedarikçi adı
tedarikci_adres: Tedarikçi adresi
tedarikci_tel_no: Tedarikçi telefon numarası
urun_id: Ürün kimlik numarası (Foreign Key)
sevkiyat: Sevkiyat bilgilerini tutar.

lojistik_id: Lojistik kimlik numarası (Primary Key)
lojistik_adi: Lojistik adı
tedarikci_id: Tedarikçi kimlik numarası (Foreign Key)
siparis_miktar: Sipariş miktarı
fatura_no: Fatura numarası
sevkiyat_tarih: Sevkiyat tarihi
siparis_adres: Sipariş adresi
siparis_tarih: Sipariş tarihi
siparis_tutar: Sipariş tutarı
tedarikci_iade: Tedarikçi iadelerini tutar.

iade_id: İade kimlik numarası (Primary Key)
iade_tarihi: İade tarihi
tedarikci_id: Tedarikçi kimlik numarası (Foreign Key)
iade_sebep: İade sebebi
fatura_no: Fatura numarası
lojistik_id: Lojistik kimlik numarası (Foreign Key)
urun_id: Ürün kimlik numarası (Foreign Key)
depo: Depo bilgilerini tutar.

depo_id: Depo kimlik numarası (Primary Key)
depo_adres: Depo adresi
min_stok: Minimum stok miktarı
urun_id: Ürün kimlik numarası (Foreign Key)
depo_kapasite: Depo kapasitesi
tedarikci_id: Tedarikçi kimlik numarası (Foreign Key)
stok_id: Stok kimlik numarası (Foreign Key)
stok_urun: Stokta bulunan ürünleri tutar.

stok_id: Stok kimlik numarası (Primary Key)
stokta_bulunma: Stokta bulunma durumu (Boolean)
urun_id: Ürün kimlik numarası (Foreign Key)
stok_miktar: Stok miktarı
depo_id: Depo kimlik numarası (Foreign Key)
Tablolar Arası İlişkiler
Tablolar arasında çeşitli foreign key ilişkileri bulunmaktadır:

depo tablosu tedarikci, stok_urun ve urun tablolarına bağlanmaktadır.
tedarikci tablosu urun tablosuna bağlanmaktadır.
sevkiyat tablosu tedarikci tablosuna bağlanmaktadır.
tedarikci_iade tablosu urun, tedarikci ve sevkiyat tablolarına bağlanmaktadır.
stok_urun tablosu urun ve depo tablolarına bağlanmaktadır.
