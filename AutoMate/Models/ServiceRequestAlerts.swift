// swiftlint:disable variable_name trailing_comma
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
        "Data pertuturan daripada aplikasi ini akan dihantar kepada Apple untuk memproses permintaan anda. Ini turut akan membantu Apple meningkatkan teknologi pengecaman pertuturannya.",
        "“.*” gostaria de aceder ao reconhecimento da fala",
        "Les données vocales de cette app seront envoyées à Apple pour traiter vos demandes. Cela permettra aussi à Apple d’améliorer sa technologie de reconnaissance vocale.",
        "Data ucapan dari app ini akan dikirimkan ke Apple untuk memproses permintaan Anda. Ini juga akan membantu Apple meningkatkan teknologi pengenalan ucapannya.",
        "“.*” desidera accedere all'opzione di riconoscimento vocale",
        "«.*» хоче отримати доступ до розпізнавання команд",
        "״.*״ מעוניין לגשת אל זיהוי הדיבור שלך",
        "Программа «.*» запрашивает доступ к «Распознаванию речи».",
        "يرغب \".*\" في الوصول إلى \"التعرف على الكلام\"",
        "Röstdata från den här appen skickas till Apple så att dina instruktioner kan behandlas. Detta hjälper även Apple att förbättra tekniken för röstigenkänning.",
        "“.*” Would Like to Access Speech Recognition",
        "此 App 的語音資料會傳送給 Apple 來處理您的要求。這也可協助 Apple 改進其語音辨識技術。",
        "„.*“ žádá o přístup k rozpoznávání řeči",
        "Αίτημα από «.*» για πρόσβαση στην Αναγνώριση ομιλίας",
        "“.*” बोली पहचान तक पहुँचना चाहता है",
        "Podaci govora iz ove aplikacije poslat će se Appleu radi obrade vaših zahtjeva. Time će se također pomoći Appleu u poboljšanju tehnologije prepoznavanja govora.",
        "נתוני דיבור מיישום זה יישלחו אל Apple לצורך עיבוד בקשותיך. הנתונים גם יעזרו ל-Apple לשפר את טכנולוגיית זיהוי הדיבור שלה.",
        "आपके अनुरोधों को पूरा करने के लिए इस ऐप से बोली डेटा Apple को भेजा जाएगा। इससे Apple को अपनी बोली पहचान तकनीक को बेहतर बनाने में भी मदद मिलेगी।",
        "“.*” vol accedir al reconeixement de veu",
        "“.*” Muốn Truy cập Nhận dạng Lời nói",
        "Sprachdaten von dieser App werden an Apple gesendet, um deine Anfragen zu verarbeiten. Außerdem werden sie verwendet, um Apple beim Verbessern der Spracherkennungstechnologie zu unterstützen.",
        "„.*” chce uzyskać dostęp do rozpoznawania mowy",
        "사용자의 요청을 처리하기 위해 이 앱의 음성 데이터가 Apple에 전송됩니다. 이는 Apple의 음성 인식 기술 향상에도 도움이 됩니다.",
        "”.*” begär åtkomst till röstigenkänning",
        "“.*” Deseja Ter Acesso ao Reconhecimento de Voz",
        "« .* » souhaite accéder à la reconnaissance vocale.",
        "„.*“ möchte auf die Spracherkennung zugreifen",
        "Os dados de fala desta aplicação serão enviados à Apple para processar os seus pedidos. Estará igualmente a ajudar a Apple a melhorar a respetiva tecnologia de reconhecimento da fala.",
        "ข้อมูลเสียงพูดจากแอพนี้จะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ การทำงานนี้จะช่วย Apple ปรับปรุงเทคโนโลยีการจดจำเสียงพูดของบริษัทด้วย",
        "“.*” želi pristupiti prepoznavanju govora",
        "Aplikácia „.*“ žiada o prístup k rozpoznávaniu reči",
        "Dane mowy zostaną wysłane do Apple w celu przetworzenia żądań. Pomoże to Apple w udoskonalaniu technologii rozpoznawania mowy.",
        "「.*」想要取用語音辨識",
        "A beszédadatok el lesznek küldve az alkalmazásból az Apple-nek a kérelme feldolgozásához. Ez segít az Apple-nek a beszédfelismerési technológiájának fejlesztésében is.",
        "“.*” vil bruge talegenkendelse",
        "Dados de fala deste aplicativo serão enviados à Apple para processar as solicitações. Isso também ajudará a Apple a melhorar sua tecnologia de reconhecimento de fala.",
        "Tämän apin puhetiedot lähetetään Applelle pyyntöjesi käsittelyä varten. Tämä auttaa myös Applea parantamaan puheentunnistusteknologiaansa.",
        "Spraakgegevens uit deze app worden naar Apple verstuurd om je verzoeken te verwerken. Deze gegevens worden ook gebruikt om de spraakherkenningstechnologie van Apple te verbeteren.",
        "Голосові дані з цієї програми будуть надсилатися до Apple для опрацювання ваших запитів. Це також допоможе Apple вдосконалювати технологію розпізнавання мовлення.",
        "“.*”が音声認識へのアクセスを求めています",
        "Речевые данные из этой программы будут отправлены в Apple на обработку Ваших запросов. Это также поможет Apple в улучшении технологии речевого распознавания.",
        "“.*”想访问语音识别",
        "部分来自此应用的语音数据将发送给 Apple 以处理您的请求。这还将帮助 Apple 改进语音识别技术。",
        "Τα φωνητικά δεδομένα από αυτήν την εφαρμογή θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας. Αυτό θα βοηθήσει επίσης την Apple να βελτιώσει την τεχνολογία της ως προς την αναγνώριση ομιλίας.",
        "このAppからの音声データはリクエストを処理するためにAppleに送信されます。また、音声認識技術の向上にも役立てられます。",
        "“.*” quiere acceder al reconocimiento de voz",
        "سيتم إرسال بيانات الكلام من هذا التطبيق إلى Apple بهدف معالجة طلباتك. كما أن هذا سيساعد Apple على تحسين تقنية التعرف على الكلام.",
        "Los datos de voz de esta aplicación se enviarán a Apple para procesar tus solicitudes. Estos datos también ayudan a Apple a mejorar su tecnología de reconocimiento de voz.",
        ".* haluaa käyttää puheentunnistusta",
        "Talegenkendelsesdata fra denne app, sendes til Apple til behandling af dine anmodinger. Det hjælper desuden Apple med at forbedre sin talegenkendelsesteknologi.",
        "‘.*’이(가) 음성 인식에 접근하려고 합니다",
        "“.*” Konuşma Tanımaya Erişmek İstiyor",
        "“.*” Ingin Mengakses Pengenalan Ucapan",
        "İsteklerinizi işlemek için bu uygulamadaki konuşma verileri Apple’a gönderilir. Bu aynı zamanda Apple’ın konuşma tanıma teknolojisini geliştirmesine de yardımcı olur.",
        "Speech data from this app will be sent to Apple to process your requests. This will also help Apple improve its speech recognition technology.",
        "Taledata fra denne appen vil bli sendt til Apple for å behandle forespørslene dine. Dette vil også hjelpe Apple med å forbedre talegjenkjenningsteknologien.",
        "Les dades de veu d’aquesta aplicació s’enviaran a Apple per processar les teves peticions i perquè Apple pugui millorar la tecnologia de reconeixement de veu.",
        "A(z) „.*” hozzá szeretne férni a beszédfelismeréshez",
        "Datele vocale din această aplicație vor fi trimise la Apple pentru a vă procesa solicitările. Aceasta va ajuta și la îmbunătățirea tehnologiei de recunoaștere vocală Apple.",
        "Les données vocales recueillies par cette app seront envoyées à Apple pour traiter vos demandes. Cela aidera également Apple à améliorer sa technologie en matière de reconnaissance vocale.",
        "「.*」要取用語音辨識",
        "“.*” ar dori să acceseze recunoașterea vocală",
        ".* wil toegang tot spraakherkenning",
        "Řečová data z této aplikace budou odeslána do Apple na pomoc se zpracováním vašich požadavků a vylepšováním technologie rozpoznávání řeči.",
        "«.*» vil ha tilgang til talegjenkjenning",
        "Dữ liệu lời nói từ ứng dụng này sẽ được gửi đến Apple để xử lý yêu cầu của bạn. Việc nãy cũng sẽ giúp Apple cải thiện công nghệ nhận dạng lời nói của mình.",
        "“.*” ต้องการที่จะเข้าถึงการจดจำเสียงพูด",
        "此 App 的語音識別數據將傳送給 Apple 以處理你的請求。這亦會有助 Apple 改善語音識別技術。",
        "“.*” Mahu Mengakses Pengecaman Pertuturan",
        "I dati vocali di quest'app verranno inviati ad Apple per l'elaborazione delle tue richieste. L'invio dei dati consentirà ad Apple di migliorare la propria tecnologia di riconoscimento vocale.",
        "Rečové dáta z tejto aplikácie budú kvôli spracovaniu vašich žiadostí odoslané do Apple a použité aj na vylepšovanie technológie rozpoznávania reči spoločnosti Apple.",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct SiriAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "Algunes dades de .* s’enviaran a Apple per processar les teves peticions.",
        "Хотите использовать «.*» с Siri?",
        "חלק מהנתונים של .* יישלחו אל Apple לצורך עיבוד בקשותיך.",
        "您的部分「.*」資料會傳送給 Apple 來處理您的要求。",
        "Želite li koristiti “.*” sa Siri?",
        "사용자의 요청을 처리하기 위해 사용자의 .* 데이터 일부가 Apple에 전송됩니다.",
        "Alguns dados da aplicação .* serão enviados à Apple para processar os seus pedidos.",
        "Viss information från .* skickas till Apple så att dina instruktioner kan behandlas.",
        ".*: θέλετε να χρησιμοποιείται με το Siri;",
        "Chcete „.*“ používat se Siri?",
        "你要透過 Siri 使用「.*」嗎？",
        "Κάποια από τα δεδομένα σας στην εφαρμογή «.*» θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας.",
        "Vuoi utilizzare “.*” con Siri?",
        "Některá data aplikace .* budou odeslána do Apple na pomoc se zpracováním vašich požadavků.",
        "क्या आप “.*” को Siri के साथ उपयोग करना चाहेंगे?",
        "Sesetengah data .* anda akan dihantar kepada Apple untuk memproses permintaan anda.",
        "Adakah Anda Mahu Menggunakan “.*” dengan Siri?",
        "سيتم إرسال بعض بيانات .* إلى Apple بهدف معالجة طلباتك.",
        "Alcuni dati di .* verranno inviati ad Apple per elaborare le tue richieste.",
        "Деякі ваші дані .* будуть надсилатися до Apple для опрацювання ваших запитів.",
        "Noen av dataene fra .* blir sendt til Apple for å behandle forespørslene dine.",
        "Neki vaši .* podaci poslat će se Appleu radi obrade vaših zahtjeva.",
        "Một số dữ liệu .* của bạn sẽ được gửi đến Apple để xử lý yêu cầu của bạn.",
        "Souhaitez-vous utiliser « .* » avec Siri?",
        "האם ברצונך להשתמש ב-״.*״ עם Siri?",
        "Apakah Anda Ingin Menggunakan “.*” dengan Siri?",
        "Vols utilitzar “.*” amb Siri?",
        "Enkele gegevens van .* worden naar Apple verstuurd om je verzoeken te verwerken.",
        "Deseja Usar “.*” com a Siri?",
        "Wil je .* gebruiken met Siri?",
        "คุณต้องการที่จะใช้ “.*” กับ Siri หรือไม่",
        "Alguns dos seus dados de .* serão enviados à Apple para processar as solicitações.",
        "您要在「.*」上使用 Siri 嗎？",
        "Czy chcesz używać „.*” z Siri?",
        "您的部分“.*”数据将发送给 Apple 以处理您的请求。",
        "ข้อมูลของ .* บางอย่างจะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ",
        "هل ترغب في استخدام \".*\" مع Siri؟",
        "İsteklerinizi işlemek için .* verilerinizden bazıları Apple’a gönderilir.",
        "A(z) .* adatai közül néhány el lesz küldve az Apple-nek az Ön kérelme feldolgozásához.",
        ".*データの一部は、リクエストを処理するためにAppleに送信されます。",
        "Nogle af dine .*-data sendes til Apple for at behandle dine anmodninger.",
        "Möchtest du „.*“ mit Siri benutzen?",
        "Osa apin .* tiedoista lähetetään Applelle pyyntöjesi käsittelyä varten.",
        "Gostaria de usar “.*” com Siri?",
        "Algunos de tus datos en .* se enviarán a Apple para procesar tus solicitudes.",
        "Unele dintre datele .* vor fi trimise la Apple pentru a vă procesa solicitările.",
        "Einige deiner Daten von .* werden an Apple gesendet, um deine Anfragen zu verarbeiten.",
        "Chcete používať aplikáciu „.*“ so Siri?",
        "“.*” uygulamasını Siri ile kullanmak ister misiniz?",
        "Ви хочете вживати «.*» разом із Siri?",
        "¿Quieres usar “.*” con Siri?",
        "您要通过 Siri 来使用“.*”吗？",
        "Vil du bruge “.*” med Siri?",
        "आपके अनुरोधों को पूरा करने के लिए आपके .* का कुछ डेटा Apple को भेजा जाएगा।",
        ".* 的部分資料將傳送給 Apple 以處理你的請求。",
        "Niektoré dáta aplikácie .* budú kvôli spracovaniu vašich žiadostí odoslané do Apple.",
        "“.*”をSiriで使用しますか?",
        "Some of your .* data will be sent to Apple to process your requests.",
        "Vil du bruke .* med Siri?",
        "Szeretné a következőt a Sirivel használni: „.*”?",
        "Некоторые из Ваших данных .* будут отправлены в Apple на обработку запросов.",
        "Sebagian data .* Anda akan dikirimkan ke Apple untuk memproses permintaan Anda.",
        "Doriți să utilizați “.* cu Siri?",
        "Vill du använda .* med Siri?",
        "Bạn có muốn sử dụng “.*” với Siri không?",
        "Część danych programu .* zostanie wysłana do Apple w celu przetworzenia żądań.",
        "Would You Like to Use “.*” with Siri?",
        "Haluatko, että .* on Sirin käytössä?",
        "Certaines de vos données .* seront envoyées à Apple pour traiter vos demandes.",
        "Siri를 ‘.*’에 사용하겠습니까?",
        "Souhaitez-vous utiliser « .* » avec Siri ?",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct RemindersAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” ต้องการที่จะเข้าถึงเตือนความจำของคุณ",
        "‘.*’이(가) 사용자의 미리 알림에 접근하려고 합니다",
        "“.*” vil bruge dine påmindelser",
        "“.*” quiere acceder a tus recordatorios",
        "「.*」要取用你的提醒事項",
        "“.*” Ingin Mengakses Pengingat Anda",
        "Программа «.*» запрашивает доступ к «Напоминаниям».",
        "“.*” gostaria de aceder aos seus lembretes",
        "“.*” आपके रिमाइंडरों तक पहुँचना चाहता है",
        "“.*” ar dori să vă acceseze mementourile",
        "“.*” Would Like to Access Your Reminders",
        "„.*“ möchte auf deine Erinnerungen zugreifen",
        "«.*» хоче отримати доступ до ваших нагадувань",
        "« .* » souhaite accéder à vos rappels.",
        "“.*” vorrebbe accedere ai tuoi Promemoria",
        "„.*” chce uzyskać dostęp do Przypomnień",
        "“.*”想访问您的提醒事项",
        "「.*」想要取用您的提醒事項",
        "“.*” Muốn Truy cập Lời nhắc của bạn",
        "يرغب \".*\" بالوصول إلى التذكيرات الخاصة بك",
        "“.*” vol accedir als teus recordatoris",
        "“.*” Mahu Mengakses Peringatan Anda",
        "”.*” begär åtkomst till dina påminnelser",
        "“.*” želi pristupiti vašim podsjetnicima",
        "“.*” Deseja Ter Acesso aos Seus Lembretes",
        "Aplikace „.*“ žádá o přístup k vašim připomínkám",
        "״.*״ מעוניין לגשת למשימות שלך",
        "Αίτημα από «.*» για πρόσβαση στις Υπομνήσεις σας",
        "“.*” Anımsatıcılarınıza Erişmek İstiyor",
        "Aplikácia „.*“ žiada o prístup k pripomienkam",
        "A(z) „.*” hozzá szeretne férni az Ön emlékeztetőihez.",
        "«.*» vil ha tilgang til påminnelsene dine",
        ".* haluaa käyttää muistutuksiasi",
        "“.*”がリマインダーへのアクセスを求めています",
        ".* wil toegang tot je herinneringen",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct PhotosAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*”想访问您的照片",
        "«.*» хоче отримати доступ до ваших фото",
        "“.*” vil bruge dine fotos",
        "Aplikace „.*“ žádá o přístup k vašim fotografiím",
        "“.*” Would Like to Access Your Photos",
        "« .* » souhaite accéder à vos photos.",
        "“.*” आपकी तस्वीरों तक पहुँचना चाहता है",
        "«.*» vil ha tilgang til bildene dine",
        "“.*” quiere acceder a tus fotos",
        "A(z) „.*” hozzá szeretne férni az Ön fotóihoz.",
        "‘.*’이(가) 사용자의 사진에 접근하려고 합니다",
        "“.*” ar dori să vă acceseze pozele",
        ".* haluaa käyttää kuviasi",
        "״.*״ מעוניין לגשת לתמונות שלך",
        "“.*” Deseja Ter Acesso às Suas Fotos",
        ".* wil toegang tot je foto's",
        "Программа «.*» запрашивает доступ к «Фото».",
        "“.*” gostaria de aceder às suas fotografias",
        "”.*” begär åtkomst till dina bilder",
        "“.*” vol accedir a les teves fotos",
        "「.*」要取用你的相片",
        "「.*」想要取用您的照片",
        "“.*” Ingin Mengakses Foto Anda",
        "„.*” chce uzyskać dostęp do Zdjęć",
        "“.*” ต้องการที่จะเข้าถึงรูปภาพของคุณ",
        "“.*” želi pristupiti vašim fotografijama",
        "يرغب \".*\" بالوصول إلى الصور الخاصة بك",
        "Αίτημα από «.*» για πρόσβαση στις Φωτογραφίες σας",
        "“.*” Mahu Mengakses Foto Anda",
        "„.*“ möchte auf deine Fotos zugreifen",
        "“.*” Fotoğraflarınıza Erişmek İstiyor",
        "“.*” vorrebbe accedere alle tue Foto",
        "“.*” Muốn Truy cập Ảnh của bạn",
        "Aplikácia „.*“ žiada o prístup k fotkám",
        "“.*”が写真へのアクセスを求めています",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CameraAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "„.*” chce uzyskać dostęp do Aparatu",
        "«.*» хоче отримати доступ до Камери",
        "‘.*’이(가) 카메라에 접근하려고 합니다",
        "يرغب \".*\" بالوصول إلى الكاميرا الخاصة بك",
        "״.*״ מבקש להשתמש במצלמה",
        "«.*» vil ha tilgang til kameraet",
        "“.*” vorrebbe accedere alla fotocamera",
        "Программа «.*» запрашивает доступ к «Камере».",
        "Aplikácia „.*“ žiada o prístup ku kamere",
        "“.*” želi pristupiti kameri",
        "“.*” gostaria de aceder à Câmara",
        "”.*” begär åtkomst till kameran",
        "“.*” Ingin Mengakses Kamera",
        "„.*“ möchte auf deine Kamera zugreifen",
        "“.*” कैमरा तक पहुँचना चाहता है",
        ".* wil toegang tot de camera",
        ".* haluaa käyttää kameraa",
        "“.*”がカメラへのアクセスを求めています",
        "“.*” Kameraya Erişmek İstiyor",
        "“.*”想访问您的相机",
        "Αίτημα από «.*» για πρόσβαση στην Κάμερα",
        "“.*” Mahu Mengakses Kamera",
        "“.*” ต้องการที่จะเข้าถึงกล้อง",
        "“.*” Deseja Ter Acesso à Câmera",
        "“.*” Would Like to Access the Camera",
        "“.*” vol accedir a la càmera",
        "“.*” ar dori să acceseze camera",
        "“.*” quiere acceder a la cámara",
        "“.*” Muốn Truy cập Camera",
        "Aplikace „.*“ žádá o přístup k fotoaparátu",
        "« .* » souhaite accéder à l’appareil photo.",
        "A(z) „.*” hozzá szeretne férni az Ön kamerájához.",
        "「.*」想要取用您的相機",
        "“.*” vil bruge kameraet",
        "「.*」要取用相機",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct AddressBookAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” Ingin Mengakses Kontak Anda",
        "«.*» хоче отримати доступ до ваших контактів",
        "“.*” vil bruge dine kontakter",
        "“.*” vol accedir als teus contactes",
        "يرغب \".*\" بالوصول إلى جهات الاتصال الخاصة بك",
        "「.*」要取用通訊錄",
        "Αίτημα από «.*» για πρόσβαση στις Επαφές σας",
        "„.*“ möchte auf deine Kontakte zugreifen",
        "“.*” आपके संपर्कों तक पहुँचना चाहता है",
        "“.*” ar dori să vă acceseze contactele",
        "”.*” begär åtkomst till dina kontakter",
        "Aplikácia „.*“ žiada o prístup ku kontaktom",
        ".* wil toegang tot je contacten",
        "“.*”が連絡先へのアクセスを求めています",
        "« .* » souhaite accéder à vos contacts.",
        "“.*” quiere acceder a tus contactos",
        "「.*」想要取用聯絡資訊",
        "״.*״ מבקש לגשת לאנשי הקשר שלך",
        "„.*” chce uzyskać dostęp do Kontaktów",
        "“.*” Would Like to Access Your Contacts",
        "Aplikace „.*“ žádá o přístup k vašim kontaktům",
        "“.*” želi pristupiti vašim kontaktima",
        "‘.*’이(가) 사용자의 연락처에 접근하려고 합니다",
        "“.*” Deseja Ter Acesso aos Seus Contatos",
        "“.*”想访问您的通讯录",
        "“.*” Mahu Mengakses Kenalan Anda",
        "A(z) „.*” hozzá szeretne férni az Ön kontaktjaihoz.",
        "Программа «.*» запрашивает доступ к «Контактам».",
        "“.*” Muốn Truy cập Danh bạ của bạn",
        ".* haluaa käyttää yhteystietojasi",
        "“.*” gostaria de aceder aos seus contactos",
        "“.*” ต้องการที่จะเข้าถึงรายชื่อของคุณ",
        "“.*” vorrebbe accedere ai tuoi Contatti",
        "«.*» vil ha tilgang til kontaktene dine",
        "“.*” Kişilerinize Erişmek İstiyor",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MediaLibraryAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "‏“.*” מעוניין לגשת ל-Apple Music ולספריית המדיה שלך.",
        "'.*' wil toegang tot Apple Music en je mediabibliotheek",
        "“.*” Would Like to Access Apple Music And Your Media Library",
        "“.*” ต้องการที่จะเข้าถึง Apple Music และคลังสื่อของคุณ",
        "“.*”, Apple Music'e ve Ortam Arşivinize Erişmek İstiyor",
        "“.*”想要访问 Apple Music 和您的媒体资料库",
        "„.*“ möchte auf Apple Music und deine Mediathek zugreifen",
        "“.*” gostaria de aceder a Apple Music e à sua biblioteca de multimédia",
        "「.*」想要取用 Apple Music 和您的媒體資料庫",
        "“.*” Apple Music और आपकी मीडिया लाइब्रेरी तक पहुँचना चाहता है",
        "”.*” vill få tillgång till Apple Music och ditt mediebibliotek",
        "«.*» vil ha tilgang til Apple Music og mediebiblioteket ditt",
        "“.*” ar dori să acceseze Apple Music și biblioteca dvs. multimedia",
        ".* quiere acceder a Apple Music y a tu biblioteca multimedia",
        "Aplikace „.*“ žádá o povolení k přístupu k Apple Music a vaší knihovně médií",
        "A(z) „.*” hozzá szeretne férni az Apple Musichoz és az Ön médiakönyvtárához",
        "“.*” vol accedir a l’Apple Music i a la biblioteca multimèdia",
        "“.*” Deseja Acessar o Apple Music e a sua Biblioteca de Mídia",
        "„.*” chce uzyskać dostęp do Apple Music i Twojej biblioteki multimediów",
        "«.*» хоче мати доступ до Apple Music і вашої медіатеки",
        "“.*” muốn truy cập Apple Music và thư viện phương tiện của bạn",
        "“.*” želi pristupiti Apple Musicu i vašoj glazbenoj medijateci",
        "“.*” Ingin Mengakses Apple Music Dan Perpustakaan Media Anda",
        "«.*» запрашивает доступ к Apple Music и Вашей Медиатеке",
        "“.*” Would Like to Access Apple Music and Your Media Library",
        "‘.*’이(가) Apple Music 및 사용자의 미디어 보관함에 접근하려고 합니다.",
        "“.*” Mahu Mengakses Apple Music Dan Pustaka Media Anda",
        "« .* » souhaite accéder à Apple Music et à votre bibliothèque multimédia.",
        "“.*” vil bruge Apple Music og dit mediebibliotek",
        "Aplikácia „.*“ žiada o prístup k Apple Music a vašej knižnici médií",
        "« .* » aimerait accéder à Apple Music et à votre bibliothèque multimédia.",
        "“.*”がApple Musicとメディアライブラリへのアクセスを求めています",
        "Αίτημα από «.*» για πρόσβαση στο Apple Music και στη Βιβλιοθήκη πολυμέσων σας",
        ".* haluaa käyttää Apple Musicia ja mediakirjastoasi",
        "“.*” desidera accedere ad Apple Music e alla tua libreria di contenuti",
        "「.*」想取用 Apple Music 及你的媒體資料庫",
        "يرغب \".*\" في الوصول إلى Apple Music ومكتبة الوسائط",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct BluetoothPeripheralAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*”想在您未使用该应用时仍与周围的蓝牙设备交换数据。",
        "“.*” vorrebbe rendere disponibili i dati ai dispositivi Bluetooth nelle vicinanze anche quando non è in uso.",
        "Aplikace .* žádá o povolení ke zpřístupnění dat blízkým Bluetooth zařízením i v čase, kdy ji právě nepoužíváte.",
        ".* wil gegevens beschikbaar stellen voor Bluetooth-apparaten in de buurt, ook als je de app niet gebruikt.",
        "“.*” želi učiniti podatke dostupnima obližnjim Bluetooth uređajima, čak i kad ne koristite aplikaciju.",
        "“.*” deseja disponibilizar dados para os dispositivos Bluetooth por perto até mesmo quando você não estiver usando o aplicativo.",
        "“.*” vol posar les dades a disposició dels dispositius Bluetooth propers fins i tot quan no utilitzis l’aplicació.",
        "사용자가 해당 앱을 사용하고 있지 않을 때에도 ‘.*’이(가) Bluetooth 기기 근처에서 데이터를 사용하려고 합니다.",
        "يرغب \".*\" في إتاحة البيانات إلى أجهزة Bluetooth القريبة حتى عند عدم استخدامك للتطبيق.",
        "« .* » voudrait rendre des données disponibles aux appareils Bluetooth proches lorsque vous n’utilisez pas cette app.",
        "« .* » voudrait rendre les données disponibles auprès des appareils Bluetooth à proximité lorsque vous n’utilisez pas cette app.",
        "Программа «.*» запрашивает разрешение на предоставление данных ближайшим устройствам с Bluetooth, даже когда Вы не работаете с программой.",
        "「.*」要在你並非正在使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "“.*” would like to make data available to nearby Bluetooth devices even when you’re not using the app.",
        "“.*” आस-पास के ब्लूटूथ उपकरणों पर डेटा उपलब्ध कराना चाहता है, भले ही आप ऐप का उपयोग न कर रहे हों।",
        ".* quiere que los datos estén disponibles para los dispositivos Bluetooth cercanos aunque no estés utilizando la aplicación.",
        "”.*” vill göra dina data tillgängliga för andra Bluetooth-enheter i närheten, även när du inte använder appen.",
        "«.*» хоче надавати пристроям Bluetooth поблизу доступ до дних, навіть коли ви не вживаєте цю програму.",
        "„.*“ möchte Daten mit Bluetooth-Geräten in der Nähe teilen, auch wenn die App nicht benutzt wird.",
        ".* haluaa antaa dataa lähellä oleville Bluetooth-laitteille, vaikka et käyttäisikään appia.",
        "“.*” vil gerne gøre data tilgængelige for Bluetooth-enheder i nærheden, også når du ikke bruger appen.",
        "A(z) „.*” adatokat akar elérhetővé tenni közeli Bluetooth-eszközök számára akkor is, amikor Ön nem használja az alkalmazást.",
        "“.*”が近隣のBluetoothデバイスに、Appを使用していないときでもデータ通信することを求めています。",
        "Program „.*” chce udostępniać dane pobliskim urządzeniom Bluetooth, także gdy go nie używasz.",
        "“.*” ต้องการที่จะให้ข้อมูลที่มีกับอุปกรณ์บลูทูธใกล้เคียงแม้ว่าคุณจะไม่ได้ใช้แอพอยู่",
        "Mesmo quando não está a ser usado, “.*” gostaria de disponibilizar dados a dispositivos Bluetooth que se encontrem por perto.",
        "「.*」想要在未使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "“.*” muốn làm cho dữ liệu khả dụng đối với thiết bị Bluetooth ở gần ngay cả khi bạn không sử dụng ứng dụng.",
        "“.*” ingin membuat data tersedia untuk perangkat Bluetooth di sekitar saat Anda sedang tidak menggunakan app.",
        "«.*» ønsker å gjøre data tilgjengelig for Bluetooth-enheter i nærheten selv om appen ikke er i bruk.",
        "״.*״ מעוניין לאפשר להתקני Bluetooth קרובים לקבל גישה לנתונים אפילו כשאינך משתמש/ת ביישום.",
        "“.*” mahu menyediakan data kepada peranti Bluetooth berdekatan walaupun anda tidak menggunakan aplikasi.",
        "“.*” ar dori să pună la dispoziție date dispozitivelor Bluetooth din apropiere chiar și atunci când nu utilizați aplicația.",
        "Aplikácia „.*“ chce sprístupňovať dáta pre okolité Bluetooth zariadenia, aj keď ju práve nepoužívate.",
        "Αίτημα από «.*» για να καθιστά δεδομένα διαθέσιμα σε κοντινές συσκευές Bluetooth ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή.",
        "“.*”, siz uygulamayı kullanmıyorken bile yakındaki Bluetooth aygıtları için verileri kullanılabilir yapmak istiyor.",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MicrophoneAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” quiere acceder al micrófono",
        "«.*» vil ha tilgang til mikrofonen",
        "״.*״ מעוניין להשתמש במיקרופון",
        "“.*” Mahu Mengakses Mikrofon",
        "“.*” Mikrofona Erişmek İstiyor",
        ".* wil toegang tot de microfoon",
        "”.*” begär åtkomst till mikrofonen",
        "يرغب \".*\" بالوصول إلى الميكروفون",
        "“.*” माइक्रोफ़ोन तक पहुँचना चाहता है",
        "Aplikace „.*“ žádá o přístup k mikrofonu",
        "„.*“ möchte auf das Mikrofon zugreifen",
        "“.*” Ingin Mengakses Mikrofon",
        "“.*” želi pristupiti mikrofonu",
        "“.*”想访问您的麦克风",
        "A(z) „.*” hozzá szeretne férni az Ön mikrofonjához.",
        "“.*” gostaria de aceder ao microfone",
        "« .* » souhaite accéder au micro.",
        ".* haluaa käyttää mikrofonia",
        "“.*” Deseja Ter Acesso ao Microfone",
        "“.*” vil bruge mikrofonen",
        "“.*”がマイクへのアクセスを求めています",
        "«.*» хоче отримати доступ до мікрофона",
        "“.*” vol accedir al micròfon",
        "“.*” Would Like to Access the Microphone",
        "„.*” chce uzyskać dostęp do mikrofonu",
        "‘.*’이(가) 마이크에 접근하려고 합니다.",
        "「.*」想要取用您的麥克風",
        "Aplikácia „.*“ žiada o prístup k mikrofónu",
        "Программа «.*» запрашивает доступ к микрофону.",
        "“.*” ต้องการที่จะเข้าถึงไมโครโฟน",
        "「.*」要取用咪高風",
        "“.*” vorrebbe accedere al microfono",
        "“.*” ar dori să acceseze microfonul",
        "“.*” Muốn Truy cập Micrô",
        "Αίτημα από «.*» για πρόσβαση στο Μικρόφωνο",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CallsAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "Aplikácia „.*“ chce poskytovať natívne hovory",
        "“.*”, Özgün Çağrı İçi Deneyimi Sağlamak İstiyor",
        "«.*» хоче забезпечити власний функціонал під час виклику",
        "“.*”はネイティブな着信機能を提供しようとしています。",
        "يرغب \".*\" في تقديم تجربة مكالمات أصلية",
        "“.*” ar dori să furnizeze o experiență integrată în cadrul apelului",
        ".* vill använda den inbyggda uppringningsfunktionen",
        "„.*” chce oferować natywny interfejs połączenia",
        "״.*״ מעוניין לספק חוויית שימוש מקורית בזמן שיחה",
        "Αίτημα από «.*» για παροχή εγγενούς εμπειρίας κλήσης",
        "“.*” Mahu Menyediakan Pengalaman Dalam Panggilan Asli",
        "“.*” muốn Cung cấp Trải nghiệm Trong cuộc gọi Tự nhiên",
        "Программа «.*» запрашивает разрешение предоставить свою штатную телефонную функциональность.",
        "“.*” Deseja Oferecer uma Experiência Nativa na Ligação",
        "“.*”想提供原生通话体验",
        "A(z) „.*” híváson belüli funkciót szeretne nyújtani",
        "„.*“ möchte integrierte Im-Anruf-Funktionalität ermöglichen",
        "“.*” quiere proporcionar una experiencia nativa durante las llamadas",
        "「.*」想要提供原生通話體驗",
        "“.*” vil bruge den indbyggede opkaldsfunktion",
        "“.*” želi pružiti nativno iskustvo poziva.",
        "“.*” ต้องการที่จะให้การรับสายโทรศัพท์เข้าที่เหมือนจริง",
        "« .* » souhaite apporter une expérience d’appel native.",
        "“.*” स्थानीय इन-कॉल अनुभव प्रदान करना चाहेगा",
        "“.*” desidera fornire un'esperienza di chiamata integrata",
        "‘.*’이(가) 네이티브 통화를 제공하려고 합니다.",
        "«.*» vil bruke den innebygde samtalefunksjonen",
        "「.*」要提供整合式來電體驗",
        ".* wil de ingebouwde interface voor het gesprek gebruiken",
        "“.*” vol oferir‑te una experiència nativa de trucada",
        ".* haluaa tarjota perinteisen puhelutoiminnon",
        "“.*” Ingin Memberikan Pengalaman Dalam Panggilan Asli",
        "“.*” gostaria de proporcionar uma interface de chamada nativa",
        "„.*“ žádá o povolení k poskytování nativních hovorů",
        "“.*” Would Like to Provide a Native In-Call Experience",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CalendarAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” ต้องการที่จะเข้าถึงปฏิทินของคุณ",
        ".* haluaa käyttää kalenteriasi",
        "“.*” Mahu Mengakses Kalendar Anda",
        "يرغب \".*\" بالوصول إلى التقويم الخاص بك",
        "״.*״ מעוניין לגשת ללוח השנה שלך",
        "“.*” vorrebbe accedere al tuo Calendario",
        "“.*” Takviminize Erişmek İstiyor",
        "“.*” Deseja Ter Acesso ao Seu Calendário",
        "「.*」要取用你的日曆",
        "“.*” želi pristupiti vašem kalendaru",
        "“.*”想访问您的日历",
        "‘.*’이(가) 사용자의 캘린더에 접근하려고 합니다",
        "“.*”がカレンダーへのアクセスを求めています",
        "“.*” vil bruge din kalender",
        "”.*” begär åtkomst till din kalender",
        "„.*“ möchte auf deinen Kalender zugreifen",
        "“.*” Ingin Mengakses Kalender Anda",
        "“.*” Would Like to Access Your Calendar",
        "“.*” quiere acceder a tu calendario",
        "«.*» vil ha tilgang til kalenderen din",
        "Aplikácia „.*“ žiada o prístup ku kalendáru",
        "「.*」想要取用您的行事曆",
        "„.*” chce uzyskać dostęp do Kalendarza",
        "“.*” आपके कैलेंडर तक पहुँचना चाहता है",
        "«.*» хоче отримати доступ до вашого календаря",
        "« .* » souhaite accéder à votre calendrier.",
        "Aplikace „.*“ žádá o přístup k vašemu kalendáři",
        "Αίτημα από «.*» για πρόσβαση στο Ημερολόγιό σας",
        "Программа «.*» запрашивает доступ к «Календарю».",
        ".* wil toegang tot je agenda",
        "A(z) „.*” hozzá szeretne férni az Ön naptárjához.",
        "“.*” vol accedir al teu calendari",
        "“.*” ar dori să vă acceseze calendarul",
        "“.*” Muốn Truy cập Lịch của bạn",
        "“.*” gostaria de aceder ao seu calendário",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MotionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” Hareket ve Fitness Etkinliğinize Erişmek İstiyor",
        "Программа «.*» запрашивает доступ к Вашим данным движения и фитнеса",
        "A(z) „.*” hozzá szeretne férni az Ön mozgási és fitnesztevékenységéhez",
        ".* wil toegang tot je bewegings- en fitnessactiviteit",
        "“.*” ar dori să vă acceseze activitatea de mișcare și fitness",
        "”.*” begär åtkomst till din rörelse- och träningsaktivitet",
        "«.*» хоче отримати доступ до вашої активності Руху і фітнесу",
        "Aplikácia „.*“ žiada o prístup k pohybovej a fitnes aktivite",
        "Αίτημα από «.*» για πρόσβαση στη Δραστηριότητα κίνησης και άσκησής σας",
        "“.*”想访问您的活动与体能训练记录",
        "“.*” Deseja Ter Acesso às Suas Atividades de Movimento e Preparo Físico",
        "« .* » souhaite accéder à vos mouvements et à votre activité physique.",
        "“.*” Ingin Mengakses Aktivitas Gerakan & Kebugaran Anda",
        "Aplikace „.*“ žádá o přístup k vaší pohybové a kondiční aktivitě",
        "„.*” chce uzyskać dostęp do danych o Twoim ruchu i ćwiczeniach",
        "« .* » souhaite accéder à vos mouvements et vos activités physiques.",
        "“.*” vol accedir a la teva activitat física",
        "‘.*’이(가) 사용자의 동작 및 피트니스 활동에 접근하려고 합니다",
        "“.*” želi pristupiti vašim aktivnostima kretanja i kondicije",
        "“.*”がモーションとフィットネスのアクティビティへのアクセスを求めています",
        "“.*” ต้องการที่จะเข้าถึงกิจกรรมการเคลื่อนไหวและฟิตเนสของคุณ",
        "「.*」要取用你的「運動與健身」的「健身記錄」",
        "“.*” desea acceder a tu actividad física y deportiva",
        "“.*” Would Like to Access Your Motion & Fitness Activity",
        "“.*” Muốn Truy cập Hoạt động Di chuyển & Thể chất của bạn",
        "“.*” Mahu Mengakses Aktiviti Pergerakan & Kecergasan Anda",
        "„.*“ möchte auf deine Bewegungs- und Fitnessdaten zugreifen",
        "“.*” desidera accedere ai dati di “Movimento e fitness”",
        "「.*」想要取用您的運動與健身記錄",
        "״.*״ מעוניין לגשת אל פעילות התנועה והכושר שלך",
        "“.*” vil bruge din fysiske aktivitet og din træningsaktivitet",
        ".* haluaa käyttää liikunta- ja kuntoilutietojasi",
        "“.*” आपकी चाल और तंदुरुस्ती गतिविधि तक पहुँचना चाहता है",
        "«.*» vil ha tilgang til bevegelses- og treningsaktiviteten din",
        "“.*” gostaria de aceder à sua atividade física e de fitness.",
        "يرغب \".*\" في الوصول إلى نشاط الحركة واللياقة الخاصة بك",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct WillowAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“.*” vol accedir a les teves dades domèstiques ",
        "„.*“ möchte auf deine Hausdaten zugreifen",
        "‘.*’이(가) 사용자의 홈 데이터에 접근하려고 합니다",
        "'.*' wil toegang tot je woninggegevens",
        "“.*”想访问您的住宅数据",
        "“.*” Would Like to Access Your Home Data",
        "« .* » souhaite accéder aux données locales",
        "「.*」想要取用您的家庭資料",
        ".* haluaa käyttää kotitietojasi",
        "“.*” želi pristupiti vašim podacima o domu",
        "„.*” chce uzyskać dostęp do danych domu",
        "“.*” Ev Verilerinize Erişmek İstiyor",
        "Программа «.*» запрашивает доступ к Вашим данным о доме",
        "«.*» vil ha tilgang til hjemmedataene dine",
        "“.*” Deseja Ter Acesso aos Seus Dados",
        "”.*” begär åtkomst till dina hemdata",
        "“.*” Mahu Mengakses Data Rumah Anda",
        "“.*” gostaria de aceder aos dados da sua casa",
        "Aplikácia „.*“ žiada o prístup k dátam domácnosti",
        "“.*” vorrebbe accedere ai dati della tua abitazione",
        "“.*” Ingin Mengakses Data Rumah Anda",
        "« .* » souhaite accéder à vos données locales",
        "״.*״ מבקש/ת לגשת לנתוני הבית שלך",
        "“.*” quiere acceder a tus datos de casa",
        "“.*” vil bruge dine hjemmedata",
        "「.*」要取用你的住家數據",
        "Aplikace „.*“ žádá o přístup k datům vaší domácnosti",
        "“.*” ต้องการที่จะเข้าถึงข้อมูลที่บ้านของคุณ",
        "“.*” आपके होम डेटा तक पहुँचना चाहता है",
        "Αίτημα από «.*» για πρόσβαση στα Οικιακά δεδομένα σας",
        "A(z) „.*” hozzá szeretne férni az Ön Otthon-adataihoz",
        "يرغب \".*\" في الوصول إلى بيانات المنزل الخاصة بك",
        "“.*” Muốn Truy cập Dữ liệu Nhà của bạn",
        "«.*» хоче отримати доступ до даних про ваш дім",
        "“.*”がホームデータへのアクセスを求めています",
        "“.*” ar dori să vă acceseze datele privind locuința",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.any.elements(withLabelsMatchingExpressions: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
