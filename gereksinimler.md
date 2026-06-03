# 👤 Üye 3: Gereksinim Mühendisi — Süreç Analizi & Model Raporu
**Proje Adı:** Migros Sistem Destekli Dinamik SKT Yönetim Sistemi (M-SKT)  
**Görev Alanı:** Gereksinim Analizi, Çevik Ürün Yönetimi ve Teknik Modelleme  

---

## 📌 1. GEREKSİNİM KATALOĞU (REQUIREMENTS CATALOG)

Bu katalog, sistemin başarılı bir şekilde çalışması için gerekli olan **Fonksiyonel (Functional)** ve **Fonksiyonel Olmayan (Non-Functional)** gereksinimleri tanımlar. Önceliklendirme için **MoSCoW** (Must, Should, Could, Won't Have) modeli kullanılmıştır.

### 1.1. Fonksiyonel Gereksinimler (Functional Requirements - FR)

| ID | Modül | Açıklama | Öncelik (MoSCoW) |
| :--- | :--- | :--- | :--- |
| **FR-01** | Barkod Entegrasyonu | Sistem, paketlenen et ve tavuk ürünlerinin özel barkodlarından (örn: GS1-128 veya DataMatrix) ürün kimliği, gramaj ve SKT bilgisini ayrıştırarak okuyabilmelidir. | **Must (Zorunlu)** |
| **FR-02** | Kasa SKT Denetimi | Kasiyer barkodu okuttuğunda, sistem o anki tarih ile ürünün SKT'sini karşılaştırmalıdır. SKT geçmişse satışı engellemeli ve ekranda blokaj uyarısı göstermelidir. | **Must (Zorunlu)** |
| **FR-03** | Kasa Otomatik İndirim | SKT'sine 1 veya 2 gün kalan kritik ürünler kasadan geçtiğinde sistem otomatik olarak %20 indirim uygulamalıdır. | **Must (Zorunlu)** |
| **FR-04** | Fiş Bilgilendirmesi | Satın alınan yakın tarihli ürünlerin fiş altındaki bilgilendirme alanında "SKT'ye X gün kalmıştır" uyarısı yazdırılmalıdır. | **Should (Gerekli)** |
| **FR-05** | Money SMS Entegrasyonu | Money Club kartı kullanan müşterilere, satın aldıkları yakın tarihli ürünün SKT uyarısı otomatik olarak SMS ile gönderilmelidir. | **Should (Gerekli)** |
| **FR-06** | Sanal Market Seçimi | Sanal Market sepet adımında, kritik ürünler için müşteriye "En Az 5 Gün SKT Garantisi" veya "%20 İndirimli 1-2 Gün SKT Fırsatı" seçenekleri sunulmalıdır. | **Must (Zorunlu)** |
| **FR-07** | Kapsam Genişletme | Sistem, et ve tavuk ürünlerinden sonra süt, yoğurt, peynir, kaşar ve yumurta reyonlarında da çalışacak şekilde genişletilebilir olmalıdır. | **Could (Olabilir)** |

### 1.2. Fonksiyonel Olmayan Gereksinimler (Non-Functional Requirements - NFR)

| ID | Kategori | Açıklama | Öncelik (MoSCoW) |
| :--- | :--- | :--- | :--- |
| **NFR-01** | Performans / Hız | Kasada barkod okuma ve SKT doğrulama süresi **150 milisaniyenin** altında olmalıdır (Kasa kuyruklarını engellemek için). | **Must (Zorunlu)** |
| **NFR-02** | Güvenilirlik | Sistem, çevrimdışı (offline) modda da en son güncellenen lokal veri tabanından SKT kontrolü yapabilmelidir. | **Must (Zorunlu)** |
| **NFR-03** | Güvenlik | İndirim oranları ve bloke kaldırma yetkileri yalnızca yetkilendirilmiş mağaza müdürleri tarafından değiştirilebilmelidir. | **Must (Zorunlu)** |
| **NFR-04** | Ölçeklenebilirlik | Sistem, eş zamanlı olarak Türkiye genelindeki 3.720+ Migros mağazasından ve Sanal Market'ten gelen sorguları kaldırabilmelidir. | **Should (Gerekli)** |

---

## 👥 2. KULLANICI HİKAYELERİ & INVEST ANALİZİ (USER STORIES)

Sistemdeki üç ana persona (Kasiyer, Sanal Market Müşteri ve Reyon Görevlisi) için yazılan kullanıcı hikayeleri ve bunların **INVEST** (Independent, Negotiable, Valuable, Estimable, Small, Testable) kriterlerine göre değerlendirmesi aşağıdadır.

### US-01: Kasa Blokajı (Kasiyer Personası)
> **Bir Kasiyer olarak**, kasada tarihi geçmiş bir ürünü okuttuğumda sistemin satışı otomatik engellemesini istiyorum. **Böylece** müşteriye yanlışlıkla bozuk ürün satıp mağaza itibarını zedelememiş olurum.

### US-02: Dinamik İndirimli Tercih (Sanal Market Müşteri Personası)
> **Bir Sanal Market Müşterisi olarak**, online sipariş verirken süt ve et gibi ürünlerde bütçeme katkı sağlamak için indirimli yakın tarihli ürün seçebilmek istiyorum. **Böylece** hem daha az öderim hem de gıda israfının önüne geçilmesine yardımcı olurum.

### US-03: Otomatik SMS Bildirimi (Mağaza Müşteri Personası)
> **Bir Money Üyesi Müşteri olarak**, fiziksel mağazadan aldığım tavuk ürününün son kullanma tarihine az kaldığında telefonuma uyarı mesajı gelmesini istiyorum. **Böylece** aldığım ürünü evde unutup bozmadan zamanında tüketebilirim.

### 📊 INVEST Kalite Matrisi

| User Story | I (Bağımsız) | N (Müzakere Edilebilir) | V (Değerli) | E (Tahmin Edilebilir) | S (Küçük/Kompakt) | T (Test Edilebilir) | Sonuç |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **US-01 (Kasa)** | Evet | Evet | Yüksek (İtibar korur) | Evet (3 Gün) | Evet | Evet | **INVEST Uyumlu** |
| **US-02 (Online)**| Evet | Evet | Yüksek (Mali tasarruf) | Evet (5 Gün) | Evet | Evet | **INVEST Uyumlu** |
| **US-03 (SMS)** | Evet | Evet | Orta (Müşteri dostu) | Evet (2 Gün) | Evet | Evet | **INVEST Uyumlu** |

---

## 🥒 3. GHERKIN KABUL KRİTERLERİ (GHERKIN ACCEPTANCE CRITERIA)

Geliştiricilerin sistemi hatasız kodlayabilmesi için "Given-When-Then" formatında hazırlanmış test senaryoları.

### Senaryo 1: Kasada SKT Geçmiş Ürün Engellemesi
```gherkin
Senaryo: Son kullanma tarihi geçmiş et ürününün satışının engellenmesi
  Giriş: Sistemde günün tarihi "12.06.2026" olarak ayarlanmıştır.
  Ve: Reyondan alınan "Tavuk Göğsü" ürününün barkodundaki SKT "10.06.2026" olarak kodlanmıştır.
  Eyleme Geçildiğinde: Kasiyer ürünü kasadaki barkod okuyucuya okuttuğunda
  Sonuç Olarak: Sistem kasada kırmızı renkli "Satış Engellendi: Ürün SKT'si Geçmiştir!" uyarısı vermelidir
  Ve: Ürünün fiyatı fiş toplamına eklenmemelidir
  Ve: Kasa yazıcısından bu ürün için bip sesiyle birlikte hata uyarısı alınmalıdır.
```

### Senaryo 2: Kasada SKT Yakın Ürüne Otomatik İndirim Uygulanması
```gherkin
Senaryo: Son kullanma tarihine 2 gün kalmış ürüne %20 indirim uygulanması
  Giriş: Sistemde günün tarihi "08.06.2026" olarak ayarlanmıştır.
  Ve: "Dana Kıyma" ürününün barkodundaki SKT "10.06.2026" olarak kodlanmıştır.
  Eyleme Geçildiğinde: Kasiyer ürünü okuttuğunda
  Sonuç Olarak: Sistem ürünü "Kritik Yakın Tarihli Ürün" olarak algılamalıdır
  Ve: Ürün bedeline otomatik olarak %20 indirim uygulamalıdır
  Ve: Fiş detayında "%20 Yakın Tarih İndirimi" kalemi gösterilmelidir.
```

### Senaryo 3: Sanal Market Yakın Tarih Tercihi ve İndirim Tanımlaması
```gherkin
Senaryo: Müşterinin sanal marketten yakın tarihli indirimli süt tercih etmesi
  Giriş: Müşteri sanal market sepetine 50 TL değerinde "Migros Süt" eklemiştir.
  Eyleme Geçildiğinde: Sepet adımında "1-2 Gün SKT Fırsatı (%20 İndirimli)" seçeneğini seçtiğinde
  Sonuç Olarak: Sistem süt ürününün fiyatını 50 TL'den 40 TL'ye düşürmelidir
  Ve: Sipariş toplama ekranında (picker ekranı) bu ürünün reyonundaki yakın tarihli stoklardan seçilmesi uyarısı gösterilmelidir.
```

---

## 📊 4. UML USE CASE (KULLANIM DURUMU) MODELLEMESİ

Aşağıdaki şema, aktörlerin (Kasiyer, Müşteri ve Sistem) M-SKT yazılımı ile olan etkileşim sınırlarını göstermektedir.

```mermaid
useCaseDiagram
    left to right direction
    actor Kasiyer as "Kasiyer"
    actor Musteri as "Müşteri"
    actor Sistem as "M-SKT Sistemi"

    rectangle "M-SKT Satış & Takip Sistemi" {
        usecase UC1 as "Barkod Okutma"
        usecase UC2 as "SKT Kontrolü Yapma"
        usecase UC3 as "Satış Engelleme / Bloke"
        usecase UC4 as "Otomatik İndirim Uygulama"
        usecase UC5 as "Sanal Market Seçimi Yapma"
        usecase UC6 as "SMS / Fiş Bildirimi Gönderme"
    }

    Kasiyer --> UC1
    UC1 ..> UC2 : <<include>>
    UC2 --> Sistem
    Sistem --> UC3 : SKT Geçmişse
    Sistem --> UC4 : SKT Yakınsa
    Musteri --> UC5
    UC5 ..> UC4 : <<include>>
    UC4 ..> UC6 : <<include>>
```

* **Aktör Rolleri:**
  * **Kasiyer:** Fiziksel kasada ürünün barkodunu okutarak süreci başlatır.
  * **Müşteri:** Sanal markette tarih tercihini belirler.
  * **M-SKT Sistemi:** Veritabanı karşılaştırmalarını yapar, bloke koyar veya indirimi hesaplar, SMS gönderimini tetikler.
