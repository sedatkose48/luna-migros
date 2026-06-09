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

### 7.1. Kano Modeli Bölüm Girişi
"Çözümümüzü tasarlarken yalnızca sistemin neler yapacağını belirlemekle yetinmedik. Aynı zamanda bu özelliklerin müşteri memnuniyetini nasıl etkilediğini de analiz ettik.

Bu amaçla Kano Modeli kullandık.

Kano modeli bize bir özelliğin ne kadar önemli olduğunu değil, müşteri memnuniyetini nasıl etkilediğini gösteriyor.

Bazı özellikler müşterinin zaten beklediği temel gereksinimlerdir. Bazıları memnuniyeti performansla birlikte artırır. Bazıları ise müşteri tarafından beklenmez ancak sunulduğunda yüksek memnuniyet yaratır.

Bu nedenle çözümümüzdeki özellikleri Temel Özellikler, Performans Özellikleri, Heyecan Verici Özellikler ve Etkisiz Özellikler olarak değerlendirdik."

### 7.2. Heyecan Verici Özellikler (Attractive/Delighter)
*   **Money App Hatırlatma Bildirimi (FR-06):**
    "İlk olarak heyecan verici özellikler kategorisinde Money uygulaması üzerinden gönderilen SKT hatırlatma bildirimleri yer alıyor.
    
    Buradaki mantık şu: Bir müşteri marketten tavuk veya et ürünü satın aldığında normal şartlarda marketten daha sonra herhangi bir takip hizmeti beklemez. Yani müşterinin zihninde 'Marketten tavuk aldım, birkaç gün sonra bana ürünün son kullanma tarihini hatırlatsın' şeklinde bir beklenti bulunmuyor.
    
    Ancak sistem müşteriye örneğin; '3 gün önce satın aldığınız tavuk ürününün son kullanma tarihine 1 gün kaldı' şeklinde bir bildirim gönderdiğinde müşteri bunun kendisi için ekstra bir hizmet olduğunu düşünüyor. Bu özellik olmadığında müşteri şikayet etmez çünkü zaten böyle bir beklentisi yoktur. Ancak sunulduğunda markaya karşı güven, şeffaflık ve müşteri odaklılık algısı önemli ölçüde artar. Bu nedenle Money uygulaması üzerinden yapılan SKT bildirimini heyecan verici özellik olarak değerlendirdik."

### 7.3. Performans Özellikleri (Linear/Performance)
*   **Sanal Market Seçim Ekranı (FR-04):**
    "Performans özellikleri kategorisinde ilk olarak Sanal Market seçim ekranı yer alıyor. Sanal marketten alışveriş yaparken müşteriye iki seçenek sunuyoruz. Birincisi normal fiyattan standart SKT'li ürün satın almak. İkincisi ise SKT'si yaklaşmış ürünü indirimli satın almak.
    
    Burada müşteri ne kadar çok indirimli ürün seçeneği görürse ve bu indirim oranı ne kadar tatmin edici olursa memnuniyet düzeyi de o kadar artıyor. Dolayısıyla buradaki memnuniyet sunulan performans ve seçenek kalitesiyle doğrusal bir ilişki gösteriyor. Bu nedenle bunu Performans Özelliği olarak değerlendirdik."
*   **Performans - Hız (NFR-SPEED / NFR-01):**
    "Performans kategorisindeki ikinci unsur sistem hızı. Kasada barkod okutulduğunda SKT kontrolünün gerçekleşmesi gerekiyor. Ancak bu kontrol işlemi kasayı yavaşlatırsa müşteri deneyimi olumsuz etkilenir. Örneğin sistem her ürün için birkaç saniye bekletiyorsa müşteri memnuniyeti düşecektir.
    
    Ancak kontrol işlemi neredeyse anlık gerçekleşiyorsa (150 ms altında), müşteri hem güvenlikten hem de hızdan aynı anda faydalanacaktır. Burada memnuniyet seviyesi performans seviyesiyle doğrudan ilişkilidir. Sistem ne kadar hızlı çalışırsa müşteri memnuniyeti de o kadar yükselir. Bu nedenle hız kriterini Performans Özelliği olarak değerlendirdik."

### 7.4. Temel Özellikler (Must-Be/Threshold)
*   **Barkod Çözümleme (FR-01):**
    "Temel özellikler kısmında ilk olarak barkod çözümleme yer alıyor. Aslında bu özellik müşterinin fark ettiği bir özellik değil. Müşteri kasada ürün satın alırken sistemin barkodu okuyup okuyamadığını düşünmez. Bunu zaten çalışması gereken bir altyapı olarak kabul eder.
    
    Ancak barkod okunmazsa veya sistem SKT bilgisini çekemezse bütün çözüm çalışamaz hale gelir. Dolayısıyla bu özellik müşteriyi mutlu etmez ama eksik olması ciddi memnuniyetsizlik yaratır. Bu nedenle Temel Özellik kategorisindedir."
*   **Doğruluk ve Kesinlik (NFR-ACC / NFR-07):**
    "Temel özelliklerimizin ikincisi doğruluk ve kesinliktir. Kasa barkod okuma ve karar motorunun hata payı minimum düzeyde (%99.99 doğruluk oranıyla) olmalıdır. Müşteri kasadan geçerken yanlış bloke kararlarıyla veya yanlış indirim hesaplamalarıyla karşılaşmamalıdır. Bu durum gıda güvenliği zincirini bozacağı gibi mağaza önünde kuyruklara ve güven kaybına yol açar. Müşteri bu doğruluğu normalde övmez, bunu zaten olması gereken temel bir standart olarak görür. Ancak en ufak bir hata büyük bir memnuniyetsizlik yaratacağı için doğruluk ve kesinlik kriterini Temel Özellik olarak sınıflandırdık."
*   **Güvenlik / KVKK (NFR-SEC / NFR-03):**
    "Temel özelliklerimizin üçüncüsü ise Güvenlik ve KVKK uyumluluğudur. Money Kart entegrasyonu ve müşteri son tüketim tarihi bilgileri kişisel veri kapsamındadır. Bu verilerin transferi ve depolanması tamamen şifreli kanallar üzerinden, KVKK standartlarına uygun olarak yapılmalıdır. Müşteri alışveriş yaparken verilerinin güvenliğini düşünmez, bunu sistemin zaten sağlamasını bekler. Ancak herhangi bir veri ihlali veya güvenlik açığı geri dönülemez bir memnuniyetsizliğe yol açar. Bu nedenle güvenlik ve veri korumayı Temel Özellik kategorisinde değerlendirdik."

### 7.5. Etkisiz Özellikler (Indifferent)
*   **SKT Verilerinin Analiz Amaçlı Depolanması (INF-01):**
    "Son olarak, Etkisiz özellikler kategorisinde SKT verilerinin analiz amaçlı depolanması yer alıyor. Sistem arka planında, satılan ve imha edilen ürünlerin son kullanma tarihi verilerini ileride stok tahmini ve talep yönetimi yapabilmek amacıyla depoluyoruz. Bu veri depolama ve analiz işlemi, müşterinin doğrudan tecrübe ettiği bir özellik değildir. Bu özelliğin varlığı müşteriyi ekstra mutlu etmeyeceği gibi, yokluğu da müşteri tarafında herhangi bir memnuniyetsizlik yaratmaz. Bu nedenle bu özelliği Kano modelinde Etkisiz Özellik olarak sınıflandırdık."

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
