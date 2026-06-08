# LUNA (M-SKT) Çözüm Mimarisi Projesi Sunum Metni

Bu sunum metni, **LUNA (M-SKT) Çözüm Mimarisi** projesini baştan sona akıcı, akademik ve profesyonel bir dille sunabilmeniz için hazırlanmıştır. Konuşmacı ayrımları veya süre sınırlandırmaları içermez; doğrudan konu başlıklarına göre yapılandırılmış, 15-20 dakikalık kesintisiz bir sunum içeriğidir.

---

## 1. GİRİŞ VE PROJE VİZYONU

Değerli jüri üyeleri, hocalarım ve sevgili arkadaşlarım, bugün sizlere gıda perakendeciliğinde operasyonel mükemmelliği, gıda güvenliğini ve sürdürülebilirliği bir araya getiren **LUNA (M-SKT) Çözüm Mimarisi** projemizi sunacağız.

Gıda perakendeciliği, çok yüksek hacimli ve son derece dinamik bir sektördür. Bu dinamizmin en kritik bacaklarından birini son tüketim tarihi (SKT) yönetimi oluşturmaktadır. Geleneksel perakende yaklaşımlarında SKT takibi; insan gücüne, mağaza personelinin dikkatine ve göz kontrolü rutinlerine dayanır. Bu durum, insan hatasını kaçınılmaz kılmakta, her yıl tonlarca taze gıdanın fire olarak çöpe gitmesine yol açarak ciddi finansal kayıplara neden olmakta ve en önemlisi de tarihi geçmiş ürünlerin kasadan geçerek müşteriye ulaşması gibi ciddi yasal ve marka itibarı riskleri barındırmaktadır.

LUNA (M-SKT) projemizin vizyonu; ürün kodunun yanına son tüketim tarihi bilgisini de gömen **GS1-128 barkod teknolojisini** kullanarak, lojistik depolardan kasadaki ödeme anına kadar olan tüm süreci dijital bir koruma kalkanı altına almaktır. Bu sayede, tarihi geçmiş bir ürünün kasadan geçişini teknik olarak imkansız hale getirirken; tarihi yaklaşan ürünleri dinamik fiyatlandırma mekanizmalarıyla eriterek gıda israfını en aza indirmeyi hedefliyoruz.

---

## 2. MEVCUT DURUM VE 3M (MUDA, MURA, MURI) ANALİZİ

Projemizin analiz aşamasında, mevcut Migros mağaza içi operasyonlarını yalın yönetim metodolojilerinden biri olan **3M Analizi** ile değerlendirdik. Amacımız, süreçteki katma değersiz adımları ve insan kaynağını yıpratan noktaları bilimsel olarak ortaya koymaktı:

*   **MUDA (İsraf):** Mevcut süreçte mağaza personelinin her sabah reyonları tek tek gezerek ürünlerin üzerindeki tarihleri gözle okuması en büyük 'iş gücü ve zaman israfıdır'. Personelimiz, katma değerli müşteri ilişkileri kurmak veya reyon kalitesini artırmak yerine, saatlerini kutu çevirip tarih okumakla harcamaktadır.
*   **MURA (Düzensizlik/Dalgalanma):** Mağaza yoğunluğunun tavan yaptığı kampanya dönemlerinde, hafta sonlarında veya personel eksikliğinde bu manuel kontroller aksamaktadır. Bu durum, kontrol sürecinin standartlaşamadığını ve bazı günlerde tarihi geçmiş ürünlerin reyonlarda kalabildiğini göstermektedir.
*   **MURI (Aşırı Yükleme):** Kasiyerlerden, hızlı kasa geçişi stresi altındayken her ürünün barkodunu okutmanın yanı sıra fiziksel tarih kontrolü yapmalarını da beklemek, çalışanlarımıza aşırı zihinsel yük bindirmektedir. Bu durum hata oranını dramatik düzeyde artırmaktadır.

---

## 3. SÜREÇ İYİLEŞTİRME VE EBO (ELIMINATE, SIMPLIFY, OPTIMIZE) MODELİ

Mevcut süreçteki bu verimsizlikleri ortadan kaldırmak amacıyla süreç iyileştirme adımlarımızı **EBO Modeli** çerçevesinde şekillendirdik:

*   **ELIMINATE (Eleme):** Personelin her sabah saatlerini alan manuel reyon kontrollerini süreçten tamamen eledik. Lojistik aşamasında sisteme girilen veriler sayesinde hangi rafta hangi tarihte ürün olduğunu sistem artık kendisi bilmektedir.
*   **SIMPLIFY (Basitleştirme):** Kasadaki kontrol adımlarını basitleştirdik. Kasiyerin inisiyatifini ve karar verme zorunluluğunu ortadan kaldırarak, doğrulama işlemini kasa arka plan yazılımına entegre ettik.
*   **OPTIMIZE (Optimizasyon):** Tarihi yaklaşan (örneğin son 1-2 gün kalmış) ürünleri sistem üzerinden otomatik tespit edip %20 gibi dinamik indirim oranları uyguladık ve Money üyelerine mobil uygulama üzerinden bildirim atarak satışı optimize ettik.

---

## 4. BPMN 2.0 SÜREÇ MİMARİSİ (AS-IS VE TO-BE)

Geliştirdiğimiz iş akışlarını standartlaştırmak adına **BPMN 2.0 (İş Süreci Modelleme Notasyonu)** standartlarında modelledik ve süreci iki farklı fazda karşılaştırdık:

*   **AS-IS (Mevcut Durum):** Bu şemada, sürecin tamamen reyon görevlisi ve kasiyerin göz kontrolüne bağımlı olduğunu görüyoruz. Eğer personel hata yaparsa, tarihi geçmiş ürün müşterinin sepetine giriyor. Kasada kasiyer de bunu fark etmezse hatalı satış gerçekleşiyor. Sürecin sonunda ise satılamayan ürünler %100 fire olarak çöpe gidiyor.
*   **TO-BE (Yeni Süreç):** LUNA entegrasyonuyla birlikte, lojistikte sisteme girilen ürün verileri (GTIN ve SKT) kasa sistemine akar. Mağaza içerisinde günlük otomatik SKT taraması sistem tarafından arka planda sorgulanır. Son 3 güne giren ürünler için sistem otomatik indirim kararı alır. Müşteri ürünü kasaya getirdiğinde barkod taranır; eğer ürünün tarihi geçmişse sistem satışı onaylamaz, ekranda uyarı verir ve kasa kilitlenir. Müşteri Money üyesi ise ve tarihi uygun bir ürün satın aldıysa, ürünün son günü geldiğinde mobil uygulama üzerinden akıllı bir tüketim uyarısı gönderilir.

---

## 5. PAYDAŞ YÖNETİMİ VE SORUMLULUK DAĞILIMI (RACI MATRİSİ)

Projenin hayata geçirilmesi sürecinde çok sayıda farklı departmanın bir arada çalışması gerekiyordu. Bu koordinasyonu yönetmek ve sorumluluk karmaşasını engellemek adına **RACI Matrisi** hazırladık:

*   **Bilgi Teknolojileri (IT) Ekibi (R - Sorumlu):** Barkod parsing algoritmasının yazılması ve kasa kilit mekanizmasının kurulmasında işi yapan teknik ekiptir.
*   **Mağaza Operasyon Direktörlüğü (A - Onaylayan/Hesap Veren):** Sürecin onaylanmasından, bütçelendirilmesinden ve projenin nihai başarısından sorumlu ana mercidir.
*   **Mağaza Müdürleri ve Kasiyerler (C - Danışılan):** Sistemin saha uygulamalarında kolaylık sağlaması adına arayüz tasarımlarında fikirleri alınmıştır.
*   **Tedarikçiler (I - Bilgilendirilen):** Lojistik bacağındaki etiket standartlarının değişimi konusunda bilgilendirilmişlerdir.

---

## 6. TASARIM ODAKLI DÜŞÜNME (DESIGN THINKING) ARAÇLARI

Sistemin sadece teknik olarak değil, kullanıcı dostu olarak da tasarlanması gerekiyordu. Bu yüzden **Design Thinking** prensiplerine dayanarak iki temel **Persona** tanımladık:

*   **Ayşe (Reyon Görevlisi):** Zaman kısıtından ve reyonlardaki ürünleri kaçırmaktan endişe eden, manuel iş yükü altında ezilen çalışanımız.
*   **Hakan (Müşteri):** Migros'tan alışveriş yaparken aldığı ürünlerin tazeliğine ve sağlığına önem veren, SKT'si geçmiş ürün alma korkusu yaşayan sadık müşterimiz.

Bu karakterler üzerinden hazırladığımız **Empati Haritaları**, bize çalışanların ve müşterilerin iç seslerini verdi. Ayşe'nin 'Tarihleri kontrol etmekten yoruldum, hata yaparsam ceza alırım' korkusunu ve Hakan'ın 'Çocuğuma aldığım sütün tarihi geçmiş çıkarsa ne yaparım?' endişesini masaya yatırdık. Bu bulgulardan yola çıkarak HMW (Nasıl Yapabiliriz?) sorularımızı formüle ettik:
*   *Kasiyerlerin ve reyon görevlilerinin üzerindeki kontrol baskısını teknoloji kullanarak nasıl hafifletebiliriz?*
*   *Müşterilerimizin Migros gıda güvenliğine olan inancını kasada otomatik bir koruma kalkanıyla nasıl pekiştirebiliriz?*

---

## 7. GEREKSİNİM MÜHENDİSLİĞİ VE KANO MODELİ ANALİZİ

Belirlediğimiz sistem gereksinimlerini yazılım mühendisliği standartlarına göre **Fonksiyonel (FR)** ve **Fonksiyonel Olmayan (NFR)** olarak ikiye ayırdık ve bunları **Kano Modeli** analiziyle önceliklendirdik:

*   **Must-Be (Temel / Olmazsa Olmaz) Sınıfı:** **FR-01 (Barkod Okuma ve Sorgulama)** ve **FR-04 (Kasa Engelleme ve Kilit)** gereksinimlerini bu sınıfa dahil ettik. Kasanın ürünü tanıması ve tarihi geçmişse satışı engellemesi sistemin temel varoluş sebebidir.
*   **Performance (Performans) Sınıfı:** **NFR-Hız (Sorgu süresinin 1 saniyenin altında olması)** ve **NFR-Güvenlik (Veri doğruluğu)** bu sınıftadır. Kasa işlem hızı ne kadar yüksek olursa, müşteri memnuniyeti ve operasyon verimliliği doğrusal olarak o kadar artacaktır.
*   **Attractive (Heyecan Verici / WOW) Sınıfı:** **FR-06 (Money App üzerinden akıllı SKT bildirimi)** ve yaklaşan tarihlere otomatik indirim tanımlanması bu sınıftadır. Müşterinin beklemediği bu proaktif yaklaşım, müşteri sadakatini artıran esas değer teklifimizdir.

---

## 8. TEKNOLOJİ ENTEGRASYONU: GS1-128 BARKOD STANDARDI

Bu sistemin arkasında yatan teknik standart **GS1-128 barkod yapısıdır**. Standart EAN-13 barkodları sadece ürün kimliğini tutarken, GS1-128 barkodu içerisinde alfabetik karakterler ve verileri ayıran **Uygulama Belirteçleri (Application Identifiers - AI)** bulundurur.

Geliştirdiğimiz entegrasyonda;
*   **AI (01)** belirteci ürünün küresel kodunu (GTIN),
*   **AI (17)** belirteci ise ürünün son tüketim tarihini (YYMMDD formatında) taşımaktadır.

Kasa sistemi barkodu okuduğu anda, yazılımımız bu belirteçleri ayrıştırır (parsing işlemi). Elde edilen SKT verisi, o anki sistem tarihi ile karşılaştırılır. Eğer fark sıfır veya negatif ise (yani tarih geçmişse) C# POS servisimiz satışı durdurarak ekrana blokaj uyarısı gönderir. Eğer fark 3 gün veya daha az ise, veritabanına indirimli fiyat yansıtılır.

---

## 9. İŞ KAZANIMLARI (ROI) VE KAPANIŞ

Sonuç olarak, LUNA (M-SKT) projesinin hayata geçirilmesiyle Migros için şu kazanımları hedefliyoruz:

*   **Sıfır Hata:** Tarihi geçmiş ürün satışı ihtimali tamamen ortadan kalkmaktadır.
*   **%40 Fire Azalışı:** Son 3 güne giren ürünlerin otomatik indirimle eritilmesi sayesinde imha oranları %40 düşmektedir.
*   **Operasyonel Hız:** Personelimiz sabah kontrollerinden muaf tutularak mağaza içi müşteri hizmetlerine yönlendirilmekte, bu da operasyonel verimliliği artırmaktadır.

LUNA ekibi olarak, perakendede gıda güvenliği ve teknolojinin entegrasyonunu sunduğumuz sunumumuzu dinlediğiniz için teşekkür ederiz. Şimdi sorularınızı yanıtlamaktan memnuniyet duyarız.

---

## ❓ SORU-CEVAP BÖLÜMÜ İÇİN SAVUNMA REHBERİ (EKİP İÇİN HAZIRLIK)

1.  **Soru: GS1-128 barkodlarını tüm ürünlere basmak operasyonel olarak zor değil mi?**
    *   *Cevap:* "Haklısınız, tüm tedarikçilerin bu barkoda geçmesi zaman alacaktır. Bu nedenle projeyi fazlara ayırdık. Faz 1'de, SKT riski en yüksek olan kırmızı et, beyaz et ve süt ürünleri gibi yerel Migros paketleme tesislerinde basılan ürünleri hedefledik. Tedarikçilerle GS1 standartları çerçevesinde entegrasyon sağlandıkça sistem diğer kategorilere yaygınlaştırılacaktır."
2.  **Soru: Kasiyerlerin sistemi manipüle etmesi (bypass etmesi) nasıl engelleniyor?**
    *   *Cevap:* "Kasa kilit mekanizması kasiyer yetki sınırlarının dışındadır. Satış engellendiğinde, işlem ancak mağaza müdürünün fiziksel veya dijital onayıyla (iade veya imha amacıyla) açılabilmektedir. Her engelleme olayı veritabanında loglanır ve bölge müdürlüğü raporlarına yansır."
3.  **Soru: Müşterinin sepete aldığı ürünün reyon fiyatı ile indirimli fiyatı uyuşmazsa ne olacak?**
    *   *Cevap:* "Sistem otomatik indirim kararı aldığında, reyonlardaki elektronik etiketler (ESL) sistemle senkronize olarak fiyatı günceller. Dolayısıyla müşteri reyonda da indirimli fiyatı görerek ürünü satın alır. Etiket karmaşası yaşanmaz."

---

*Bu dosya **c:\Users\User\Desktop\migros final\sunum_senaryosu.md** konumunda güncellenmiştir.*
