# Migros M-SKT & LUNA (Sistem Destekli Dinamik SKT Yönetim Sistemi)
## Sistem Gereksinimleri ve KANO Analizi Raporu

---

### 1. Proje Analizi ve Problemin Özeti

#### 1.1. Mevcut Durum (AS-IS) ve Problemler
Migros bünyesinde son kullanma tarihi (SKT) takibi günümüzde büyük ölçüde çalışanların manuel göz kontrollerine dayanmaktadır. Özellikle et, tavuk, süt, yoğurt, peynir ve yumurta gibi hızlı bozulabilen (taze/kritik) gıda ürünlerinde manuel kontrol esnasında gözden kaçan ürünler olabilmektedir. Bu durum:
*   **Müşteri Memnuniyetsizliği ve Şikayetleri:** Tarihi geçmiş ürünlerin yanlışlıkla satın alınması sonucu müşteri şikayetleri oluşmaktadır.
*   **Marka İmajı ve Güven Kaybı:** Gıda güvenliği ihlalleri, Migros markasına duyulan tüketici güvenini sarsmaktadır.
*   **Gıda İsrafı (Ürün İmhası):** SKT'si yaklaşan ürünler zamanında tespit edilemediği için rafta beklemekte ve tarihi geçince doğrudan imha edilerek %100 fire/zarar olarak yansımaktadır.
*   **Operasyonel Maliyetler:** Personelin saatlerce manuel tarih kontrolü yapması ciddi bir iş gücü kaybına yol açmaktadır.

#### 1.2. Önerilen Çözüm (TO-BE) ve Gelişim Aşamaları
İnsan dikkatine bağlı hataları sıfırlamak amacıyla geliştirilen **M-SKT / LUNA** ortak çözümü, 6 ana aşamadan oluşacak şekilde tasarlanmıştır:

*   **Aşama 1: Et ve Tavuk Ürünleri Barkod Entegrasyonu**
    Et ve tavuk ürünleri paketlenirken her pakete özel ağırlık bazlı barkod (GS1-128 veya 2D barkod) basılmaktadır. Bu barkodların içerisine ürün kodu ve gramajın yanı sıra **SKT bilgisinin de gömülmesi** sağlanacaktır. Böylece sistem barkodu okuduğu anda ürünün hangi tarihe kadar tüketilmesi gerektiğini bilecektir.
*   **Aşama 2: Kasa Kontrolü (Engelleme & İndirim)**
    *   *Senaryo 1 (SKT Geçmiş):* Kasada okutulan ürünün tarihi geçmişse, sistem satışı bloke eder ("Satış Engellendi - Ürünün son kullanma tarihi geçmiştir") ve ürünün müşteriye ulaşması engellenir.
    *   *Senaryo 2 (SKT Yakın):* Ürünün SKT'sine 1 veya 2 gün kalmışsa, sistem satışı onaylar ancak otomatik olarak **%20 yakın tarih indirimi** uygular. Böylece gıda israfı önlenerek ürünün hızlıca satılması sağlanır.
*   **Aşama 3: Müşteri Bilgilendirmesi (Fiş Entegrasyonu)**
    Yakın tarihli ürünü indirimli alan müşterinin fişinde bilgilendirme mesajı yazdırılır. (Örn: *"Bilgilendirme: Satın aldığınız tavuk ürününün SKT'sine 2 gün kalmıştır."*)
*   **Aşama 4: Money SMS & App Bildirimi**
    Müşteri Money kart/numarası kullandıysa, yakın tarihli ürün alımından sonra otomatik bildirimler gönderilir. Hem SMS hem de Money mobil uygulaması üzerinden otomatik hatırlatmalar yapılarak ürünün evde bozulması (Muda) engellenir.
*   **Aşama 5: Sanal Market Tercih Modülü & Son Şans Sekmesi**
    Sanal Market alışverişlerinde müşteriye kritik ürünler için seçenekler sunulur:
    1.  *En Az 5 Gün SKT Garantisi:* Standart fiyattan uzun tarihli ürün teslimatı.
    2.  *Yakın Tarih Fırsatı (1-2 Gün SKT):* %20 indirimli taze ürün satışı.
    3.  *Son Şans Kategorisi:* SKT'si yaklaşan ürünlerin çok daha yüksek indirim oranlarıyla listelendiği özel bir kategori.
*   **Aşama 6: Kapsam Genişletme**
    Sistem et ve tavuk reyonlarındaki pilot aşamayı geçtikten sonra süt, yoğurt, peynir, kaşar ve yumurta gibi diğer yüksek riskli gıda gruplarına da genişletilecektir.

---

### 2. Sistem Gereksinimleri

Projenin teknik ve işlevsel sınırlarını belirlemek üzere hazırlanan gereksinim kataloğu, **8 Fonksiyonel (FR)** ve **8 Fonksiyonel Olmayan (NFR)** gereksinimi içerecek şekilde genişletilmiştir:

#### 2.1. Fonksiyonel Gereksinimler (Functional Requirements - FR)

| Gereksinim ID | Gereksinim Adı | Açıklama / Teknik Detay |
| :--- | :--- | :--- |
| **FR-01** | Barkod Çözümleme ve SKT Okuma | Sistem, kasada veya Sanal Market toplama (picking) uygulamasında okutulan ürünün GS1-128 / DataMatrix barkod yapısından ürün kimliği, net gramajı ve SKT (Son Kullanma Tarihi) verilerini otomatik olarak ayrıştırabilmelidir. |
| **FR-02** | Kasa Satış Blokajı | Kasada taranan ürünün SKT'si güncel sistem tarihinden küçük veya eşitse (tarihi geçmişse), POS sistemi satışı engellemeli, ekranda kasiyere kırmızı renkli uyarı göstermeli ve bu kalemin fişe eklenmesine izin vermemelidir. |
| **FR-03** | Otomatik Dinamik İndirim | SKT'sine 1 veya 2 gün kalan kritik bir ürün kasada okutulduğunda, sistem ek bir personel müdahalesine gerek kalmaksızın etiket fiyatı üzerinden otomatik olarak %20 indirim tanımlamalıdır. |
| **FR-04** | Sanal Market Seçim Ekranı | Sanal Market mobil ve web sepet ekranında, kritik gıda kategorilerindeki ürünler için müşteriye "En Az 5 Gün SKT Garantili" veya "%20 İndirimli 1-2 Gün SKT Fırsatı" seçenekleri sunulmalı, seçim veritabanına kaydedilmelidir. |
| **FR-05** | Son Şans Kategorisi | Sanal Market arayüzünde, SKT'sine 1-2 gün kalan ve reyonda elden çıkarılması gereken ürünlerin yüksek indirim oranlarıyla listeleneceği dinamik bir "Son Şans" sekmesi oluşturulmalıdır. |
| **FR-06** | Money App Hatırlatma Bildirimi | Money Kart ile taze gıda satın alan müşterilere, ürünün SKT'sine 1 gün kala Money mobil uygulaması üzerinden otomatik push bildirimi veya SMS ile tüketim hatırlatması gönderilmelidir. |
| **FR-07** | Akıllı Yemek Tarifi Önerileri | Müşteri Money App üzerindeki SKT hatırlatma bildirimine tıkladığında, sistem satın aldığı yakın tarihli ürünü (örn. tavuk göğsü) değerlendirebileceği pratik yemek tariflerini listelemelidir. |
| **FR-08** | Yetkili Manuel Bloke Kaldırma | Barkod okuma hataları veya istisnai durumlarda, yetkili mağaza müdürünün şifre ve kimlik doğrulaması ile kasa blokajını manuel olarak kaldırabilmesi sağlanmalıdır. |

#### 2.2. Fonksiyonel Olmayan Gereksinimler (Non-Functional Requirements - NFR)

| Gereksinim ID | Kategori | Ölçülebilir Teknik Parametre / Metrik | Öneri Durumu & Mantık Gerekçesi |
| :--- | :--- | :--- | :--- |
| **NFR-01** | **Performans / Hız** | Kasa geçişlerinde gecikme yaşanmaması için barkod tarama anından SKT doğrulama ve blokaj/indirim kararının ekrana yansıma süresi **150 ms** altında olmalıdır. | **[EN KRİTİK - ÖNERİLEN 1]**<br>Kasa önünde kuyruk oluşmasını engellemek için hız en temel parametredir. 150 ms insan gözünün algılayamayacağı bir süredir. |
| **NFR-02** | **Güvenilirlik / Kesintisizlik** | Sistem, mağaza internet bağlantısının kesilmesi durumunda lokal veri tabanındaki verileri kullanarak çevrimdışı (offline) modda **%99.9 kullanılabilirlik (availability)** ile kesintisiz çalışabilmelidir. | **[EN KRİTİK - ÖNERİLEN 2]**<br>İnternet kesildiğinde kasada satışın durması kabul edilemez. Çevrimdışı doğrulama mağaza operasyonel sürekliliği için şarttır. |
| **NFR-03** | **Güvenlik / KVKK** | Money Kart entegrasyonu ve SMS/App gönderimi süreçlerinde, müşterilerin kişisel verileri (KVKK) maskelenmeli ve tüm veri transferleri **256-bit AES** şifreli güvenli kanallardan aktarılmalıdır. | *[Önemli Alternatif]*<br>Müşteri gizliliği ve yasal KVKK mevzuatlarına tam uyumluluk sağlanması yasal bir zorunluluktur. |
| **NFR-04** | **Ölçeklenebilirlik** | Sistem, tüm Türkiye genelindeki 3.720+ fiziksel mağazadan ve Sanal Market kanallarından eş zamanlı gelebilecek saniyede maksimum **5.000 sorguyu (TPS)** %99.99 başarı oranıyla işleyebilmelidir. | *[Önemli Alternatif]*<br>Özellikle kampanya günlerinde veya hafta sonu yoğunluğunda sistemin çökmesini engeller. |
| **NFR-05** | **Kullanılabilirlik (Usability)** | Kasiyer ekranındaki bloke uyarısı, kasiyerin görmesini ve müdahale etmesini kolaylaştıracak şekilde ekran alanının **en az %50'sini kaplayan** kırmızı bir modal pencere şeklinde tasarlanmalıdır. | *[Görsel Standart]*<br>Kasiyerin uyarıyı gözden kaçırmasını engellemek için tasarlanmış ergonomik bir standarttır. |
| **NFR-06** | **Genişletilebilirlik** | Sistem mimarisi, parametrik veri tabanı yapısı sayesinde yeni bir ürün kategorisi (örn. yoğurt, peynir, yumurta) eklendiğinde yazılım kodu değişikliği gerektirmeden **en fazla 10 dakika içinde** konfigüre edilebilir olmalıdır. | *[Mimari Kalite]*<br>Aşama 6 kapsam genişletmesinin hızlı ve masrafsız yapılması için gereklidir. |
| **NFR-07** | **Doğruluk ve Kesinlik** | Barkod ayrıştırma, tarih karşılaştırma ve indirim hesaplama motorlarının hata payı (doğruluk oranı) **99.99%** olmalı; 10.000 işlemde en fazla 1 hatalı bloke/indirim kararı verilmelidir. | *[Kalite Güvence]*<br>Müşteriye haksız indirim yapılmasını veya taze ürünün hatalı engellenmesini önler. |
| **NFR-08** | **Entegrasyon Kabiliyeti** | M-SKT sorgu motoru, mevcut Migros POS sistemleri (Wincor/NCR) ve Money CRM veritabanları ile standart REST API protokolleri üzerinden **50 ms'nin altında** gecikmeyle veri alışverişi yapabilmelidir. | *[Altyapı Uyumu]*<br>Mevcut donanım ve yazılımlarla sorunsuz bir şekilde haberleşmeyi teminat altına alır. |

---

### 3. KANO Model Analizi

KANO modeli çerçevesinde, genişletilmiş gereksinim kataloğumuzdaki maddeler müşteri memnuniyeti üzerindeki etkilerine göre sınıflandırılmıştır:

```
                       YÜKSEK MEMNUNİYET
                               ^
                               |       / [Performans (Linear)]
                               |      /  Sanal Market Tercihleri, İndirimler
                               |     /   ve Son Şans Kategorisi
                               |    /
  EKSİK İŞLEV -----------------+-----------------> TAM İŞLEV
 (Fark edilmez)                |  [Temel]        (Müşteri Memnun)
  Tarihi Geçmiş                |  Kasa Engelleme & Manuel Bloke Kaldırma
  Ürün Blokesi                 |
                               |       * [Çekici (Delighter)]
                               |         Money App Hatırlatma ve Yemek Tarifleri
                               v
                       DÜŞÜK MEMNUNİYET
```

#### 3.1. Temel (Must-Be / Threshold) Gereksinimler
Müşterinin "olmazsa olmaz" gördüğü, yokluğunda aşırı memnuniyetsizlik yaratan özelliklerdir.
*   **FR-02 (Kasa Satış Blokajı / SKT Geçmiş Ürün Engellemesi):** Müşteri tarihi geçmiş ürünü almamayı en temel gıda güvenliği hakkı olarak görür.
*   **FR-08 (Yetkili Manuel Bloke Kaldırma):** Yanlış okuma durumlarında müdür şifresiyle kasa kilidinin açılabilmesi sistemin mağaza içi kullanılabilirliği için temel gerekliliktir.
*   **NFR-01 ve NFR-02 (Performans & Güvenilirlik):** Kasaların hızlı çalışması ve internet kesildiğinde sistemin durmaması operasyonun temel hijyen faktörüdür.

#### 3.2. Performans (One-Dimensional / Linear) Gereksinimler
Kullanıcıya ne kadar iyi sunulursa memnuniyeti o kadar doğrusal olarak artıran özelliklerdir.
*   **FR-03 (Otomatik Dinamik İndirim) & FR-04 (Sanal Market SKT Seçeneği):** Müşterinin bütçe tasarrufu yapmasını ve ürün tarihini seçebilmesini sağlar.
*   **FR-05 (Son Şans Kategorisi):** Müşterilerin israftan kurtarılacak ürünleri tek bir sekmede yüksek indirimle görebilmesi doğrusal memnuniyet yaratır.

#### 3.3. Çekici (Delighter / Attractive) Gereksinimler
Müşterinin talep etmediği, yokluğunda şikayet etmediği ancak sunulduğunda markaya olan bağlılığını zirveye çıkaran özelliklerdir.
*   **FR-06 (Money App Hatırlatma Bildirimi) & FR-07 (Akıllı Yemek Tarifi Önerileri):** Satın alınan ürünün evdeki dolapta bozulmasını engellemek için müşteriyi uyarmak ve ona özel tarifler (örn. kalan tavukla yapılacak pratik çorba tarifi) sunmak çok güçlü bir müşteri deneyimi sürprizidir ("wow" etkisi yaratır).
*   **Fişte Bilgilendirme Metni:** Fişin altında satın alınan ürünün kalan ömrü hakkında bilgilendirme yapılması şeffaflığı artırır.

---

### 4. Projenin Sağladığı Stratejik Faydalar

M-SKT / LUNA ortak projesi hem müşteri hem de Migros yönetimi açısından kazan-kazan (win-win) durumu yaratmaktadır:

| Paydaş | Elde Edilecek Faydalar |
| :--- | :--- |
| **Müşteri Açısından** | <ul><li>**Gıda Güvenliği:** Tarihi geçmiş ürünlerin yanlışlıkla alınması riski tamamen sıfırlanır.</li><li>**Akıllı Tüketim (Evde Muda Önleme):** Alınan ürünlerin kalan süreleri Money App ve SMS ile hatırlatılarak evdeki israf önlenir.</li><li>**Ekonomik Alışveriş:** Yakın tarihli veya Son Şans kategorisindeki ürünler yüksek indirimlerle alınarak bütçe korunur.</li><li>**Esnek Tercih:** Sanal Market'te uzun tarih garantisi veya indirimli yakın tarih seçeneği tercih edilebilir.</li></ul> |
| **Migros Açısından** | <ul><li>**Müşteri Sadakati:** Şikayet ve iadeler azalır, marka güvenilirliği en üst seviyeye taşınır.</li><li>**Minimum Fire (Düşük Gıda İsrafı):** SKT'si yaklaşan ürünler imha edilmek yerine indirimle satılarak nakde dönüştürülür.</li><li>**Yasal Güvence:** Tarihi geçmiş ürün satışından kaynaklanabilecek resmi cezalar ve cezai yaptırımlar önlenir.</li><li>**Operasyonel Verimlilik:** Mağaza personelinin manuel etiket kontrolü yapma yükü hafifler, personel verimliliği artar.</li></ul> |
