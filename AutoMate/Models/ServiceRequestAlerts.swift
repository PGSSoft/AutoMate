/// Represents possible system service messages and label values on buttons.

import XCTest

extension SystemAlertAllow {
    public static var allow: [String] {
        return [
            "승인",
            "Разрешить",
            "Tamam",
            "ОК",
            "OKE",
            "אישור",
            "OK",
            "ตกลง",
            "موافق",
            "Permitir",
            "好",
            "ठीक",
        ]
    }
}

extension SystemAlertDeny {
    public static var deny: [String] {
        return [
            "ไม่อนุญาต",
            "No permetre",
            "Заборонити",
            "عدم السماح",
            "Ikke tillat",
            "No permitir",
            "不允许",
            "許可しない",
            "Nepovoliť",
            "Άρνηση",
            "Nu permiteți",
            "אל תאפשר",
            "Não permitir",
            "Jangan Benarkan",
            "Nie pozwalaj",
            "Tidak Boleh",
            "Non consentire",
            "Don’t Allow",
            "不允許",
            "İzin Verme",
            "Nemoj dozvoliti",
            "Zakázat",
            "허용 안 함",
            "Tillåt inte",
            "Tillad ikke",
            "Älä salli",
            "Từ chối",
            "Tiltás",
            "अनुमति न दें",
            "Weiger",
            "Nicht erlauben",
            "Refuser",
            "Não Permitir",
            "Запретить",
        ]
    }
}

public struct SpeechRecognitionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "Αίτημα από «%@» για πρόσβαση στην Αναγνώριση ομιλίας",
        "Data pertuturan daripada aplikasi ini akan dihantar kepada Apple untuk memproses permintaan anda. Ini turut akan membantu Apple meningkatkan teknologi pengecaman pertuturannya.",
        "Rečové dáta z tejto aplikácie budú kvôli spracovaniu vašich žiadostí odoslané do Apple a použité aj na vylepšovanie technológie rozpoznávania reči spoločnosti Apple.",
        "Les données vocales de cette app seront envoyées à Apple pour traiter vos demandes. Cela permettra aussi à Apple d’améliorer sa technologie de reconnaissance vocale.",
        "Data ucapan dari app ini akan dikirimkan ke Apple untuk memproses permintaan Anda. Ini juga akan membantu Apple meningkatkan teknologi pengenalan ucapannya.",
        "“%@” Mahu Mengakses Pengecaman Pertuturan",
        "« %@ » souhaite accéder à la reconnaissance vocale.",
        "«%@» vil ha tilgang til talegjenkjenning",
        "“%@” gostaria de aceder ao reconhecimento da fala",
        "Röstdata från den här appen skickas till Apple så att dina instruktioner kan behandlas. Detta hjälper även Apple att förbättra tekniken för röstigenkänning.",
        "此 App 的語音資料會傳送給 Apple 來處理您的要求。這也可協助 Apple 改進其語音辨識技術。",
        "“%@”想访问语音识别",
        "Podaci govora iz ove aplikacije poslat će se Appleu radi obrade vaših zahtjeva. Time će se također pomoći Appleu u poboljšanju tehnologije prepoznavanja govora.",
        "“%@” बोली पहचान तक पहुँचना चाहता है",
        "נתוני דיבור מיישום זה יישלחו אל Apple לצורך עיבוד בקשותיך. הנתונים גם יעזרו ל-Apple לשפר את טכנולוגיית זיהוי הדיבור שלה.",
        "आपके अनुरोधों को पूरा करने के लिए इस ऐप से बोली डेटा Apple को भेजा जाएगा। इससे Apple को अपनी बोली पहचान तकनीक को बेहतर बनाने में भी मदद मिलेगी।",
        "„%@“ möchte auf die Spracherkennung zugreifen",
        "“%@” Would Like to Access Speech Recognition",
        "Sprachdaten von dieser App werden an Apple gesendet, um deine Anfragen zu verarbeiten. Außerdem werden sie verwendet, um Apple beim Verbessern der Spracherkennungstechnologie zu unterstützen.",
        "“%@” želi pristupiti prepoznavanju govora",
        "사용자의 요청을 처리하기 위해 이 앱의 음성 데이터가 Apple에 전송됩니다. 이는 Apple의 음성 인식 기술 향상에도 도움이 됩니다.",
        "ข้อมูลเสียงพูดจากแอพนี้จะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ การทำงานนี้จะช่วย Apple ปรับปรุงเทคโนโลยีการจดจำเสียงพูดของบริษัทด้วย",
        "“%@” vol accedir al reconeixement de veu",
        "Os dados de fala desta aplicação serão enviados à Apple para processar os seus pedidos. Estará igualmente a ajudar a Apple a melhorar a respetiva tecnologia de reconhecimento da fala.",
        "“%@” Konuşma Tanımaya Erişmek İstiyor",
        "“%@” Muốn Truy cập Nhận dạng Lời nói",
        "「%@」要取用語音辨識",
        "يرغب \"%@\" في الوصول إلى \"التعرف على الكلام\"",
        "“%@” vil bruge talegenkendelse",
        "‘%@’이(가) 음성 인식에 접근하려고 합니다",
        "Dane mowy zostaną wysłane do Apple w celu przetworzenia żądań. Pomoże to Apple w udoskonalaniu technologii rozpoznawania mowy.",
        "Aplikácia „%@“ žiada o prístup k rozpoznávaniu reči",
        "A beszédadatok el lesznek küldve az alkalmazásból az Apple-nek a kérelme feldolgozásához. Ez segít az Apple-nek a beszédfelismerési technológiájának fejlesztésében is.",
        "”%@” begär åtkomst till röstigenkänning",
        "Dados de fala deste aplicativo serão enviados à Apple para processar as solicitações. Isso também ajudará a Apple a melhorar sua tecnologia de reconhecimento de fala.",
        "Tämän apin puhetiedot lähetetään Applelle pyyntöjesi käsittelyä varten. Tämä auttaa myös Applea parantamaan puheentunnistusteknologiaansa.",
        "Spraakgegevens uit deze app worden naar Apple verstuurd om je verzoeken te verwerken. Deze gegevens worden ook gebruikt om de spraakherkenningstechnologie van Apple te verbeteren.",
        "Голосові дані з цієї програми будуть надсилатися до Apple для опрацювання ваших запитів. Це також допоможе Apple вдосконалювати технологію розпізнавання мовлення.",
        "Речевые данные из этой программы будут отправлены в Apple на обработку Ваших запросов. Это также поможет Apple в улучшении технологии речевого распознавания.",
        "A(z) „%@” hozzá szeretne férni a beszédfelismeréshez",
        "「%@」想要取用語音辨識",
        "部分来自此应用的语音数据将发送给 Apple 以处理您的请求。这还将帮助 Apple 改进语音识别技术。",
        "Τα φωνητικά δεδομένα από αυτήν την εφαρμογή θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας. Αυτό θα βοηθήσει επίσης την Apple να βελτιώσει την τεχνολογία της ως προς την αναγνώριση ομιλίας.",
        "このAppからの音声データはリクエストを処理するためにAppleに送信されます。また、音声認識技術の向上にも役立てられます。",
        "„%@” chce uzyskać dostęp do rozpoznawania mowy",
        "سيتم إرسال بيانات الكلام من هذا التطبيق إلى Apple بهدف معالجة طلباتك. كما أن هذا سيساعد Apple على تحسين تقنية التعرف على الكلام.",
        "Los datos de voz de esta aplicación se enviarán a Apple para procesar tus solicitudes. Estos datos también ayudan a Apple a mejorar su tecnología de reconocimiento de voz.",
        "%@ wil toegang tot spraakherkenning",
        "Talegenkendelsesdata fra denne app, sendes til Apple til behandling af dine anmodinger. Det hjælper desuden Apple med at forbedre sin talegenkendelsesteknologi.",
        "“%@” ar dori să acceseze recunoașterea vocală",
        "Программа «%@» запрашивает доступ к «Распознаванию речи».",
        "“%@” ต้องการที่จะเข้าถึงการจดจำเสียงพูด",
        "İsteklerinizi işlemek için bu uygulamadaki konuşma verileri Apple’a gönderilir. Bu aynı zamanda Apple’ın konuşma tanıma teknolojisini geliştirmesine de yardımcı olur.",
        "“%@” Deseja Ter Acesso ao Reconhecimento de Voz",
        "Speech data from this app will be sent to Apple to process your requests. This will also help Apple improve its speech recognition technology.",
        "“%@” Ingin Mengakses Pengenalan Ucapan",
        "Taledata fra denne appen vil bli sendt til Apple for å behandle forespørslene dine. Dette vil også hjelpe Apple med å forbedre talegjenkjenningsteknologien.",
        "Les dades de veu d’aquesta aplicació s’enviaran a Apple per processar les teves peticions i perquè Apple pugui millorar la tecnologia de reconeixement de veu.",
        "„%@“ žádá o přístup k rozpoznávání řeči",
        "%@ haluaa käyttää puheentunnistusta",
        "Datele vocale din această aplicație vor fi trimise la Apple pentru a vă procesa solicitările. Aceasta va ajuta și la îmbunătățirea tehnologiei de recunoaștere vocală Apple.",
        "Les données vocales recueillies par cette app seront envoyées à Apple pour traiter vos demandes. Cela aidera également Apple à améliorer sa technologie en matière de reconnaissance vocale.",
        "“%@” desidera accedere all'opzione di riconoscimento vocale",
        "«%@» хоче отримати доступ до розпізнавання команд",
        "Řečová data z této aplikace budou odeslána do Apple na pomoc se zpracováním vašich požadavků a vylepšováním technologie rozpoznávání řeči.",
        "“%@”が音声認識へのアクセスを求めています",
        "Dữ liệu lời nói từ ứng dụng này sẽ được gửi đến Apple để xử lý yêu cầu của bạn. Việc nãy cũng sẽ giúp Apple cải thiện công nghệ nhận dạng lời nói của mình.",
        "此 App 的語音識別數據將傳送給 Apple 以處理你的請求。這亦會有助 Apple 改善語音識別技術。",
        "I dati vocali di quest'app verranno inviati ad Apple per l'elaborazione delle tue richieste. L'invio dei dati consentirà ad Apple di migliorare la propria tecnologia di riconoscimento vocale.",
        "“%@” quiere acceder al reconocimiento de voz",
        "״%@״ מעוניין לגשת אל זיהוי הדיבור שלך",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct SiriAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "Möchtest du „%@“ mit Siri benutzen?",
        "Wil je %@ gebruiken met Siri?",
        "¿Quieres usar “%@” con Siri?",
        "Chcete používať aplikáciu „%@“ so Siri?",
        "Sesetengah data %@ anda akan dihantar kepada Apple untuk memproses permintaan anda.",
        "Adakah Anda Mahu Menggunakan “%@” dengan Siri?",
        "%@: θέλετε να χρησιμοποιείται με το Siri;",
        "Gostaria de usar “%@” com Siri?",
        "คุณต้องการที่จะใช้ “%@” กับ Siri หรือไม่",
        "Apakah Anda Ingin Menggunakan “%@” dengan Siri?",
        "Viss information från %@ skickas till Apple så att dina instruktioner kan behandlas.",
        "आपके अनुरोधों को पूरा करने के लिए आपके %@ का कुछ डेटा Apple को भेजा जाएगा।",
        "Vil du bruge “%@” med Siri?",
        "Želite li koristiti “%@” sa Siri?",
        "“%@”をSiriで使用しますか?",
        "Algunes dades de %@ s’enviaran a Apple per processar les teves peticions.",
        "חלק מהנתונים של %@ יישלחו אל Apple לצורך עיבוד בקשותיך.",
        "Algunos de tus datos en %@ se enviarán a Apple para procesar tus solicitudes.",
        "%@データの一部は、リクエストを処理するためにAppleに送信されます。",
        "Haluatko, että %@ on Sirin käytössä?",
        "Vil du bruke %@ med Siri?",
        "Ви хочете вживати «%@» разом із Siri?",
        "“%@” uygulamasını Siri ile kullanmak ister misiniz?",
        "Osa apin %@ tiedoista lähetetään Applelle pyyntöjesi käsittelyä varten.",
        "Хотите использовать «%@» с Siri?",
        "Một số dữ liệu %@ của bạn sẽ được gửi đến Apple để xử lý yêu cầu của bạn.",
        "您要在「%@」上使用 Siri 嗎？",
        "Souhaitez-vous utiliser « %@ » avec Siri?",
        "Деякі ваші дані %@ будуть надсилатися до Apple для опрацювання ваших запитів.",
        "Alguns dados da aplicação %@ serão enviados à Apple para processar os seus pedidos.",
        "Einige deiner Daten von %@ werden an Apple gesendet, um deine Anfragen zu verarbeiten.",
        "Noen av dataene fra %@ blir sendt til Apple for å behandle forespørslene dine.",
        "Alguns dos seus dados de %@ serão enviados à Apple para processar as solicitações.",
        "İsteklerinizi işlemek için %@ verilerinizden bazıları Apple’a gönderilir.",
        "사용자의 요청을 처리하기 위해 사용자의 %@ 데이터 일부가 Apple에 전송됩니다.",
        "Deseja Usar “%@” com a Siri?",
        "Κάποια από τα δεδομένα σας στην εφαρμογή «%@» θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας.",
        "您要通过 Siri 来使用“%@”吗？",
        "%@ 的部分資料將傳送給 Apple 以處理你的請求。",
        "Alcuni dati di %@ verranno inviati ad Apple per elaborare le tue richieste.",
        "Nogle af dine %@-data sendes til Apple for at behandle dine anmodninger.",
        "Would You Like to Use “%@” with Siri?",
        "Część danych programu %@ zostanie wysłana do Apple w celu przetworzenia żądań.",
        "Certaines de vos données %@ seront envoyées à Apple pour traiter vos demandes.",
        "Vill du använda %@ med Siri?",
        "您的部分“%@”数据将发送给 Apple 以处理您的请求。",
        "Souhaitez-vous utiliser « %@ » avec Siri ?",
        "Některá data aplikace %@ budou odeslána do Apple na pomoc se zpracováním vašich požadavků.",
        "A(z) %@ adatai közül néhány el lesz küldve az Apple-nek az Ön kérelme feldolgozásához.",
        "Neki vaši %@ podaci poslat će se Appleu radi obrade vaših zahtjeva.",
        "ข้อมูลของ %@ บางอย่างจะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ",
        "Bạn có muốn sử dụng “%@” với Siri không?",
        "您的部分「%@」資料會傳送給 Apple 來處理您的要求。",
        "Vuoi utilizzare “%@” con Siri?",
        "Enkele gegevens van %@ worden naar Apple verstuurd om je verzoeken te verwerken.",
        "Doriți să utilizați “%@ cu Siri?",
        "Unele dintre datele %@ vor fi trimise la Apple pentru a vă procesa solicitările.",
        "האם ברצונך להשתמש ב-״%@״ עם Siri?",
        "Some of your %@ data will be sent to Apple to process your requests.",
        "Szeretné a következőt a Sirivel használni: „%@”?",
        "你要透過 Siri 使用「%@」嗎？",
        "Некоторые из Ваших данных %@ будут отправлены в Apple на обработку запросов.",
        "سيتم إرسال بعض بيانات %@ إلى Apple بهدف معالجة طلباتك.",
        "Sebagian data %@ Anda akan dikirimkan ke Apple untuk memproses permintaan Anda.",
        "Siri를 ‘%@’에 사용하겠습니까?",
        "Czy chcesz używać „%@” z Siri?",
        "क्या आप “%@” को Siri के साथ उपयोग करना चाहेंगे?",
        "Niektoré dáta aplikácie %@ budú kvôli spracovaniu vašich žiadostí odoslané do Apple.",
        "Chcete „%@“ používat se Siri?",
        "هل ترغب في استخدام \"%@\" مع Siri؟",
        "Vols utilitzar “%@” amb Siri?",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct RemindersAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "”%@” begär åtkomst till dina påminnelser",
        "“%@”想访问您的提醒事项",
        "“%@” Deseja Ter Acesso aos Seus Lembretes",
        "“%@” Ingin Mengakses Pengingat Anda",
        "„%@“ möchte auf deine Erinnerungen zugreifen",
        "“%@” आपके रिमाइंडरों तक पहुँचना चाहता है",
        "“%@” Mahu Mengakses Peringatan Anda",
        "“%@” ar dori să vă acceseze mementourile",
        "“%@”がリマインダーへのアクセスを求めています",
        "“%@” Would Like to Access Your Reminders",
        "“%@” Muốn Truy cập Lời nhắc của bạn",
        "« %@ » souhaite accéder à vos rappels.",
        "“%@” quiere acceder a tus recordatorios",
        "Программа «%@» запрашивает доступ к «Напоминаниям».",
        "“%@” Anımsatıcılarınıza Erişmek İstiyor",
        "Αίτημα από «%@» για πρόσβαση στις Υπομνήσεις σας",
        "“%@” vol accedir als teus recordatoris",
        "「%@」想要取用您的提醒事項",
        "Aplikácia „%@“ žiada o prístup k pripomienkam",
        "A(z) „%@” hozzá szeretne férni az Ön emlékeztetőihez.",
        "%@ haluaa käyttää muistutuksiasi",
        "Aplikace „%@“ žádá o přístup k vašim připomínkám",
        "يرغب \"%@\" بالوصول إلى التذكيرات الخاصة بك",
        "“%@” vil bruge dine påmindelser",
        "״%@״ מעוניין לגשת למשימות שלך",
        "‘%@’이(가) 사용자의 미리 알림에 접근하려고 합니다",
        "«%@» vil ha tilgang til påminnelsene dine",
        "«%@» хоче отримати доступ до ваших нагадувань",
        "「%@」要取用你的提醒事項",
        "“%@” gostaria de aceder aos seus lembretes",
        "“%@” vorrebbe accedere ai tuoi Promemoria",
        "%@ wil toegang tot je herinneringen",
        "“%@” želi pristupiti vašim podsjetnicima",
        "“%@” ต้องการที่จะเข้าถึงเตือนความจำของคุณ",
        "„%@” chce uzyskać dostęp do Przypomnień",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct PhotosAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "”%@” begär åtkomst till dina bilder",
        "%@ haluaa käyttää kuviasi",
        "״%@״ מעוניין לגשת לתמונות שלך",
        "“%@” Mahu Mengakses Foto Anda",
        "Программа «%@» запрашивает доступ к «Фото».",
        "«%@» хоче отримати доступ до ваших фото",
        "「%@」想要取用您的照片",
        "“%@” Would Like to Access Your Photos",
        "“%@” quiere acceder a tus fotos",
        "«%@» vil ha tilgang til bildene dine",
        "“%@” gostaria de aceder às suas fotografias",
        "“%@”想访问您的照片",
        "“%@” ar dori să vă acceseze pozele",
        "Aplikace „%@“ žádá o přístup k vašim fotografiím",
        "“%@” आपकी तस्वीरों तक पहुँचना चाहता है",
        "“%@” vil bruge dine fotos",
        "“%@” Deseja Ter Acesso às Suas Fotos",
        "“%@” ต้องการที่จะเข้าถึงรูปภาพของคุณ",
        "「%@」要取用你的相片",
        "“%@” vol accedir a les teves fotos",
        "« %@ » souhaite accéder à vos photos.",
        "“%@” vorrebbe accedere alle tue Foto",
        "“%@” želi pristupiti vašim fotografijama",
        "“%@”が写真へのアクセスを求めています",
        "%@ wil toegang tot je foto's",
        "“%@” Fotoğraflarınıza Erişmek İstiyor",
        "Aplikácia „%@“ žiada o prístup k fotkám",
        "“%@” Muốn Truy cập Ảnh của bạn",
        "“%@” Ingin Mengakses Foto Anda",
        "‘%@’이(가) 사용자의 사진에 접근하려고 합니다",
        "„%@” chce uzyskać dostęp do Zdjęć",
        "يرغب \"%@\" بالوصول إلى الصور الخاصة بك",
        "„%@“ möchte auf deine Fotos zugreifen",
        "Αίτημα από «%@» για πρόσβαση στις Φωτογραφίες σας",
        "A(z) „%@” hozzá szeretne férni az Ön fotóihoz.",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CameraAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "%@ haluaa käyttää kameraa",
        "‘%@’이(가) 카메라에 접근하려고 합니다",
        "„%@” chce uzyskać dostęp do Aparatu",
        "״%@״ מבקש להשתמש במצלמה",
        "“%@” vol accedir a la càmera",
        "“%@” želi pristupiti kameri",
        "“%@” Deseja Ter Acesso à Câmera",
        "“%@” gostaria de aceder à Câmara",
        "Программа «%@» запрашивает доступ к «Камере».",
        "A(z) „%@” hozzá szeretne férni az Ön kamerájához.",
        "“%@” quiere acceder a la cámara",
        "“%@” Muốn Truy cập Camera",
        "“%@” Would Like to Access the Camera",
        "“%@” ar dori să acceseze camera",
        "“%@” vil bruge kameraet",
        "%@ wil toegang tot de camera",
        "“%@” Mahu Mengakses Kamera",
        "Aplikácia „%@“ žiada o prístup ku kamere",
        "”%@” begär åtkomst till kameran",
        "«%@» vil ha tilgang til kameraet",
        "“%@” ต้องการที่จะเข้าถึงกล้อง",
        "“%@” Kameraya Erişmek İstiyor",
        "“%@” Ingin Mengakses Kamera",
        "« %@ » souhaite accéder à l’appareil photo.",
        "يرغب \"%@\" بالوصول إلى الكاميرا الخاصة بك",
        "“%@” कैमरा तक पहुँचना चाहता है",
        "«%@» хоче отримати доступ до Камери",
        "Aplikace „%@“ žádá o přístup k fotoaparátu",
        "“%@”想访问您的相机",
        "“%@” vorrebbe accedere alla fotocamera",
        "„%@“ möchte auf deine Kamera zugreifen",
        "「%@」要取用相機",
        "“%@”がカメラへのアクセスを求めています",
        "Αίτημα από «%@» για πρόσβαση στην Κάμερα",
        "「%@」想要取用您的相機",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct AddressBookAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“%@” आपके संपर्कों तक पहुँचना चाहता है",
        "A(z) „%@” hozzá szeretne férni az Ön kontaktjaihoz.",
        "“%@” Would Like to Access Your Contacts",
        "«%@» vil ha tilgang til kontaktene dine",
        "「%@」要取用通訊錄",
        "«%@» хоче отримати доступ до ваших контактів",
        "Программа «%@» запрашивает доступ к «Контактам».",
        "“%@” vorrebbe accedere ai tuoi Contatti",
        "“%@” ar dori să vă acceseze contactele",
        "“%@” Ingin Mengakses Kontak Anda",
        "Aplikácia „%@“ žiada o prístup ku kontaktom",
        "“%@”想访问您的通讯录",
        "„%@“ möchte auf deine Kontakte zugreifen",
        "“%@” ต้องการที่จะเข้าถึงรายชื่อของคุณ",
        "“%@”が連絡先へのアクセスを求めています",
        "“%@” Kişilerinize Erişmek İstiyor",
        "“%@” Muốn Truy cập Danh bạ của bạn",
        "يرغب \"%@\" بالوصول إلى جهات الاتصال الخاصة بك",
        "“%@” Deseja Ter Acesso aos Seus Contatos",
        "Αίτημα από «%@» για πρόσβαση στις Επαφές σας",
        "“%@” gostaria de aceder aos seus contactos",
        "‘%@’이(가) 사용자의 연락처에 접근하려고 합니다",
        "“%@” želi pristupiti vašim kontaktima",
        "“%@” vil bruge dine kontakter",
        "%@ wil toegang tot je contacten",
        "Aplikace „%@“ žádá o přístup k vašim kontaktům",
        "%@ haluaa käyttää yhteystietojasi",
        "« %@ » souhaite accéder à vos contacts.",
        "„%@” chce uzyskać dostęp do Kontaktów",
        "“%@” vol accedir als teus contactes",
        "「%@」想要取用聯絡資訊",
        "“%@” quiere acceder a tus contactos",
        "״%@״ מבקש לגשת לאנשי הקשר שלך",
        "“%@” Mahu Mengakses Kenalan Anda",
        "”%@” begär åtkomst till dina kontakter",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MediaLibraryAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "‘%@’이(가) Apple Music 및 사용자의 미디어 보관함에 접근하려고 합니다.",
        "„%@“ möchte auf Apple Music und deine Mediathek zugreifen",
        "“%@” Would Like to Access Apple Music and Your Media Library",
        "%@ quiere acceder a Apple Music y a tu biblioteca multimedia",
        "“%@” Apple Music और आपकी मीडिया लाइब्रेरी तक पहुँचना चाहता है",
        "“%@” Ingin Mengakses Apple Music Dan Perpustakaan Media Anda",
        "يرغب \"%@\" في الوصول إلى Apple Music ومكتبة الوسائط",
        "“%@” Deseja Acessar o Apple Music e a sua Biblioteca de Mídia",
        "“%@” ar dori să acceseze Apple Music și biblioteca dvs. multimedia",
        "“%@” gostaria de aceder a Apple Music e à sua biblioteca de multimédia",
        "“%@”, Apple Music'e ve Ortam Arşivinize Erişmek İstiyor",
        "“%@”想要访问 Apple Music 和您的媒体资料库",
        "「%@」想取用 Apple Music 及你的媒體資料庫",
        "‏“%@” מעוניין לגשת ל-Apple Music ולספריית המדיה שלך.",
        "“%@” želi pristupiti Apple Musicu i vašoj glazbenoj medijateci",
        "“%@” Mahu Mengakses Apple Music Dan Pustaka Media Anda",
        "“%@” vil bruge Apple Music og dit mediebibliotek",
        "“%@” ต้องการที่จะเข้าถึง Apple Music และคลังสื่อของคุณ",
        "“%@” muốn truy cập Apple Music và thư viện phương tiện của bạn",
        "«%@» vil ha tilgang til Apple Music og mediebiblioteket ditt",
        "“%@”がApple Musicとメディアライブラリへのアクセスを求めています",
        "「%@」想要取用 Apple Music 和您的媒體資料庫",
        "“%@” desidera accedere ad Apple Music e alla tua libreria di contenuti",
        "“%@” Would Like to Access Apple Music And Your Media Library",
        "Αίτημα από «%@» για πρόσβαση στο Apple Music και στη Βιβλιοθήκη πολυμέσων σας",
        "%@ haluaa käyttää Apple Musicia ja mediakirjastoasi",
        "« %@ » aimerait accéder à Apple Music et à votre bibliothèque multimédia.",
        "”%@” vill få tillgång till Apple Music och ditt mediebibliotek",
        "«%@» запрашивает доступ к Apple Music и Вашей Медиатеке",
        "Aplikácia „%@“ žiada o prístup k Apple Music a vašej knižnici médií",
        "“%@” vol accedir a l’Apple Music i a la biblioteca multimèdia",
        "« %@ » souhaite accéder à Apple Music et à votre bibliothèque multimédia.",
        "'%@' wil toegang tot Apple Music en je mediabibliotheek",
        "„%@” chce uzyskać dostęp do Apple Music i Twojej biblioteki multimediów",
        "«%@» хоче мати доступ до Apple Music і вашої медіатеки",
        "Aplikace „%@“ žádá o povolení k přístupu k Apple Music a vaší knihovně médií",
        "A(z) „%@” hozzá szeretne férni az Apple Musichoz és az Ön médiakönyvtárához",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct BluetoothPeripheralAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“%@” mahu menyediakan data kepada peranti Bluetooth berdekatan walaupun anda tidak menggunakan aplikasi.",
        "「%@」要在你並非正在使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "״%@״ מעוניין לאפשר להתקני Bluetooth קרובים לקבל גישה לנתונים אפילו כשאינך משתמש/ת ביישום.",
        "“%@”が近隣のBluetoothデバイスに、Appを使用していないときでもデータ通信することを求めています。",
        "Αίτημα από «%@» για να καθιστά δεδομένα διαθέσιμα σε κοντινές συσκευές Bluetooth ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή.",
        "“%@” deseja disponibilizar dados para os dispositivos Bluetooth por perto até mesmo quando você não estiver usando o aplicativo.",
        "%@ wil gegevens beschikbaar stellen voor Bluetooth-apparaten in de buurt, ook als je de app niet gebruikt.",
        "“%@” vil gerne gøre data tilgængelige for Bluetooth-enheder i nærheden, også når du ikke bruger appen.",
        "“%@”, siz uygulamayı kullanmıyorken bile yakındaki Bluetooth aygıtları için verileri kullanılabilir yapmak istiyor.",
        "“%@” vol posar les dades a disposició dels dispositius Bluetooth propers fins i tot quan no utilitzis l’aplicació.",
        "A(z) „%@” adatokat akar elérhetővé tenni közeli Bluetooth-eszközök számára akkor is, amikor Ön nem használja az alkalmazást.",
        "“%@” vorrebbe rendere disponibili i dati ai dispositivi Bluetooth nelle vicinanze anche quando non è in uso.",
        "Aplikace %@ žádá o povolení ke zpřístupnění dat blízkým Bluetooth zařízením i v čase, kdy ji právě nepoužíváte.",
        "「%@」想要在未使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "„%@“ möchte Daten mit Bluetooth-Geräten in der Nähe teilen, auch wenn die App nicht benutzt wird.",
        "%@ quiere que los datos estén disponibles para los dispositivos Bluetooth cercanos aunque no estés utilizando la aplicación.",
        "Aplikácia „%@“ chce sprístupňovať dáta pre okolité Bluetooth zariadenia, aj keď ju práve nepoužívate.",
        "«%@» ønsker å gjøre data tilgjengelig for Bluetooth-enheter i nærheten selv om appen ikke er i bruk.",
        "“%@”想在您未使用该应用时仍与周围的蓝牙设备交换数据。",
        "“%@” muốn làm cho dữ liệu khả dụng đối với thiết bị Bluetooth ở gần ngay cả khi bạn không sử dụng ứng dụng.",
        "« %@ » voudrait rendre les données disponibles auprès des appareils Bluetooth à proximité lorsque vous n’utilisez pas cette app.",
        "“%@” would like to make data available to nearby Bluetooth devices even when you’re not using the app.",
        "“%@” आस-पास के ब्लूटूथ उपकरणों पर डेटा उपलब्ध कराना चाहता है, भले ही आप ऐप का उपयोग न कर रहे हों।",
        "%@ haluaa antaa dataa lähellä oleville Bluetooth-laitteille, vaikka et käyttäisikään appia.",
        "“%@” ingin membuat data tersedia untuk perangkat Bluetooth di sekitar saat Anda sedang tidak menggunakan app.",
        "Program „%@” chce udostępniać dane pobliskim urządzeniom Bluetooth, także gdy go nie używasz.",
        "Mesmo quando não está a ser usado, “%@” gostaria de disponibilizar dados a dispositivos Bluetooth que se encontrem por perto.",
        "Программа «%@» запрашивает разрешение на предоставление данных ближайшим устройствам с Bluetooth, даже когда Вы не работаете с программой.",
        "”%@” vill göra dina data tillgängliga för andra Bluetooth-enheter i närheten, även när du inte använder appen.",
        "“%@” ต้องการที่จะให้ข้อมูลที่มีกับอุปกรณ์บลูทูธใกล้เคียงแม้ว่าคุณจะไม่ได้ใช้แอพอยู่",
        "يرغب \"%@\" في إتاحة البيانات إلى أجهزة Bluetooth القريبة حتى عند عدم استخدامك للتطبيق.",
        "« %@ » voudrait rendre des données disponibles aux appareils Bluetooth proches lorsque vous n’utilisez pas cette app.",
        "사용자가 해당 앱을 사용하고 있지 않을 때에도 ‘%@’이(가) Bluetooth 기기 근처에서 데이터를 사용하려고 합니다.",
        "“%@” želi učiniti podatke dostupnima obližnjim Bluetooth uređajima, čak i kad ne koristite aplikaciju.",
        "“%@” ar dori să pună la dispoziție date dispozitivelor Bluetooth din apropiere chiar și atunci când nu utilizați aplicația.",
        "«%@» хоче надавати пристроям Bluetooth поблизу доступ до дних, навіть коли ви не вживаєте цю програму.",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MicrophoneAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "يرغب \"%@\" بالوصول إلى الميكروفون",
        "“%@” ต้องการที่จะเข้าถึงไมโครโฟน",
        "“%@” želi pristupiti mikrofonu",
        "“%@” Mikrofona Erişmek İstiyor",
        "“%@” Muốn Truy cập Micrô",
        "“%@”想访问您的麦克风",
        "Aplikácia „%@“ žiada o prístup k mikrofónu",
        "“%@” Ingin Mengakses Mikrofon",
        "“%@” quiere acceder al micrófono",
        "%@ haluaa käyttää mikrofonia",
        "Aplikace „%@“ žádá o přístup k mikrofonu",
        "« %@ » souhaite accéder au micro.",
        "“%@” Would Like to Access the Microphone",
        "„%@” chce uzyskać dostęp do mikrofonu",
        "Αίτημα από «%@» για πρόσβαση στο Μικρόφωνο",
        "Программа «%@» запрашивает доступ к микрофону.",
        "«%@» хоче отримати доступ до мікрофона",
        "A(z) „%@” hozzá szeretne férni az Ön mikrofonjához.",
        "「%@」想要取用您的麥克風",
        "‘%@’이(가) 마이크에 접근하려고 합니다.",
        "”%@” begär åtkomst till mikrofonen",
        "“%@” vil bruge mikrofonen",
        "«%@» vil ha tilgang til mikrofonen",
        "“%@”がマイクへのアクセスを求めています",
        "“%@” ar dori să acceseze microfonul",
        "“%@” vol accedir al micròfon",
        "„%@“ möchte auf das Mikrofon zugreifen",
        "%@ wil toegang tot de microfoon",
        "「%@」要取用咪高風",
        "“%@” Deseja Ter Acesso ao Microfone",
        "״%@״ מעוניין להשתמש במיקרופון",
        "“%@” माइक्रोफ़ोन तक पहुँचना चाहता है",
        "“%@” Mahu Mengakses Mikrofon",
        "“%@” vorrebbe accedere al microfono",
        "“%@” gostaria de aceder ao microfone",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CallsAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“%@” gostaria de proporcionar uma interface de chamada nativa",
        "« %@ » souhaite apporter une expérience d’appel native.",
        "“%@” स्थानीय इन-कॉल अनुभव प्रदान करना चाहेगा",
        "%@ wil de ingebouwde interface voor het gesprek gebruiken",
        "Программа «%@» запрашивает разрешение предоставить свою штатную телефонную функциональность.",
        "“%@” Ingin Memberikan Pengalaman Dalam Panggilan Asli",
        "“%@”想提供原生通话体验",
        "「%@」要提供整合式來電體驗",
        "“%@”はネイティブな着信機能を提供しようとしています。",
        "«%@» vil bruke den innebygde samtalefunksjonen",
        "“%@”, Özgün Çağrı İçi Deneyimi Sağlamak İstiyor",
        "“%@” quiere proporcionar una experiencia nativa durante las llamadas",
        "Aplikácia „%@“ chce poskytovať natívne hovory",
        "“%@” Would Like to Provide a Native In-Call Experience",
        "„%@“ möchte integrierte Im-Anruf-Funktionalität ermöglichen",
        "“%@” Mahu Menyediakan Pengalaman Dalam Panggilan Asli",
        "“%@” ar dori să furnizeze o experiență integrată în cadrul apelului",
        "%@ haluaa tarjota perinteisen puhelutoiminnon",
        "يرغب \"%@\" في تقديم تجربة مكالمات أصلية",
        "Αίτημα από «%@» για παροχή εγγενούς εμπειρίας κλήσης",
        "“%@” desidera fornire un'esperienza di chiamata integrata",
        "״%@״ מעוניין לספק חוויית שימוש מקורית בזמן שיחה",
        "“%@” ต้องการที่จะให้การรับสายโทรศัพท์เข้าที่เหมือนจริง",
        "“%@” želi pružiti nativno iskustvo poziva.",
        "«%@» хоче забезпечити власний функціонал під час виклику",
        "“%@” muốn Cung cấp Trải nghiệm Trong cuộc gọi Tự nhiên",
        "A(z) „%@” híváson belüli funkciót szeretne nyújtani",
        "„%@“ žádá o povolení k poskytování nativních hovorů",
        "‘%@’이(가) 네이티브 통화를 제공하려고 합니다.",
        "“%@” Deseja Oferecer uma Experiência Nativa na Ligação",
        "%@ vill använda den inbyggda uppringningsfunktionen",
        "「%@」想要提供原生通話體驗",
        "“%@” vil bruge den indbyggede opkaldsfunktion",
        "„%@” chce oferować natywny interfejs połączenia",
        "“%@” vol oferir‑te una experiència nativa de trucada",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CalendarAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "„%@“ möchte auf deinen Kalender zugreifen",
        "«%@» хоче отримати доступ до вашого календаря",
        "״%@״ מעוניין לגשת ללוח השנה שלך",
        "Aplikácia „%@“ žiada o prístup ku kalendáru",
        "“%@” Muốn Truy cập Lịch của bạn",
        "「%@」要取用你的日曆",
        "“%@” vol accedir al teu calendari",
        "“%@” vorrebbe accedere al tuo Calendario",
        "“%@” vil bruge din kalender",
        "%@ haluaa käyttää kalenteriasi",
        "‘%@’이(가) 사용자의 캘린더에 접근하려고 합니다",
        "“%@” Ingin Mengakses Kalender Anda",
        "%@ wil toegang tot je agenda",
        "„%@” chce uzyskać dostęp do Kalendarza",
        "”%@” begär åtkomst till din kalender",
        "「%@」想要取用您的行事曆",
        "«%@» vil ha tilgang til kalenderen din",
        "“%@”想访问您的日历",
        "“%@” Mahu Mengakses Kalendar Anda",
        "“%@” želi pristupiti vašem kalendaru",
        "« %@ » souhaite accéder à votre calendrier.",
        "Aplikace „%@“ žádá o přístup k vašemu kalendáři",
        "“%@”がカレンダーへのアクセスを求めています",
        "“%@” gostaria de aceder ao seu calendário",
        "A(z) „%@” hozzá szeretne férni az Ön naptárjához.",
        "“%@” Takviminize Erişmek İstiyor",
        "Αίτημα από «%@» για πρόσβαση στο Ημερολόγιό σας",
        "Программа «%@» запрашивает доступ к «Календарю».",
        "“%@” ต้องการที่จะเข้าถึงปฏิทินของคุณ",
        "يرغب \"%@\" بالوصول إلى التقويم الخاص بك",
        "“%@” Deseja Ter Acesso ao Seu Calendário",
        "“%@” Would Like to Access Your Calendar",
        "“%@” quiere acceder a tu calendario",
        "“%@” ar dori să vă acceseze calendarul",
        "“%@” आपके कैलेंडर तक पहुँचना चाहता है",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MotionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "« %@ » souhaite accéder à vos mouvements et à votre activité physique.",
        "%@ haluaa käyttää liikunta- ja kuntoilutietojasi",
        "“%@” Would Like to Access Your Motion & Fitness Activity",
        "“%@” desea acceder a tu actividad física y deportiva",
        "“%@” आपकी चाल और तंदुरुस्ती गतिविधि तक पहुँचना चाहता है",
        "“%@” Mahu Mengakses Aktiviti Pergerakan & Kecergasan Anda",
        "„%@“ möchte auf deine Bewegungs- und Fitnessdaten zugreifen",
        "״%@״ מעוניין לגשת אל פעילות התנועה והכושר שלך",
        "”%@” begär åtkomst till din rörelse- och träningsaktivitet",
        "“%@” Hareket ve Fitness Etkinliğinize Erişmek İstiyor",
        "Программа «%@» запрашивает доступ к Вашим данным движения и фитнеса",
        "يرغب \"%@\" في الوصول إلى نشاط الحركة واللياقة الخاصة بك",
        "「%@」想要取用您的運動與健身記錄",
        "“%@” Muốn Truy cập Hoạt động Di chuyển & Thể chất của bạn",
        "“%@”想访问您的活动与体能训练记录",
        "“%@” vil bruge din fysiske aktivitet og din træningsaktivitet",
        "«%@» хоче отримати доступ до вашої активності Руху і фітнесу",
        "« %@ » souhaite accéder à vos mouvements et vos activités physiques.",
        "„%@” chce uzyskać dostęp do danych o Twoim ruchu i ćwiczeniach",
        "“%@” želi pristupiti vašim aktivnostima kretanja i kondicije",
        "“%@” ต้องการที่จะเข้าถึงกิจกรรมการเคลื่อนไหวและฟิตเนสของคุณ",
        "“%@” vol accedir a la teva activitat física",
        "「%@」要取用你的「運動與健身」的「健身記錄」",
        "“%@” Deseja Ter Acesso às Suas Atividades de Movimento e Preparo Físico",
        "%@ wil toegang tot je bewegings- en fitnessactiviteit",
        "“%@” Ingin Mengakses Aktivitas Gerakan & Kebugaran Anda",
        "“%@”がモーションとフィットネスのアクティビティへのアクセスを求めています",
        "Aplikace „%@“ žádá o přístup k vaší pohybové a kondiční aktivitě",
        "“%@” desidera accedere ai dati di “Movimento e fitness”",
        "«%@» vil ha tilgang til bevegelses- og treningsaktiviteten din",
        "Αίτημα από «%@» για πρόσβαση στη Δραστηριότητα κίνησης και άσκησής σας",
        "‘%@’이(가) 사용자의 동작 및 피트니스 활동에 접근하려고 합니다",
        "“%@” ar dori să vă acceseze activitatea de mișcare și fitness",
        "Aplikácia „%@“ žiada o prístup k pohybovej a fitnes aktivite",
        "“%@” gostaria de aceder à sua atividade física e de fitness.",
        "A(z) „%@” hozzá szeretne férni az Ön mozgási és fitnesztevékenységéhez",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct WillowAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“%@” Deseja Ter Acesso aos Seus Dados",
        "“%@” vil bruge dine hjemmedata",
        "“%@” gostaria de aceder aos dados da sua casa",
        "”%@” begär åtkomst till dina hemdata",
        "“%@” vol accedir a les teves dades domèstiques ",
        "'%@' wil toegang tot je woninggegevens",
        "“%@”想访问您的住宅数据",
        "“%@” Muốn Truy cập Dữ liệu Nhà của bạn",
        "״%@״ מבקש/ת לגשת לנתוני הבית שלך",
        "Программа «%@» запрашивает доступ к Вашим данным о доме",
        "Aplikácia „%@“ žiada o prístup k dátam domácnosti",
        "« %@ » souhaite accéder aux données locales",
        "Αίτημα από «%@» για πρόσβαση στα Οικιακά δεδομένα σας",
        "“%@” želi pristupiti vašim podacima o domu",
        "“%@” vorrebbe accedere ai dati della tua abitazione",
        "「%@」要取用你的住家數據",
        "“%@” ar dori să vă acceseze datele privind locuința",
        "Aplikace „%@“ žádá o přístup k datům vaší domácnosti",
        "„%@“ möchte auf deine Hausdaten zugreifen",
        "A(z) „%@” hozzá szeretne férni az Ön Otthon-adataihoz",
        "“%@” Ev Verilerinize Erişmek İstiyor",
        "„%@” chce uzyskać dostęp do danych domu",
        "“%@” quiere acceder a tus datos de casa",
        "‘%@’이(가) 사용자의 홈 데이터에 접근하려고 합니다",
        "«%@» vil ha tilgang til hjemmedataene dine",
        "« %@ » souhaite accéder à vos données locales",
        "“%@”がホームデータへのアクセスを求めています",
        "“%@” ต้องการที่จะเข้าถึงข้อมูลที่บ้านของคุณ",
        "«%@» хоче отримати доступ до даних про ваш дім",
        "“%@” Mahu Mengakses Data Rumah Anda",
        "「%@」想要取用您的家庭資料",
        "يرغب \"%@\" في الوصول إلى بيانات المنزل الخاصة بك",
        "%@ haluaa käyttää kotitietojasi",
        "“%@” Ingin Mengakses Data Rumah Anda",
        "“%@” Would Like to Access Your Home Data",
        "“%@” आपके होम डेटा तक पहुँचना चाहता है",
        ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

// =============================================================================
// == Not generated by ModelGenarator, but added manually to fullfill the test purposes.
// == We are albe to catch system alert from Location services.
// == Contacts alert cannot be handled by addUIInterruptionMonitor.
// == Possibility to catch other generated system service request models needs to be investigated further.
// ==
// TODO: This should be removed when:
// - Unit tests are provided to all system services
// - LocationAlert is being handled by ModelGenerator
// - HomeKitAlert is being handled by ModelGenerator
// - SystemAlertAllow and SystemAlertDeny is being extended by allow and 
//   deny messages associated with LocationAlert and HomeKitAlert configuration.
public struct LocationAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        //        "Allow „%@” to access your location while you use the app?"
        "to access your location while you use the app?"
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(containingLabels: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
