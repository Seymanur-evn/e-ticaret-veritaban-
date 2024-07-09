--Tablo oluşturma
CREATE TABLE `proje`.`urun` (
	`urun_id` INT NOT NULL AUTO_INCREMENT , 
	`urun_ad` VARCHAR(50) NOT NULL , 
	`stok` INT NOT NULL , 
	`fiyat` FLOAT NOT NULL , 
	PRIMARY KEY (`urun_id`)) ENGINE = InnoDB;

CREATE TABLE `proje`.`tedarikci` (
	`tedarikci_id` INT NOT NULL AUTO_INCREMENT , 
	`tedarikci_adi` VARCHAR(50) NOT NULL , 
	`tedarikci_adres` VARCHAR(200) NOT NULL , 
	`tedarikci_tel_no` INT(11) NOT NULL , 
	`urun_id` INT NOT NULL , 
	PRIMARY KEY (`tedarikci_id`)) ENGINE = InnoDB;

CREATE TABLE `proje`.`sevkiyat` (
	`lojistik_id` INT NOT NULL AUTO_INCREMENT , 
	`lojistik_adi` TEXT NOT NULL , 
	`tedarikci_id` INT NOT NULL , 
	`siparis_miktar` INT NOT NULL , 
	`fatura_no` INT NOT NULL , 
	`sevkiyat_tarih` DATE NOT NULL , 
	`siparis_adres` INT(200) NOT NULL , 
	`siparis_tarih` DATE NOT NULL , 
	`siparis_tutar` FLOAT NOT NULL , 
	PRIMARY KEY (`lojistik_id`)) ENGINE = InnoDB;

CREATE TABLE `proje`.`tedarikci_iade` (
	`iade_id` INT NOT NULL AUTO_INCREMENT , 
	`iade_tarihi` DATE NOT NULL , 
	`tedarikci_id` INT NOT NULL , 
	`iade_sebep` VARCHAR(200) NOT NULL , 	
	`fatura_no` INT NOT NULL , 
	`lojistik_id` INT NOT NULL , 
	`urun_id` INT NOT NULL , 
	PRIMARY KEY (`iade_id`)) ENGINE = InnoDB;

CREATE TABLE `proje`.`depo` (
	`depo_id` INT NOT NULL AUTO_INCREMENT , 
	`depo_adres` VARCHAR(200) NOT NULL , 
	`min_stok` INT NOT NULL , 
	`urun_id` INT NOT NULL , 
	`depo_kapasite` INT NOT NULL , 
	`tedarikci_id` INT NOT NULL , 
	`stok_id` INT NOT NULL , 
	PRIMARY KEY (`depo_id`)) ENGINE = InnoDB;

CREATE TABLE `proje`.`stok_urun` (
	`stok_id` INT NOT NULL AUTO_INCREMENT , 
	`stokta_bulunma` BOOLEAN NOT NULL , 
	`urun_id` INT NOT NULL , 
	`stok_miktar` INT NOT NULL , 
	`depo_id` INT NOT NULL , 
	PRIMARY KEY (`stok_id`)) ENGINE = InnoDB;

--FOREIGN KEY 
ALTER TABLE `depo` 
DROP FOREIGN KEY `depo_ibfk_1`; 

ALTER TABLE `depo` 
ADD CONSTRAINT `depo_1` 
FOREIGN KEY (`tedarikci_id`) 
REFERENCES `tedarikci`(`tedarikci_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT; 

ALTER TABLE `depo` 
DROP FOREIGN KEY `depo_ibfk_2`; 

ALTER TABLE `depo` 
ADD CONSTRAINT `depo_2` 
FOREIGN KEY (`stok_id`) 
REFERENCES `stok_urun`(`stok_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT; 

ALTER TABLE `depo` 
DROP FOREIGN KEY `depo_ibfk_3`; 

ALTER TABLE `depo` 
ADD CONSTRAINT `depo_3` 
FOREIGN KEY (`urun_id`) 
REFERENCES `urun`(`urun_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `tedarikci` 
ADD CONSTRAINT `tedarikci_1` 
FOREIGN KEY (`urun_id`) 
REFERENCES `urun`(`urun_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `sevkiyat` 
ADD CONSTRAINT `sevkiyat_1` 
FOREIGN KEY (`tedarikci_id`) 
REFERENCES `tedarikci`(`tedarikci_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `tedarikci_iade` 
ADD CONSTRAINT `iade_1` 
FOREIGN KEY (`urun_id`) 
REFERENCES `urun`(`urun_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `tedarikci_iade` 
ADD CONSTRAINT `iade_2` 
FOREIGN KEY (`tedarikci_id`) 
REFERENCES `tedarikci`(`tedarikci_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `tedarikci_iade` 
ADD CONSTRAINT `iade_3` 
FOREIGN KEY (`lojistik_id`) 
REFERENCES `sevkiyat`(`lojistik_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `stok_urun` 
ADD CONSTRAINT `stok_1` 
FOREIGN KEY (`urun_id`) 
REFERENCES `urun`(`urun_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `stok_urun` 
ADD CONSTRAINT `stok_2` 
FOREIGN KEY (`depo_id`) 
REFERENCES `depo`(`depo_id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;
