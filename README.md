Fully Undetectable Win32 MSFVenom Payload Generator  Radioactiverabbit




                        (`.         ,-,
                        ` `.    ,;' /
                         `.  ,'/ .'
                          `. X /.'
                .-;--''--.._` ` (
              .'            /   `
             ,           ` '   Q '
             ,         ,   `._    \
          ,.|         '     `-.;_'
          :  . `  ;    `  ` --,.._;
           ' `    ,   )   .'
              `._ ,  '   /_
                 ; ,''-,;' ``-
                  ``-..__``--`

				  
			 
+ Radioactiverabbit
+ https://github.com/Realradioactive/radioactiverabbit
+ Bu programın yazımı ve veya düzenlemesi realradioactive tarafından yapılmıştır.
+ Lütfen oluşturduğunuz payloadları hiçbir antivirüs ile veya onlite site ile taratmayınız aksi halde yakın zamanda antivirüsler payloadları yakalayacaktır.
+ Bu araç tamamen güvenlik testleri (pentest vs ) için düzenlenmiştir. Başka hiçbir amaç için kullanılamaz , başka amaçlar için kullanımı yasadışıdır. 
+ Bu aracın kullanımından doğacak tüm zarar ve tüm sorumluluk kullanıcıya aittir.

+ win7 ve üstü sistemleri (powershell destekli) desteklemektedir. 
+ Araç kabaca şu şekilde çalışır:
gerekli ayarlar girildikten sonra powershell payloadı üretilir. 
(deneysel olarak base 64 ile şifrelenip daha sonra deşifre edilir fakat bu 
işlem ve bazı özellikler örneğin süreli bekleme uyku modu şifreli payload saklanması uzaktan tetikleme vs gibi özellikler daha sonra devredışı bırakılmıştır 
(araç yalnızca güvenlik testleri için yazıldığından))
daha sonra bu üretilen payload kodu düzenlediğim .c dilindeki minik programcıklar ile birleştirir. 
main fonksiyonunu çoğu antivirüs direk taradığı için payload kodunu programın verilen adında bir değişken oluşturarak bu değişken içerisine yerleştirir
ve main fonksiyonunda bu değişken tetiklenir.
ayrıca alıntı olarak aldığım bazı kod parçacıkları ile rastgele diziler üretilerek kodun içerisine hiçbir görevi olmayan yalnızca virüs imzasının sabit olmaması için ve 
antilerin taramalarından kaçabilmek için bu diziler eklenir.
daha sonra bu ve benzeri bazı işlemler sonucunda oluşturulan .c uzantılı payload derlenir.
ve kullanıma hazır halde :)

Ek not: program payload üretirken msfvenom ile encodersiz olarak üretilir ve eklenir. istek dahilinde .sh dosyası içerisinde msfvenom payload oluşturma
kod satırına encoder eklenerek özelleştirilebilir. x86/shikata_ga_nai gibi ama bu önerilmez.


+ Please, don't upload to VirusTotal! Use https://antiscan.me

+ Legal disclaimer:

Usage of program for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program 

 Usage:
 
```
git clone https://github.com/Realradioactive/radioactiverabbit
cd radioactiverabbit
bash radioactiverabbit.sh or ./radioactiverabbit
```

