--Sorgu 1:Stok ürünlerinin depo, ürün ve tedarikçi bilgileriyle birleştirilen sorgu 

SELECT s.stok_miktar, d.depo_adres, u.urun_ad, t.tedarikci_adi
FROM stok_urun s
JOIN depo d ON s.depo_id = d.depo_id
JOIN urun u ON s.urun_id = u.urun_id
JOIN tedarikci t ON d.tedarikci_id = t.tedarikci_id;

--Sorgu 2:Tedarikçi iade, tedarikçi ve sevkiyat bilgileriyle birleştirilmiş sorgu

SELECT ti.iade_id, ti.iade_tarihi, ti.iade_sebep, t.tedarikci_adi, s.lojistik_adi
FROM tedarikci_iade ti
JOIN tedarikci t ON ti.tedarikci_id = t.tedarikci_id
JOIN sevkiyat s ON ti.lojistik_id = s.lojistik_id;
