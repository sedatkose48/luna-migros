# LUNA Projesi Analiz Yöntemleri ve Terimler Kılavuzu

Bu doküman, Migros M-SKT (Luna) Projesi kapsamında hazırlanan sunum ve katalogda yer alan tüm analiz modellerini, proje yönetimi araçlarını ve teknik kavramları açıklamaktadır. Sunum öncesi kavramları hızlıca öğrenmeniz veya PDF çıktı alarak çalışabilmeniz için hazırlanmıştır.

---

## İÇİNDEKİLER
1. **3M Analizi** (Muda, Mura, Muri)
2. **EBO Modeli** (Eliminate, Simplify, Optimize)
3. **BPMN 2.0** (İş Süreci Modelleme ve Notasyonu)
4. **Paydaş Yönetimi** (Güç/İlgi Matrisi & RACI)
5. **Tasarım Odaklı Düşünme** (Persona, Empati Haritası, HMW)
6. **Kano Modeli ve Gereksinim Analizi** (FR, NFR, Kano Eğrileri)
7. **Teknolojik Standartlar** (GS1-128 Barkod Standartları)

---

## 1. 3M ANALİZİ (MUDA, MURA, MURI)
Yalın Üretim ve Yönetim metodolojisinden (Toyota Üretim Sistemi) türetilen, süreçlerdeki verimsizlikleri tespit etmek için kullanılan üç temel kavramdır.

| Kavram | Türkçe Karşılığı | Tanım | LUNA / M-SKT Projesinden Örnek |
| :--- | :--- | :--- | :--- |
| **MUDA** | **İsraf (Waste)** | Değer üretmeyen, kaynak (zaman, emek, para) tüketen her şeydir. 7 temel israf türü vardır (bekleme, fazla üretim, hata vb.). | Mağaza personelinin her sabah reyonları tek tek gezip gözle SKT (Son Kullanma Tarihi) kontrolü yapması zaman ve iş gücü **israfıdır**. |
| **MURA** | **Düzensizlik (Unevenness)** | İş yükündeki dalgalanmalar, standart olmama durumu ve tahmin edilemezliktir. | Kampanya dönemlerinde veya hafta sonlarında mağaza yoğunluğunun artmasıyla personelin SKT kontrolünü atlaması, iş akışındaki **düzensizliktir**. |
| **MURI** | **Aşırı Yükleme (Overburden)** | İnsanlara veya ekipmanlara kapasitelerinin üzerinde yük bindirerek hata yapmalarına yol açmaktır. | Personelin hem reyon düzenlemesi, hem kasaya bakması hem de yüzlerce ürünün SKT'sini manuel kontrol etmeye zorlanması zihinsel ve fiziksel **aşırı yüklemedir**. |

---

## 2. EBO MODELİ (ELIMINATE, SIMPLIFY, OPTIMIZE)
Süreç geliştirme süreçlerinde kullanılan **ESIA** (Eliminate, Simplify, Integrate, Automate) metodolojisinin Migros projesine uyarlanmış sade halidir. Amacı, mevcut süreci aşama aşama temizlemek ve otomatikleştirmektir.

1. **ELIMINATE (Ele / Yok Et):** Değer yaratmayan adımları süreçten tamamen çıkartmaktır.
   * *Projedeki Karşılığı:* Reyonlarda her sabah yapılan **manuel gözle kontrol** adımının tamamen elenmesi.
2. **SIMPLIFY (Basitleştir):** Süreçte kalması gereken ancak karmaşık olan adımları sadeleştirmektir.
   * *Projedeki Karşılığı:* Kasada kasiyerin ürünü satıp satmama kararı vermesi yerine, sistemin otomatik olarak tarihi geçmiş ürünü tespit edip **kasayı kilitlemesi** (kasiyerin karar yükünün basitleşmesi).
3. **OPTIMIZE (Optimize Et / İyileştir):** Kalan adımları teknoloji ve otomasyon yardımıyla en verimli hale getirmektir.
   * *Projedeki Karşılığı:* Yaklaşan SKT'li ürünlerin otomatik olarak fiyatının düşürülmesi (%20 indirim) ve Money App üzerinden hedefli müşteriye bildirim atılarak **firelerin hızlıca eritilmesi**.

---

## 3. BPMN 2.0 (BUSINESS PROCESS MODEL AND NOTATION)
İş süreçlerini hem iş analistlerinin hem de yazılımcıların teknik olarak anlayabileceği standart sembollerle (akış şeması) çizme yöntemidir.

* **AS-IS (Mevcut Durum) Analizi:** Proje veya yazılım geliştirilmeden önce sürecin şu anki manuel, sorunlu halini gösteren şemadır (Vize tesliminizdeki şema).
* **TO-BE (Hedeflenen Durum) Analizi:** Yeni sistem (LUNA) entegre edildikten sonra sürecin ne kadar hızlandığını ve otomatikleştiğini gösteren gelecekteki hedef akış şemasıdır (Final projenizdeki şema).
* **Havuz (Pool):** Sürecin gerçekleştiği ana organizasyonu (örn. Migros) temsil eder.
* **Kulvar (Lane):** Havuz içindeki departmanları veya rolleri ayırır (örn. Depo, Mağaza Personeli, Müşteri, Kasa/Sistem).
* **Ağ geçidi (Gateway - Rhombus/Baklava Dilimi):** Süreçteki karar noktalarıdır. "SKT geçmiş mi?", "Money üyesi mi?" gibi soruların sorulduğu ve akışın dallara ayrıldığı yerlerdir.

---

## 4. PAYDAŞ YÖNETİMİ VE SORUMLULUK ANALİZİ

### A. Güç / İlgi Matrisi
Projedeki kişilerin veya departmanların (paydaşların) projeyi etkileme güçleri ile projeye duydukları ilgi düzeyine göre 4 bölgeye ayrılmasıdır. Proje yöneticisinin kiminle nasıl iletişim kuracağını belirler.

* **Yüksek Güç - Yüksek İlgi (Yakından Yönet):** Projenin başarısı için en kritik kişilerdir. (Örn: Bilgi Teknolojileri Direktörü, Mağaza Operasyon Müdürü).
* **Yüksek Güç - Düşük İlgi (Memnun Et):** Güçlüdürler ama doğrudan ilgilenmezler, süreçlerden memnun tutulmalıdırlar. (Örn: Üst Yönetim/C-Level).
* **Düşük Güç - Yüksek İlgi (Bilgilendir):** Projeyi çok önemserler ama güçleri azdır, sürekli güncel tutulmalıdırlar. (Örn: Mağaza Personeli, Mağaza Müdürleri).
* **Düşük Güç - Düşük İlgi (Monitör Et):** Minimum çabayla sadece izlenirler. (Örn: Tedarikçiler).

### B. RACI Matrisi
Bir süreçteki görevlerin sorumluluklarını netleştirmek için kullanılan matristir. Harflerin anlamları:

* **R - Responsible (Yapan/Sorumlu):** İşi fiilen yapan kişi veya ekiptir.
* **A - Accountable (Onaylayan/Hesap Veren):** İşin nihai sonucundan sorumlu olan, kararı veren tek bir kişidir (Her satırda sadece bir tane "A" olmalıdır).
* **C - Consulted (Danışılan):** İşi yaparken görüşü, uzmanlığı alınan, iki yönlü iletişim kurulan kişilerdir.
* **I - Informed (Bilgilendirilen):** İş bittikten sonra sonuç hakkında tek yönlü olarak bilgilendirilen paydaşlardır.

---

## 5. TASARIM ODAKLI DÜŞÜNME (DESIGN THINKING) ARAÇLARI
Kullanıcıyı merkeze alarak (insan odaklı) yenilikçi çözümler üretmek için kullanılan bir problem çözme metodolojisidir.

* **Persona (Kullanıcı Temsili):** Hedef kullanıcı kitlesini temsil eden hayali bir karakter oluşturmaktır. Projede oluşturulan "Ayşe" (Mağaza Personeli) veya "Hakan" (Müşteri) karakterleri, sistemin kimin için tasarlandığını somutlaştırır.
* **Empati Haritası (Empathy Map):** Persona'nın dünyasını anlamak için yapılan 4 ana bölümlü çalışmadır:
  * *Ne Düşünüyor / Ne Hissediyor?* (Endişeleri, hedefleri)
  * *Ne Görüyor?* (Çevresi, rakipler)
  * *Ne Duyuyor?* (Arkadaşları, yöneticileri ne diyor)
  * *Ne Yapıyor / Ne Söylüyor?* (Dışarıya gösterdiği davranışlar)
  * *Acılar (Pains)* ve *Kazançlar (Gains)* analiz edilerek personelin gerçek ihtiyacı ortaya çıkarılır.
* **HMW (How Might We - Nasıl Yapabiliriz?) Soruları:** Empati aşamasında bulunan problemleri, beyin fırtınası yapılabilecek yapıcı soru kalıplarına dönüştürmektir.
  * *Örnek:* "Mağaza personelinin manuel SKT kontrol yükünü **nasıl azaltabiliriz?**" sorusu bir HMW sorusudur ve LUNA sisteminin doğuşunu tetiklemiştir.

---

## 6. KANO MODELİ VE GEREKSİNİM ANALİZİ
Müşteri memnuniyetini ve özellik önceliklendirmesini anlamak için Noriaki Kano tarafından geliştirilen bir ürün geliştirme modelidir. Özellikleri memnuniyet derecesine göre gruplar.

### A. Kano Eğrileri (Gereksinim Sınıfları)
1. **Must-Be / Temel Gereksinimler (Eğride Kırmızı Çizgi):** Olmazsa olmaz özelliklerdir. Varlığı memnuniyeti artırmaz (zaten olması gerekir) ama yokluğu **felakete/şikayete** yol açar.
   * *Projedeki Örneği:* **FR-01: Barkod Okuma**. Kasada barkodun okunması temel gereksinimdir. Ekstra memnuniyet yaratmaz ama barkod okunmazsa kasa durur.
2. **Performance / Performans Gereksinimleri (Eğride Mavi Düz Çizgi):** Ne kadar çok/iyi yapılırsa memnuniyet o kadar doğrusal artar. Az yapılması memnuniyeti düşürür.
   * *Projedeki Örneği:* **NFR-Hız**. Sistemin barkodu sorgulama ve onaylama süresi. Süre ne kadar kısa (hızlı) olursa kasiyer ve müşteri o kadar memnun olur.
3. **Attractive / Heyecan Verici Gereksinimler (Eğride Yeşil Çizgi):** Müşterinin beklemediği, sürpriz özelliklerdir. Yokluğu memnuniyetsizlik yaratmaz (çünkü bilinmiyordur) ama varlığı **büyük hayranlık ve bağlılık (WOW efekti)** yaratır.
   * *Projedeki Örneği:* **FR-06: Money App Üzerinden Yaklaşan SKT Bildirimi**. Müşteriye evindeyken "Aldığınız sütün SKT'si bugün doluyor, tüketmeyi unutmayın!" mesajı gitmesi heyecan verici bir özelliktir.

### B. Yazılım Mühendisliği Terimleri
* **FR (Functional Requirement - Fonksiyonel Gereksinim):** Sistemin **ne yapacağını** belirten işlevsel kurallardır. (Örn: Barkod okunduğunda SKT kontrolü yapılsın).
* **NFR (Non-Functional Requirement - Fonksiyonel Olmayan Gereksinim):** Sistemin bu işi **nasıl bir kalitede** yapacağını belirten niteliklerdir. Performans, güvenlik, hız, ölçeklenebilirlik gibi kriterlerdir. (Örn: Barkod doğrulama işlemi **1 saniyenin altında** gerçekleşmelidir).

---

## 7. TEKNOLOJİK STANDARTLAR (GS1-128 BARKOD)
Lojistik ve perakende zincirinde ürünlerin takip edilebilirliğini sağlamak amacıyla kullanılan uluslararası barkod standardıdır.

* **Klasik Barkod (EAN-13):** Sadece ürünün kimlik numarasını (GTIN) tutar. SKT veya parti numarasını içinde barındıramaz.
* **GS1-128 Barkod:** İçerisinde birden fazla bilgiyi aynı anda taşıyabilen alfabetik destekli gelişmiş barkoddur. Bilgileri ayırt etmek için **Uygulama Belirteçleri (Application Identifiers - AI)** kullanır:
  * **(01)**: Ürün Kodu (GTIN)
  * **(17)**: Son Tüketim Tarihi (YYMMDD formatında)
  * **(10)**: Parti/Lot Numarası
* *LUNA Entegrasyonu:* LUNA, kasada bu barkod okunduğunda **(17)** belirtecini otomatik olarak ayıklar (parsing), bugünün tarihiyle kıyaslar ve tarihi geçmişse satışı engeller.

---

*Bu dosya **c:\Users\User\Desktop\migros final\terimler.md** konumunda oluşturulmuştur. Bu dosyayı bir Markdown okuyucuda açıp tarayıcıdan "Yazdır -> PDF olarak kaydet" diyerek kolayca PDF formatına dönüştürebilirsiniz.*
