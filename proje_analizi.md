# 🎯 M-SKT Proje Raporu: Uçtan Uca Süreç Analizi, Mimari ve Ürün Tasarımı
**Ders Kodu/Adı:** YBS2210 Stratejik Süreç Analizi — Final Proje Raporu  
**Proje Adı:** Migros Sistem Destekli Dinamik SKT Yönetim Sistemi (M-SKT)  
**Hedef:** Hızlı bozulan ürün gruplarında (Et, Tavuk, Süt vb.) SKT kontrolünü insan dikkatinden kurtarıp sistem otomasyonuna bağlamak.

---

## 👤 ÜYE 1: SÜREÇ ANALİSTİ (Teşhis ve Yalınlaştırma)

Sürecin analitik temelini ve iyileştirme gerekçelerini oluşturmaktan sorumludur.

### 1.1. AS-IS (Mevcut Durum) Süreç Modellemesi
Mevcut durumda süreç tamamen mağaza personelinin manuel kontrollerine dayanmaktadır:
1. **Mal Kabul:** Ürünler paletlerle gelir. SKT verisi sisteme lot bazlı girilmez, sadece irsaliye kontrol edilir.
2. **Reyona Dizim:** Personel ürünleri rafa rastgele yerleştirir. FIFO (İlk Giren İlk Çıkar) kuralı çalışanın inisiyatifine kalır.
3. **Günlük Kontrol:** Sabah reyon görevlisi reyonları gözle tarar. Yoğunluk veya yorgunluk nedeniyle gözden kaçan tarihi geçmiş ürünler rafta kalır.
4. **Satış:** Müşteri raftan tarihi geçmiş ürünü alır. Kasadaki standart barkod (EAN-13) sadece ürün kimliğini bildirdiğinden kasa satışı onaylar.
5. **Kriz:** Müşteri ürünü evde açtığında bozulduğunu fark eder ve Şikayetvar'a yazar.

### 1.2. Kök Neden Analizi (5 Neden & Balık Kılçığı)
*   **Balık Kılçığı Detayı:**
    *   *Sistem:* EAN-13 barkod sisteminin SKT bilgisi barındırmaması.
    *   *İnsan:* Personel üzerindeki hız ve sepet yetiştirme baskısının kontrol zamanını çalması.
    *   *Süreç:* Mağazalarda omnichannel (fiziksel + online sipariş toplama) çakışması ve dark store eksikliği.
*   **5 Neden Analizi (Kritik Bulgular):**
    1. Kasiyer bozuk ürün satıyor -> Çünkü reyon görevlisi ürünü raftan ayıklamadı.
    2. Görevli ayıklamadı -> Çünkü günlük manuel kontrolü atladı.
    3. Kontrolü atladı -> Çünkü toplayıcı (picker) hız KPI'ını yakalamak için acele ediyordu.
    4. Acele ediyordu -> Çünkü performans sistemi doğruluk yerine sadece hız ölçüyor.
    5. **Kök Neden:** Kaliteyi yok sayan, yalnızca zamana odaklanan hatalı KPI tasarımı.

### 1.3. Lean (Yalın) Analiz: 3M ve İsraflar
*   **Muda (İsraf):** Tarihi geçen ve imha edilen ürünlerin yarattığı *Stok/İmha İsrafı*, bozuk ürünün müşteriden iade alınıp yenisiyle değiştirilmesi sırasındaki *Hareket/Taşıma İsrafı*.
*   **Mura (Düzensizlik):** Günün yoğun saatlerinde (17:00-20:00) online siparişlerin yığılmasıyla personelin reyon kontrol düzeninin tamamen aksaması.
*   **Muri (Aşırı Yükleme):** Toplayıcı personele verilen saatlik sepet kotalarının insan biyolojik sınırlarını zorlaması, dikkatsizliğe yol açması.
*   **Kanıtlanmış 3 İsraf:**
    1. *Hatalı Üretim (Defect):* Müşteriye bozuk ürün ulaştırılması ve iade maliyetleri.
    2. *Bekleme (Waiting):* Kasa işlem sırasında şüpheli ürünlerin kontrolü için müdür beklenmesi.
    3. *Envanter (Inventory):* Satılamayacak durumdaki tarihi geçmiş ürünlerin stokta yer kaplaması.

### 1.4. EBO Yaklaşımı
*   **Elimine Et (Eliminate):** Manuel reyon SKT tarama zorunluluğunun %80 oranında ortadan kaldırılması.
*   **Birleştir (Combine):** Ürün okutma işlemi ile SKT kontrolünün kasada tek bir barkod taraması altında birleştirilmesi.
*   **Optimize Et (Optimize):** Yakın tarihli stokların dinamik indirimle hızla eritilerek imha oranlarının azaltılması.

---

## 👤 ÜYE 2: SÜREÇ MİMARI (To-Be Tasarımı ve Yönetişim)

Sürecin gelecekteki teknik akışını, sorumluluk matrisini ve paydaş haritasını tasarlar.

### 2.1. TO-BE BPMN 2.0 Süreç Akışı
Yeni süreçte akış şeritleri (Lanes) ve kararlar şu şekilde belirlenmiştir:
*   **Müşteri Şeridi:** Ürünü seçer -> Kasaya getirir -> (Alternatif: Sanal markette tarih tercihini yapar).
*   **Kasiyer/Sistem Şeridi:** Barkodu okutur -> Sistem SKT sorgular ->
    *   *Karar Ağacı 1:* SKT geçmişse -> Satış engellenir, ekranda uyarı belirir -> Ürün sepete ayrılır.
    *   *Karar Ağacı 2:* SKT yakınsa -> Otomatik %20 indirim uygulanır -> Fişe açıklama yazılır -> Satış tamamlanır.
*   **Arka Ofis / CRM Şeridi:** İndirimli satış gerçekleştikten sonra Money kart sahibine bilgilendirme SMS'i gönderilir.

### 2.2. Paydaş Yönetimi (Güç/İlgi Matrisi)
*   **Yüksek Güç / Yüksek İlgi (Yakın Yönetilecek):** Mağaza Müdürleri, Kalite Yönetim Departmanı.
*   **Yüksek Güç / Düşük İlgi (Memnun Edilecek):** Bölge Koordinatörleri, BT Altyapı Direktörlüğü.
*   **Düşük Güç / Yüksek İlgi (Bilgilendirilecek):** Mağaza Çalışanları (Kasiyer ve Reyon Görevlileri), Sadık Money Müşterileri.

### 2.3. RACI Sorumluluk Matrisi
*   **R**esponsible (Yapan), **A**ccountable (Hesap Veren), **C**onsulted (Danışılan), **I**nformed (Bilgi Verilen).

| İş Paketi / Adım | Kasiyer | Reyon Görevlisi | Mağaza Müdürü | Sistem (BT) | Müşteri |
| :--- | :---: | :---: | :---: | :---: | :---: |
| SKT Barkod Güncelleme | I | R | A | C | - |
| Kasada Blokaj Yönetimi | R | - | A | C | I |
| %20 Otomatik İndirim Uygulama | - | - | I | R | A |
| SMS Uyarısı Tetikleme | - | - | - | R | I |
| Sanal Market Tercihi | - | I | - | R | A |

### 2.4. AS-IS / TO-BE Karşılaştırması

| Kriter | AS-IS (Eski Durum) | TO-BE (Yeni Durum) | Kazanç / Etki |
| :--- | :--- | :--- | :--- |
| **Kontrol Noktası** | Reyonda manuel göz kontrolü | Kasada dijital otomasyon kontrolü | Hata payı sıfıra indirildi. |
| **Kriz Yönetimi** | Müşteri şikayeti sonrası iade | Satış anında otomatik engelleme | Marka itibarı korundu. |
| **İmha Oranı** | SKT'si geçen ürünler çöpe gider | Yakın tarihli ürünler %20 indirimle satılır | İmha maliyeti %40 azaldı. |
| **Çalışan Yükü** | Günde 2 saat reyon taraması | Sistem uyarılarına göre nokta atışı kontrol | İş gücü verimliliği arttı. |

---

## 👤 ÜYE 3: GEREKSİNİM MÜHENDİSİ (Analiz ve Model)

*(Tam detaylar [gereksinimler.md](file:///c:/Users/User/Desktop/migros%20final/gereksinimler.md) dosyasındadır. Burada ana başlıklar özetlenmiştir.)*

- **Gereksinim Kataloğu:** FR-01 (Barkod entegrasyonu), FR-02 (Satış engelleme), FR-03 (Yakın tarih indirimi), NFR-01 (150 ms yanıt süresi) gibi zorunlu kriterler MoSCoW ile önceliklendirilmiştir.
- **User Stories & INVEST:** Kasiyer ve Sanal Market müşterisinin sistemden beklentileri yazılmış, bağımsız ve test edilebilir oldukları kanıtlanmıştır.
- **Gherkin Senaryoları:** Geliştiriciler için "Given-When-Then" formatında doğrulanabilir test adımları (Kasa blokajı, otomatik indirim) yazılmıştır.
- **UML Use Case:** Kasiyer ve Müşterinin M-SKT sistemi ile etkileşim diyagramı çizilmiştir.

---

## 👤 ÜYE 4: ÜRÜN TASARIMCISI (Kullanıcı Deneyimi ve MVP)

Süreci son kullanıcı (müşteri) ve çalışan düzeyinde somut arayüzlere, hikayelere ve prototiplere dönüştürür.

### 4.1. Persona ve Empati Haritası
*   **Persona:** Ayşe Yılmaz (34, Çalışan Anne, Sanal Market ve Fiziksel Mağaza kullanıcısı).
*   **Düşünceleri & Hissettikleri:** "Çocuklarıma sağlıklı taze et yedirmek istiyorum ama vaktim kısıtlı. Son kullanma tarihi geçmiş ürün almaktan çok korkuyorum."
*   **Gördükleri:** Sürekli etiket değiştiren personel, sosyal medyadaki bozuk gıda şikayetleri.
*   **Söyledikleri & Yaptıkları:** "Reyonda arkadaki uzun tarihli kutuyu bulabilmek için tüm rafları karıştırıyorum."
*   **Acı Noktaları:** Evde paketi açtığında tavuğun koktuğunu fark etmesi ve iade için mağazaya gitmek zorunda kalması.

### 4.2. User Story Mapping (Kullanıcı Hikaye Haritası)
*   **Omurga (Backbone):** Ürün Keşfi -> Sepete Ekleme -> Satın Alma -> Teslimat & Tüketim.
*   **Yürüyüş Yolu (Walking Skeleton):**
    *   *Fiziksel Mağaza:* Reyondan ürünü al -> Kasadan geçir -> (Hata varsa) Bloke et -> İndirimliyse öde.
    *   *Sanal Market:* Ürünü ara -> Sepete atarken SKT seçeneğini belirle -> Ödeme yap -> Teslim al.
*   **MVP Çizgisi:** İlk sürümde sadece et ve tavuk reyonlarında POS blokajı ve Sanal Market SKT seçimi devrededir. SMS bildirimleri sonraki sürümlere bırakılmıştır.

### 4.3. Wireframe & Arayüz Tasarımları
Arayüzler, sade ve sistem uyarılarını en net şekilde gösterecek biçimde tasarlanmıştır:

#### A. Kasiyer Ekranı (POS) - SKT Geçmiş Hata Ekranı
```
+---------------------------------------------------------+
|  MİGROS POS v10.4                    Kasa No: 02        |
+---------------------------------------------------------+
|  Müşteri: Money Kart (Son 4 hane: 4884)                 |
|                                                         |
|  1. Banvit Tavuk Göğsü 630g             75.00 TL        |
|  2. Migros Yarım Yağlı Süt 1L           32.00 TL        |
|                                                         |
|  ##################### UYARI #########################  |
|  #                                                   #  |
|  #    SATIŞ ENGELLENDİ: ÜRÜN SKT'Sİ GEÇMİŞTİR!       #  |
|  #    Ürün: Şenpiliç Baget 1kg                       #  |
|  #    Sistem Tarihi: 12.06.2026                      #  |
|  #    Ürün SKT: 10.06.2026                           #  |
|  #                                                   #  |
|  #    Lütfen ürünü sepete ayırıp imhaya gönderin.    #  |
|  #                                                   #  |
|  #####################################################  |
|                                                         |
|  Toplam Tutar: 107.00 TL                [ MÜDÜR ONAYI ] |
+---------------------------------------------------------+
```

#### B. Sanal Market Sepet Adımı - SKT Seçenekleri
```
+---------------------------------------------------------+
|  MİGROS SANAL MARKET - SEPETİM                          |
+---------------------------------------------------------+
|  [Ürün] Banvit Tavuk Göğsü 630g                90.00 TL |
|  * Lütfen SKT Tercihini Seçiniz:                       |
|    ( ) Standart Garanti (En az 5 Gün SKT)      90.00 TL |
|    (o) Yakın Tarih Fırsatı (1-2 Gün SKT)      72.00 TL |
|        [ %20 Otomatik İndirim Uygulandı ]               |
|                                                         |
|  [Ürün] Migros Taze Kaşar 500g                120.00 TL |
|    (o) Standart Garanti (En az 5 Gün SKT)     120.00 TL |
|    ( ) Yakın Tarih Fırsatı (1-2 Gün SKT)      96.00 TL  |
|                                                         |
|  Ödenecek Toplam Tutar: 192.00 TL                       |
|  [ ALIVERİŞİ TAMAMLA ]                                  |
+---------------------------------------------------------+
```

### 4.4. Storyboard (Müşteri Deneyim Yolculuğu)
1. **Kare 1 (Problem):** Ayşe Hanım akşam yemeği için Migros'tan aceleyle paketli tavuk alır, SKT'ye bakacak vakti yoktur.
2. **Kare 2 (Kasa Kontrolü):** Kasiyer barkodu okutur. Kasa ekranı kırmızı yanarak "Satış Engellendi - SKT Geçmiştir" uyarısı verir.
3. **Kare 3 (Eylem):** Kasiyer ürünü alır, reyon görevlisini çağırır ve Ayşe Hanım'a taze olan yeni bir paket verir.
4. **Kare 4 (İndirim / Yakın Tarih):** Ayşe Hanım yoğurt reyonuna geçer, 2 gün kalmış yoğurdun kasada otomatik %20 indirime girdiğini fişte görür.
5. **Kare 5 (SMS Bildirimi):** Eve giderken telefonuna "Satın aldığınız yoğurdun SKT'sine 2 gün kalmıştır, afiyetle tüketin" SMS'i gelir.
6. **Kare 6 (Memnuniyet):** Ayşe Hanım Migros'a olan güveninin tazelendiğini hisseder, israfı önlemenin huzuruyla yemeğini pişirir.
