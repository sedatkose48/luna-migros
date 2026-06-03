# 👤 Üye 3: Gereksinim Mühendisi (Analiz ve Model Sorumlusu) Raporu
**Proje Adı:** Migros Sistem Destekli Dinamik SKT Yönetim Sistemi (M-SKT)  
**Görev Alanı:** Gereksinimlerin Çözümlenmesi, Çevik Kullanıcı Hikayelerinin Tanımlanması, Kabul Kriterlerinin Belirlenmesi ve UML Modellerinin Hazırlanması  

---

## 📌 1. DETAYLI GEREKSİNİM KATALOĞU (REQUIREMENTS CATALOG)

M-SKT sisteminin işlevsel sınırlarını belirlemek üzere hazırlanan gereksinimler, hem **MoSCoW** hem de **KANO** modeli ile önceliklendirilmiştir.

### 1.1. Fonksiyonel Gereksinimler (Functional Requirements - FR)

| ID | Modül / Alan | Gereksinim Açıklaması | MoSCoW | KANO |
| :--- | :--- | :--- | :---: | :---: |
| **FR-01** | Barkod Çözümleme | Sistem, et ve tavuk reyonlarında paketlere basılan özel barkodlardan (örn: GS1-128 veya DataMatrix) ürün kimliğini, net gramajını ve Son Kullanma Tarihini (SKT) ayrıştırarak okuyabilmelidir. | **Must** | *Temel (Must-be)* |
| **FR-02** | Kasa Satış Blokajı | Kasada okutulan ürünün SKT'si o anki sistem tarihinden küçük veya eşitse, sistem satışı bloke etmeli, kasiyer ekranında kırmızı alarm göstermeli ve satışı engellemelidir. | **Must** | *Temel (Must-be)* |
| **FR-03** | Dinamik İndirim | Taranan ürünün SKT'sine 1 veya 2 gün kalmışsa, sistem kasa ekranında uyarı vermeli ve ürün fiyatına otomatik olarak %20 indirim yansıtmalıdır. | **Must** | *Performans (Linear)* |
| **FR-04** | Fiş Bilgilendirmesi | Satış tamamlandığında, yazıcıdan basılan fişin altındaki özel bilgi alanında "Satın aldığınız X ürününün SKT'sine Y gün kalmıştır." uyarısı yazdırılmalıdır. | **Should** | *Çekici (Delighter)* |
| **FR-05** | SMS Bildirim Tetikleyici | Müşteri Money kartı kullandığında, satın alınan yakın tarihli ürünlerin SKT uyarısı (örn: "2 gün kaldı, tüketmeniz önerilir") otomatik olarak SMS sunucusuna iletilmelidir. | **Should** | *Çekici (Delighter)* |
| **FR-06** | Sanal Market Seçimi | Sanal Market web/mobil uygulamasında sepet adımında, kritik ürünler için müşteriye "En Az 5 Gün SKT Garantili" veya "%20 İndirimli 1-2 Gün SKT Fırsatı" seçenekleri sunulmalıdır. | **Must** | *Performans (Linear)* |
| **FR-07** | Kapsam Genişletme | Sistem mimarisi, pilot aşamadan (et ve tavuk) sonra süt, yoğurt, peynir, kaşar ve yumurta gibi diğer kritik reyonları da kapsayacak şekilde modüler olmalıdır. | **Could** | *Çekici (Delighter)* |
| **FR-08** | Manuel Bloke Kaldırma | Hatalı barkod okumalarında yetkili mağaza müdürünün şifre ve kimlik doğrulaması ile blokajı manuel olarak kaldırabilmesi sağlanmalıdır. | **Must** | *Temel (Must-be)* |

### 1.2. Fonksiyonel Olmayan Gereksinimler (Non-Functional Requirements - NFR)

| ID | Kategori | Gereksinim Açıklaması | MoSCoW | KANO |
| :--- | :--- | :--- | :---: | :---: |
| **NFR-01** | Performans / Hız | Kasa geçişlerinde gecikme yaşanmaması için barkod tarama anından SKT doğrulama ve blokaj/indirim kararının ekrana yansıma süresi **150 ms** altında olmalıdır. | **Must** | *Temel (Must-be)* |
| **NFR-02** | Güvenilirlik | Sistem, mağaza internet bağlantısının kesilmesi durumunda lokal veri tabanındaki son güncel verileri kullanarak çevrimdışı (offline) modda kesintisiz çalışabilmelidir. | **Must** | *Temel (Must-be)* |
| **NFR-03** | Güvenlik / Yetki | İndirim oranları, parametreler ve müdür şifreleri veritabanında şifrelenmiş (SHA-256) olarak saklanmalı, yetkisiz personel erişimi engellenmelidir. | **Must** | *Temel (Must-be)* |
| **NFR-04** | Ölçeklenebilirlik | Sistem, eş zamanlı olarak 3.720+ fiziksel mağazadan ve Sanal Market'ten gelebilecek saniyede maksimum **5.000 sorguyu (TPS)** kaldırabilmelidir. | **Should** | *Performans (Linear)* |
| **NFR-05** | Kullanılabilirlik | Kasiyer ekranındaki blokaj uyarısı, kasiyerin görmesini kolaylaştıracak şekilde ekran alanının en az %50'sini kaplayan kırmızı bir modal pencere şeklinde olmalıdır. | **Should** | *Performans (Linear)* |

---

## 👥 2. KULLANICI HİKAYELERİ & INVEST ANALİZİ (USER STORIES)

### 2.1. Ana Personalar ve Kullanıcı Hikayeleri

*   **US-01: Kasa Blokajı (Kasiyer Personası)**
    *   *Kullanıcı Hikayesi:* **Bir Kasiyer olarak**, kasada tarihi geçmiş bir et/tavuk ürününü okuttuğumda sistemin satışı otomatik bloke etmesini ve uyarı vermesini istiyorum. **Böylece** müşteriye yanlışlıkla bozuk ürün satıp mağaza itibarını zedelememiş ve yasal risk oluşturmamış olurum.
*   **US-02: Dinamik İndirimli Sipariş (Sanal Market Müşteri Personası)**
    *   *Kullanıcı Hikayesi:* **Bir Sanal Market Müşterisi olarak**, online alışveriş sepetimde et veya süt ürünü seçerken indirimli yakın tarihli ürün seçebilmek istiyorum. **Böylece** bütçeme tasarruf sağlar ve gıda israfının azaltılmasına katkıda bulunurum.
*   **US-03: Otomatik SMS Bildirimi (Fiziksel Mağaza Müşteri Personası)**
    *   *Kullanıcı Hikayesi:* **Bir Money Üyesi Müşteri olarak**, fiziksel reyonlardan satın aldığım yakın tarihli et ürününün SKT'sine 2 gün kala SMS ile uyarılmak istiyorum. **Böylece** aldığım ürünü bozmadan zamanında tüketebilirim.
*   **US-04: Manuel Blokaj Kaldırma (Mağaza Müdürü Personası)**
    *   *Kullanıcı Hikayesi:* **Bir Mağaza Müdürü olarak**, sistemin hatalı SKT okuması yaptığı durumlarda kendi şifremle onay verip blokajı kaldırabilmek istiyorum. **Böylece** kasada oluşabilecek müşteri memnuniyetsizliklerini hızlıca çözebilirim.

### 2.2. INVEST Kalite Test Matrisi

Her kullanıcı hikayesi, çevik süreç standartlarına uygunluğu açısından **INVEST** kriterlerine göre analiz edilmiştir:

| Story | I (Independent) | N (Negotiable) | V (Valuable) | E (Estimable) | S (Small) | T (Testable) | Sonuç / Değerlendirme |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **US-01** | Evet | Evet | Yüksek | Evet (3 Gün) | Evet | Evet | **INVEST Uyumlu:** Diğer modüllerden bağımsız test edilebilir. |
| **US-02** | Evet | Evet | Yüksek | Evet (5 Gün) | Evet | Evet | **INVEST Uyumlu:** Arayüze eklenecek basit bir seçim radyo butonuyla çözülür. |
| **US-03** | Evet | Evet | Orta | Evet (2 Gün) | Evet | Evet | **INVEST Uyumlu:** SMS API entegrasyonuyla bağımsız devreye alınabilir. |
| **US-04** | Evet | Evet | Orta | Evet (2 Gün) | Evet | Evet | **INVEST Uyumlu:** POS yetkilendirme ekranında küçük bir modal ile çözülür. |

---

## 🥒 3. GHERKIN KABUL KRİTERLERİ (GHERKIN ACCEPTANCE CRITERIA)

Yazılım geliştiriciler ve QA (Test) ekipleri için Given-When-Then formatında hazırlanmış doğrulanabilir senaryolar:

### Senaryo 1: Kasada SKT Geçmiş Ürün Engellemesi
*   **Given (Giriş):** Sistem tarihi "12.06.2026" ve sistem veritabanı aktiftir.
*   **And (Ve):** Kasada okutulan "Şenpiliç Baget 1kg" ürününün barkodundaki SKT "10.06.2026" (tarihi geçmiş) olarak kodlanmıştır.
*   **When (Eyleme Geçildiğinde):** Kasiyer ürünü barkod okuyucuya okuttuğunda
*   **Then (Sonuç Olarak):** Sistem kasada sesli hata uyarısı vermelidir.
*   **And (Ve):** Kasa ekranında kırmızı renkli "Satış Engellendi: Ürün SKT'si Geçmiştir!" mesajı gösterilmelidir.
*   **And (Ve):** Ürünün barkodu iptal edilmeli, fiyatı fiş genel toplamına eklenmemelidir.

### Senaryo 2: Kasada SKT Yakın Ürüne Otomatik İndirim Uygulanması
*   **Given (Giriş):** Sistem tarihi "08.06.2026" ve veritabanı aktiftir.
*   **And (Ve):** Kasada okutulan "Dana Kıyma 500g" ürününün barkodundaki SKT "10.06.2026" (2 gün kalmış) olarak kodlanmıştır.
*   **When (Eyleme Geçildiğinde):** Kasiyer ürünü barkod okuyucuya okuttuğunda
*   **Then (Sonuç Olarak):** Sistem ürünü "Kritik Yakın Tarihli Ürün" olarak sınıflandırmalıdır.
*   **And (Ve):** Ürünün normal fiyatı olan 200 TL üzerinden otomatik olarak %20 indirim uygulanmalıdır.
*   **And (Ve):** Kasa ekranında ve fiş üzerinde "Yakın Tarih İndirimi (-40.00 TL)" satırı yazdırılmalıdır.

### Senaryo 3: Sanal Market Yakın Tarih Tercihi ve İndirim Tanımlaması
*   **Given (Giriş):** Müşteri Sanal Market uygulamasında sepetine 100 TL değerinde "Migros Peynir" eklemiştir.
*   **When (Eyleme Geçildiğinde):** Sepet ekranında "1-2 Gün SKT Fırsatı (%20 İndirimli)" seçeneğini işaretlediğinde
*   **Then (Sonuç Olarak):** Sistem ürün fiyatını 100 TL'den 80 TL'ye düşürmelidir.
*   **And (Ve):** Sipariş toplama ekranına (picker reyon ekranı) "Bu ürün reyonun ön sırasındaki yakın tarihli stoktan seçilmelidir" uyarısı gönderilmelidir.

---

## 📊 4. UML USE CASE (KULLANIM DURUMU) MODELLEMESİ

Aşağıdaki UML Kullanım Durumu diyagramı; Kasiyer, Müşteri ve Sistem aktörlerinin yazılım sınırları içerisindeki işlevsel rollerini modeller.

```mermaid
useCaseDiagram
    left to right direction
    actor Kasiyer as "Kasiyer"
    actor Musteri as "Müşteri"
    actor Mudur as "Mağaza Müdürü"
    actor Sistem as "M-SKT Sistemi"

    rectangle "M-SKT Satış & Takip Sistemi" {
        usecase UC1 as "Barkod Okutma"
        usecase UC2 as "SKT Doğrulaması Yapma"
        usecase UC3 as "Satış Engelleme / Bloke"
        usecase UC4 as "Otomatik İndirim Hesaplama"
        usecase UC5 as "Sanal Market SKT Tercihi"
        usecase UC6 as "SMS / Fiş Bildirimi Gönderme"
        usecase UC7 as "Manuel Bloke Kaldırma"
    }

    Kasiyer --> UC1
    UC1 ..> UC2 : <<include>>
    UC2 --> Sistem
    Sistem --> UC3 : SKT Geçmişse
    Sistem --> UC4 : SKT Yakınsa
    Musteri --> UC5
    UC5 ..> UC4 : <<include>>
    UC4 ..> UC6 : <<include>>
    Mudur --> UC7
    UC7 ..> UC3 : <<extend>>
```

### UML Aktör ve İlişki Açıklamaları:
*   **Kasiyer:** Fiziksel ürünü taratarak **UC1 (Barkod Okutma)** işlemini tetikler. Bu işlem zorunlu olarak **UC2 (SKT Doğrulaması Yapma)** adımını içerir.
*   **M-SKT Sistemi:** Doğrulama sonucuna göre satışı kilitleyen **UC3** veya indirimi hesaplayan **UC4** kullanım durumlarını yönetir.
*   **Müşteri:** Sanal markette **UC5 (Sanal Market SKT Tercihi)** işlemini yapar, bu da fiyat hesaplama modülünü (**UC4**) tetikler.
*   **Mağaza Müdürü:** Hatalı okumaları engellemek için **UC7 (Manuel Bloke Kaldırma)** yetkisini kullanır, bu yetki bloke durumunu (**UC3**) genişletir (`<<extend>>`).
