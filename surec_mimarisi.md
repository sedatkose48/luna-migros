# 👤 Üye 2: Süreç Mimarı (To-Be Tasarım ve Yönetişim Sorumlusu) Raporu

**Proje Adı:** Migros Sistem Destekli Dinamik SKT Yönetim Sistemi (M-SKT)  
**Görev Alanı:** Gelecek Durum (TO-BE) Süreç Modellemesi, Paydaş Analizi ve İletişim Stratejileri, RACI Sorumluluk Matrisi, AS-IS / TO-BE Karşılaştırmalı Etki Analizi  

---

## 📌 1. GELECEK DURUM (TO-BE) BPMN 2.0 SÜREÇ AKIŞI VE TEKNİK AÇIKLAMALARI

M-SKT sistemiyle birlikte manuel, insan hatasına açık ve reaktif olan eski süreç; sistem otomasyonuna dayalı, proaktif ve gerçek zamanlı doğrulama içeren yeni bir yapıya dönüştürülmüştür. 

Yeni sürecin BPMN 2.0 standartlarındaki şeritleri (Lanes) ve iş akış adımları aşağıdaki gibidir:

### 1.1. Süreç Şeritleri (Lanes) ve Sorumluluk Alanları

*   **Müşteri Şeridi:** Reyondan ürünü seçer, kasaya getirir veya Sanal Market sepet adımında SKT tercihini belirler.
*   **Kasiyer / POS Sistem Şeridi:** Ürün barkodunu taratır, POS ekranı üzerinden gelen sistem uyarılarını yönetir ve işlemleri tamamlar.
*   **M-SKT Karar Motoru & Veritabanı (Sistem Otomasyonu):** Taranan 2D/GS1-128 barkodunu çözümler, SKT ile güncel tarihi karşılaştırır, blokaj veya indirim kararlarını milisaniyeler içinde hesaplayarak POS'a iletir.
*   **Arka Ofis / CRM & Money Sunucuları:** Müşterinin Money Kart hareketlerini analiz eder ve yakın tarihli ürün satın alımları için otomatik SMS/Push bildirimleri tetikler.

---

### 1.2. TO-BE Süreç Adımları ve Karar Akışı

Sistem entegrasyonu sonrasındaki dijital karar adımları şu şekildedir:

1.  **Satış Blokajı Adımı:** Okutulan ürünün SKT'si geçmiş veya sistem tarihi ile eşitse, M-SKT Karar Motoru satışı kilitler. POS ekranında kırmızı renkli bir uyarı penceresi belirir. Kasiyerin ürünü sepete ekleme yetkisi sistem tarafından engellenir. Ürün imha edilmek üzere fiziksel olarak ayrılır. Hatalı barkod durumunda yetkilendirilmiş Mağaza Müdürü şifresiyle blokaj manuel olarak kaldırılabilmektedir.
2.  **Dinamik İndirim Adımı:** Ürünün SKT'sine 1 veya 2 gün kaldığı tespit edilirse, fiyatlandırma modülü otomatik olarak %20 indirim uygular. İskonto doğrudan fiş detayına yansıtılır ve ek bir manuel işleme gerek kalmadan süreç tamamlanır.

---

## 📊 2. PAYDAŞ YÖNETİMİ & GÜÇ-İLGİ MATRİSİ (STAKEHOLDER ANALYSIS)

Projenin etki alanındaki iç ve dış paydaşların analiz edilerek doğru iletişim stratejileri belirlenmiştir:

```
                  YÜKSEK GÜÇ
         +--------------------------+--------------------------+
         |     MEMNUN EDİLECEK      |     YAKIN YÖNETİLECEK    |
         |                          |                          |
         |  * Bölge Koordinatörleri |  * Mağaza Müdürleri      |
         |  * Satınalma Kategori    |  * Kalite Yönetim Dep.   |
         |    Yöneticileri          |  * POS & BT Altyapı      |
DÜŞÜK    |                          |    Yazılım Ekipleri      |
İLGİ     +--------------------------+--------------------------+     YÜKSEK
         |     İZLENECEK (İZLEM)     |    BİLGİLENDİRİLECEK     |     İLGİ
         |                          |                          |
         |  * Lojistik & Depo       |  * Kasiyerler            |
         |    Personeli             |  * Reyon Görevlileri     |
         |  * Dış Tedarikçiler      |  * Sadık Money           |
         |                          |    Müşterileri           |
         +--------------------------+--------------------------+
                  DÜŞÜK GÜÇ
```

### Paydaş İletişim Stratejileri:

*   **Yakın Yönetilecekler (Yüksek Güç / Yüksek İlgi):** Mağaza Müdürleri sahadaki birincil sorumlulardır. Kalite Yönetim Departmanı ise yasal ve gıda güvenliği standartlarının korunmasını denetler. BT Altyapı Ekipleri kararların 150 ms altında gerçekleşmesini sağlar. Bu gruplarla haftalık durum toplantıları gerçekleştirilir.
*   **Bilgilendirilecekler (Düşük Güç / Yüksek İlgi):** Kasiyer ve reyon görevlileri sistemin doğrudan kullanıcılarıdır. Eğitim programları ve kullanıcı dostu arayüz kılavuzları ile desteklenirler. Money müşterileri ise dinamik indirim avantajları hakkında bilgilendirilir.
*   **Memnun Edilecekler (Yüksek Güç / Düşük İlgi):** Bölge Koordinatörlerine projenin ciro ve fire oranları üzerindeki olumlu etkilerini gösteren aylık performans raporları sunulur.

---

## 📋 3. RACI SORUMLULUK MATRİSİ (RESPONSIBILITY ASSIGNMENT MATRIX)

Süreç adımlarındaki operasyonel karmaşayı önlemek amacıyla tasarlanan RACI Matrisi aşağıda sunulmuştur. Cemalettin Hoca'nın kesin kuralı gereği, **her iş paketi (satır) için yalnızca tek bir hesap verebilir (A - Accountable) rol atanmıştır**:

*   **R - Responsible (Yapan):** İşi doğrudan uygulayan ve gerçekleştiren rol.
*   **A - Accountable (Hesap Veren):** İşin sonucundan nihai sorumlu olan, onay veren tek yetkili merci.
*   **C - Consulted (Danışılan):** Görüş ve uzmanlığına başvurulan rol.
*   **I - Informed (Bilgi Verilen):** Kararlar verildikten sonra bilgilendirilen rol.

| Süreç Adımları | Kasiyer | Reyon Görevlisi | Mağaza Müdürü | Sistem (BT) | Müşteri | Kalite Dep. |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Barkod Standartlarının Güncellenmesi** | I | R | I | **A** | - | C |
| **Reyonda Ürünlerin FIFO'ya Göre Tasnifi** | - | R | **A** | - | - | C |
| **Kasada SKT Engelleme & Blokaj** | R | I | I | **A** | I | C |
| **Yetkili Şifresi ile Blokaj Kaldırma** | I | - | **A** | - | I | - |
| **Dinamik %20 İndirimin Uygulanması** | I | - | I | **A** | I | - |
| **Money CRM SMS Hatırlatma Gönderimi** | - | - | - | **A** | I | - |
| **Sanal Market SKT Garantisi Seçimi** | - | I | - | R | **A** | C |

---

## 🔄 4. AS-IS / TO-BE KARŞILAŞTIRMA ANALİZİ

M-SKT projesinin hayata geçmesiyle yaşanacak süreç dönüşümünün analitik etki analizi aşağıdaki tabloda sunulmuştur:

| Değerlendirme Kriteri | AS-IS (Eski Durum) | TO-BE (Yeni Durum) | Kazanım & Stratejik Etki |
| :--- | :--- | :--- | :--- |
| **Süreç Güvenirliği** | Reyon görevlisinin manuel göz kontrolüne bağlıdır. Hata riski yüksektir. | Kasada barkod tarama anında sistem tarafından %100 otomatik kontrol edilir. | Gözden kaçan tarihi geçmiş ürün satışı ihtimali tamamen sıfırlanır. |
| **Müşteri Güveni** | Müşterinin bozuk ürünü fark etmeden alıp eve götürmesi ve iadeyle uğraşması (Marka imaj kaybı). | Tarihi geçmiş ürünün kasadan çıkışına asla izin verilmez, taze ürünle anında değiştirilir. | Migros gıda güvenliği imajı korunur, müşteri memnuniyetsizliği ve şikayetleri minimize edilir. |
| **İmha Oranı ve Gıda İsrafı** | SKT'si gelen ürünler fark edilmediği için rafta bekler, tarihi geçince %100 zarar yazılarak imha edilir. | SKT'sine 1-2 gün kalan ürünler kasada otomatik %20 indirimle satılarak eritilir. | İmha oranlarında **%40'a varan azalma** sağlanır. Fire maliyetleri kazanca dönüştürülür. |
| **Personel Verimliliği** | Reyon görevlilerinin günde ortalama 2 saat boyunca etiket ve SKT tarihlerini manuel kontrol etmesi. | Personel sadece sistemin uyarı verdiği yakın tarihli ürünleri kontrol eder ve yerini değiştirir. | Personel zamanı daha değerli mağaza operasyonlarına aktarılarak iş gücü verimliliği artırılır. |
