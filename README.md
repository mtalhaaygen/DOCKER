#### Docker engine for debian

[how to install docker](https://docs.docker.com/engine/)

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

test;
` sudo docker run hello-world `

### Container nedir?

Kendilerine ait process services ve networkleri olan aynı işletim sistemi (ya da VM) üzerinde olup birbirinden izole çalışan ortamlardır.

VM ye çok benziyor lakin vm tamamen izole edilmiş sistemlerken

Tüm containerlar ortak olarak yüklü oldukları işletim sisteminin kernelini kullanır. Process sona erdiğinde çıkış yapar.

Container türleri

1. ==**LXC (Linux Containers)**,== Linux çekirdeği içerme özelliklerine yönelik bir kullanıcı arayüzüdür¹. Güçlü bir API ve basit araçlarla, Linux kullanıcılarının kolayca sistem veya uygulama konteynerleri oluşturmasını ve yönetmesini sağlar¹. LXC, bir chroot ve tam teşekküllü bir sanal makine arasında bir şey olarak düşünülür¹.
	- LXC, Linux çekirdeği içerme özelliklerine yönelik bir kullanıcı arayüzüdür¹.
	- LXC, bir chroot ve tam teşekküllü bir sanal makine arasında bir şey olarak düşünülür¹.
	- LXC, çoklu süreçler gerektirir ve bu nedenle esnek değildir².
	- LXC, anlık görüntü (snapshot) ve canlı taşıma (live migration) gibi özellikleri desteklemez².
	- LXC, ölçeklenebilirlik sağlamaz ve yönetim yetenekleri zayıftır².
	- LXC, C API kullanır².

2. ==**LXD (Linux Daemon)**==, modern, güvenli ve güçlü bir sistem konteyneri ve sanal makine yöneticisidir⁹. Tam Linux sistemlerini konteynerler veya sanal makineler içinde çalıştırma ve yönetme için birleşik bir deneyim sağlar⁹. LXD, birçok Linux dağıtımı için resimleri destekler ve çok güçlü, ancak oldukça basit, bir REST API etrafında inşa edilmiştir⁹.
	- LXD, LXC'nin bir uzantısıdır ve LXC'ye yeni özellikler ve yetenekler sağlar¹².
	- LXD, çoklu konteynerler için tek bir süreç sağlar, bu da onu daha esnek hale getirir².
	- LXD, anlık görüntü ve canlı taşıma gibi özellikleri destekler².
	- LXD, LXC'de ölçeklenebilirliği sağlar².
	- LXD, daha iyi yönetim yetenekleri sunar, örneğin depolama havuzlama².
	- LXD, kullanıcı dostu bir arayüz sağlar².
	- LXD, veri işleme sonrası veri almayı sağlar².
	- LXD, REST API kullanır².

3. ==**LXCFS**==, Linux konteynerlerinin daha çok bir sanal makine gibi hissetmesi amacıyla yazılmış küçük bir FUSE dosya sistemidir⁴. LXCFS, /proc dosyalarının bazılarının üzerine bağlanabilir ve CGroup farkındalığına sahip değerler sağlar⁵. Ayrıca, konteynerin kendi cgroup'larının altındaki cgroup'lara yalnızca erişim sağladığından emin olur⁴.
	- LXCFS, Linux konteynerlerinin daha çok bir sanal makine gibi hissetmesi amacıyla yazılmış küçük bir FUSE dosya sistemidir⁴.
	- LXCFS, /proc dosyalarının bazılarının üzerine bağlanabilir ve CGroup farkındalığına sahip değerler sağlar.
	- LXCFS, konteynerin kendi cgroup'larının altındaki cgroup'lara yalnızca erişim sağladığından emin olur⁴.


### DOCKER nedir?

kendi bilgisayarımızda tamamladığımız bir yazılım başka bir cihazda kendi pcmizde olduğu gibi çalışmayabilir. Yazılımın bağımlılıkları ve kullandığı kütüphaneler her cihazda ve ortamda aynı olmayacaktır. Ya da farklı uygulamaların kendilerine uyumlu işletim sistemlerinde çalışması gerekebilir. Bu problemleri çözmek için farklı çözümler mevcut

- python virtual environment (yalnızca python kütüphanelerinin çakışmasını engellemek için kullanılıyor, sadece kütüphaneleri içeren bir sanallaştırma)

- docker (vm ye göre daha verimli hızlı çalışıyor -düşük RAM ve CPU Disk kullanımı- sebebi tüm bilgisayarı tamamen sanallaştırmıyor, tüm docker containerları aynı kernel'ı kullanıyor. docker lxc containerlarını kullanıyor. Docker tüm containerların birbirinden bağımsız çalışmasını sağlıyor, containerlar docker olmadan tek başlarınada kullanılabilir fakat bu low level bir yönetim olur docker bizim için bu işlemleri rahatlıtlakla yapabilmemiz için araçlar sağlıyor)

- vm (hypervisor ile aynı donanımın üzerinde farklı işletim sistemlerinin çalışmasını sağlayan teknolojidir. her bir vm in kendi işletim sistemi var)

  
> [!bug] NOT
>  windows container çalıştırmak için docker'ı windows server üzerinden çalıştırabiliriz. Linux kernelı üzerinde win containerı çalıştıramayız ya da düz windows işletim sistemi üzerinde docker kurdugumuzdada docker containerları yönetebilmek için araya sanal linux kernel kuruyor

> [!example]  NOT
> custom bir containerda ayağa kaldırılabilir ya da nodjs, mongodb, gibi bu firmaların üretmiş olduğu hazır containerlarda ayağa kaldırılabilir.

  

### Image nedir?

İçerisinde bir çok farklı yapıyı barındıran yapılardır. (OS, Application vb.)

(Template ya da plan ya da package gibi düşünülebilir)

Imageler Docker Hub repolarında tutuluyor.

  

Imagei çalıştırdığımızda elde ettiğimiz processdir. Bir imageden birsürü container çalıştırılabilir.

  

Pc ne Docker yüklediğinde bu uugulamayaca docker host yada docker engine deniliyor. Docker hub dan istediğimiz imagei `docker pull ubuntu` komutu ile inidirip `docker run ubuntu` ilede çalıştırılabilir bir yapı verir ve ubuntumuzu docker üzerinden çalıştırmış oluruz. pull atmadan direkt run yaparsak localde bulamazsa aradığımız imagei pulllayıp o şekilde çalıştırır.

### Docker Ne işe yarıyor?

  

![dockerneis](https://github.com/mtalhaaygen/DOCKER/assets/63591196/7fc3c666-0c80-4d95-bbb1-bafaee9c88cc)

indirilen her bir image in uniq bir id si olur.
Dockerfile kullanarak imaj oluşturulmaktadır. Tek bir imaj dosyasıyla birçok container oluşturabiliriz, Containerların oluşturulması yada silinmesi imaj dosyasını etkilememektedir.
İmajlar katmanlardan oluşmaktadır. Bir pyton container çalıştırdığımızda bir işletim systemin calışacağı için 1. Katmanı os, 2.Katmanı pyton uygulaması olarak nitelendirilir. Bunların bütünede imaj deriz.

![imagelayer](https://github.com/mtalhaaygen/DOCKER/assets/63591196/c408951d-3984-4518-9436-051ee5b3515e)

  

### Docker Komutlar

  

docker run redis yada docker run mongo

komutları direkt çalışıyor lakin docker run ubuntu işletim sistemine bir görev vermediğimizden çalıştığı gibi kapanıyor. Ubuntunun içerisine girmek için

`docker run -it ubuntu` şeklinde -it flagleri ile ubuntunun içerisine girebiliriz.

bir imagei dublicatelemek için

`docker images tag [image-id] [yenisinin isim]`

Docker çalıştırırken isim vererek çalıştırabiliriz vermezsek random bir name verir.

  
##### Diğer docker komutları
`docker container prune` stop edilen tüm containerları siler

```
docker run -d redis // detach mod

docker attach [container id] // attach mod

docker container logs [container id] // detach modda çalışan dockerın arka plandayken oluşan loglarını görmek için

  

dcoker inspect [id] // imageler yada containerlar hakkında detaylı bilgi

docker image inspect “imaj” (imaj detaylarına listeler)

docker image inspect “imaj” (imaj detaylarına listeler)

>docker image login / logout (docker hostumuzda dockerhub hesabımıza oturum açmak için

kullanılır, oturum sonrasında imajlarımızı push edebiliriz.) Cıkış yapmak için docker logut

komutunu kullanabiliriz.

>docker image push (dockerhub hesabımıza imaj gönderir orn docker image push halilgoksel/myweb “container id”)

>docker image commit (containerilerimizi imaj haline dönüştürmek için kullanılır kullanımı “

docker image commit “container adı” ”repostiyory adı/imajı adı” )

Docker image history (imajların katman detaylarının cıktısını verir)

>docker login (dockerhub user / password)

docker images // docker hub kütüphanesinden docker sunucumuza indirdiğimiz

imajları listelemek için kullanırız.

docker rm containerID/containerName

docker rm $(docker ps --all -q) // daha önce ayağa kaldırdığımız container bilgilerini siler

docker rmi imageID/imageName // image i daha önce kullandıysak silmeyebilir

docker rmi imageID/imageName --force // şeklinde zorlayarak silinebilir


docker image prune (local indirilen tüm imajları siler)

docker ps

docker ps -a

docker container list

vb. çeşitli komutlar

```
  

**_docker inspect containerId/imageId_** ile image yada container hakkında detaylı bilgi alabiliyoruz.

  

### Interaktif Terminal

  

Uygulama bir komut seti bekliyor ise `-it` flagi kullanılıyor, kullanmazsak komut seti girişi yapamadan container kapatılır

`docker run -it interactive-terminal-app`

(-i interaktif terminali -t ise terminalin attach olmasını istediğimizi belirtir.)

  

### TAGs nedir?

  

Dümdüz docker pull atarsak latest version yüklenir. Eğer başka sürüm istiyorsak

`docker pull redis:5` gibi bir çekme yapabiliriz

  

### DockerHub'a image yüklemek

  

Dockerhub ortamımıza imaj yüklemek için bir örnek yapalım, yaptığımız işlemler sırayla

aşağıdaki gibi,

1.docker.hub web adresine gidip halilgoksell/myjen repo’su oluştur.

2. docker host üzerine jen adında volume map’li ve port mapli Jenkins container oluştur.

3.containeri imaja dönüştür.

4. docker.hub’a login ol

5. Oluşturduğun docker imajını push et

6. Docker.hub namespace olarak domainin search et altındaki imajları görüntüle

  

![hubpush](https://github.com/mtalhaaygen/DOCKER/assets/63591196/2a953107-95db-4b90-ae31-bf0621eba9fc)

  
  

### Port Mapping

  

Uygulamaya yerel makinedende erişebilmek için Port mappinge ihtiyacımız var

`docker run -p DIS_PORT:IC_PORT mongo`

**_mongo için iç port 27017 olmalı aksi taktirde bağlanamayacak, aynı şekilde mysql için 3306 iç port değerleri sabit şekilde kullanılıyor_**

`docker run mongo` komutu ile başlatılan MongoDB yalnızca Docker sunucusundan erişilebilir. `docker run -p 27018:27017 mongo` MongoDB'yi 27018 portunda çalıştırır ve hem Docker sunucusundan hem de yerel makineden erişilebilir hale getirir.

**_bir imagei farklı dış portlarda ayağa kaldırabiliriz_**

  

### Volume Mapping

  

Docker host üzerinde containerlar <mark>stateless</mark> olarak çalışırlar(Volume Mapping yapılmadığında). Herhangi bir bilgi içerisinde kayıt edilmediği için container durdurulduğunda yaptığımız değişiklikler kaybolacak.

  

Bunu engellemek için <mark>volume</mark> kullanılır.

Bunu yapmak için;

- Bir container ayağa kaldırdığımızda kayıt edilecek klasörün docker host üzerinden adresi belirtilir.

- Böylece container içerisinde bir veri yazıldığında, Docker engine bunu alır bizim mapping yaptığımız klasörün içerisine aktarır.

- Daha sonrasında container durdurulduğunda bilgiler Docker Host üzerinde kalmaya devam eder.

  

![volumemapping](https://github.com/mtalhaaygen/DOCKER/assets/63591196/dc34e429-4d19-4827-a53e-7526eaf910d8)

  

`docker run -v /opt/data:/data/db mongo`

**_(burada /opt/data hedef artık burada kayıt edilecek, /data/db ise container içerisinde bulunan kaynak klasör)_**

  

### Docker'ı Environment Variable ile başlatmak

  

Bazı containerları ayağa kaldırırken environment variable vermek zorunda kalabiliriz

![environmentRequest](https://github.com/mtalhaaygen/DOCKER/assets/63591196/fc66e900-fe12-4b75-a922-bc642851c22b)

  

görselde görüldüğü gibi mysql için üç environment variabledan biri mutlaka belirtilmek zorunda

```

You need to specify one of the following as an environment variable:

- MYSQL_ROOT_PASSWORD

- MYSQL_ALLOW_EMPTY_PASSWORD

- MYSQL_RANDOM_ROOT_PASSWORD

```

bunu -e flagi ile yapabiliriz, (-e; env variable)

`-e MYSQL_ROOT_PASSWORD=password`

  

`docker run --name talhamysql -e MYSQL_ROOT_PASSWORD=password -v /home/talha/Desktop/docker_volume/firstDB:/var/lib/mysql -p 3131:3306 mysql`

  
  

### Çalışan iki containerı bağlamak

mysql ve phpmyadmin containerlarını ayrı ayrı çalıştırıp etkileşim içinde olmasını isteyebiliriz, bu bağlantı üç farklı şekilde yapılabilir;

  

- link flagi

- docker network

- docker compose

  

#### link flagi

  

Öncelikle bağlanılacak container çalıştırılır. (phpmyadmin ve mysql örneğinde önce mysql)

  

Yukarıdaki gibi normal şekilde mysqli çalıştırıyoruz; önemli detay dış portunu 3306 yapmak zorundayız çünkü phpmyadmin yalnızca o port ile ilgileniyor

`docker run --name firstDB -e MYSQL_ROOT_PASSWORD=password -v /home/talha/Desktop/docker_volume/firstDB:/var/lib/mysql -p 3306:3306 mysql`

  

Daha sonra `--link baglantiKurulacakContainerName:db` ekleyerek phpmyadmini başlatıyoruz. Burada db (alias da deniyor) localhost'a denk geliyor phpmyadmin için bu şekilde

kendi uygulamamızda alias ne ise db yerine onu yazarız

`docker run --name phpmtaadmin -p 8000:80 --link firstDB:db -d phpmyadmin/phpmyadmin`

  

#### Docker Network

  

Docker hostumuzda default olarak docker0 adında var sayılan

bridge network tanımı gelmektedir. Oluşturulan her container

default olarak docker0 networkünü kullanır.

Tüm container birbirileriyle ve internet ile erişimi

bulunmaktadır.


![image](https://github.com/mtalhaaygen/DOCKER/assets/63591196/6c7552fa-28aa-42b4-958f-cbd11b3d05d7)

  
Default olarak docker ile gelen 3 network driver modeli

bulunmaktadır.

- bridge network :

normal şekilde containerları ayağa kaldırdığımızda default olarak docker host üzerinde bir networke sahip oluyor bu networkün türü bridge network.

- none network

containerın herhangi bir şekilde erişilebilir olmasını istemiyorsak container türünü none yaparız

- host network

kendi cihazınızda yada ağınızda çalışan bir uygulama gibi çalışmasını istiyorsak bu network türünü kullanıyoruz. Docker hostun üzerinden sadece port bilgisi alarak docker host üzerinden containerı ayağa kaldırılmış oluyoruz

  
  

Bir diğer network türü kullanıcı tanımlı networklerdir,

`docker network create --driver bridge --subnet 182.18.0.0/24 --gateway 182.18.0.1 my-network`

gibi oluşturulur.

  
  

`docker network ls` ile var olan network türlerini görebiliriz.

![image2](https://github.com/mtalhaaygen/DOCKER/assets/63591196/65554812-6178-46f7-ac78-68220bc6c416)


Aynı network üzerindeki containerlar birbirine bağlamak

![image3](https://github.com/mtalhaaygen/DOCKER/assets/63591196/ab863844-14b6-4e53-a311-58ca133c1cdb)

  
  

### Kendi image mizi oluşturmak

  

Dockerfile adında bir dosya ile kendi imagelerimizi oluşturabiliriz.

  

```Dockerfile

# imageimizin temeli ubuntu olacak

FROM ubuntu:18:04

  

# ubuntu imageimiz üzerinde çalıştırmak istediğimiz komutları RUN ile teker teker yazıyoruz

RUN apt-get update

RUN apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash

RUN apt-get install nodejs -y

  

# dockerfileın bulunduğu dizindeki herşeyi /opt/node-server/ konumuna kopyalıyoruz

COPY . /opt/node-server/

# bundan sonraki komutların çalıştırılacağı dizini belirliyoruz
# workdir aslında container içerisinde bir çalışma dizini belirliyor diyebiliriz, böyle bir klasör yoksa oluşturulacaktır
WORKDIR /opt/node-server

  

# expose ile hangi port üzerinden çalışacağını belirleyebiliriz

# EXPOSE 3000

  

RUN npm install

CMD ["node", "app.js"]

  

```

  

`docker build . -t imageName` şeklinde image tag vererek build edebiliriz.

  

eğer bir noktada hata verirse hatayı düzelttiğimizde kaldığı yerden build etmeye devam eder.

Daha önceden varolan imageleri yada imagelerde yüklü uygulamaları tekrar başka imagelerle yüklersek çok daha hızlı yükleyecek çünkü dockerfileda her bir adım layer olarak kayıt edilir, bir daha öyle bir adım çalışacaksa kayıtlı olan layer kullanılarak hızlıca tamamlanır

  

#### BaseImage

  

herzaman ubuntu gibi bir linux işletim sistemini base olarak belirlemek zorunda değiliz, ubuntu imagei 70mb civarında

`alpine` adında minimal bir linux işletim sistemini kullanarak (yaklaşık 5mb) üretilmiş kullandığımız teknolojilere uygun hazır imageler var.

Örneğin `node` imagei alpine imageini base olarak alıyor. Bizde node imageini base alırsak bir önceki dockerfile şu şekle bürünüyor

  

```dockerfile

FROM node

WORKDIR /opt/node-server

# dockerfileın bulunduğu noktadan klasörleri workdir dizinine kopyalama işlemi yapacak . . . . 
COPY . .

ENV channel=WORKANDFINISH

CMD ["node", "app.js"]

```

  

`COPY COPY` ifadesi ile çalışma dizinine herşeyi kopyalıyoruz, eğer bazı dosyaları görmezden gelmek istiyorsak `.dockerignore` kullanıyoruz.

  
  

### CMD ile ENTRYPOINT arasındaki farklar

  

**CMD** ile **ENTRYPOINT** temelde aynı komutlar yani Container ayağa kalktığı anda çalıştırılacak komutları belirlerler. Fakat ikisi arasındaki temel fark şudur `CMD dockerfileda parametre ile yazılır, entrypointe ise parametre image çalıştırılırken verilir`. Ubuntuyu şu şeklide çalıştırdığınızı farzedelim.

  

> docker run ubuntu

  

ubuntu image'inin içerisinde bulunan **CMD** komutundan dolayı burada container ayağa kalkar ve direk kapanır. Çünkü çalışabilecek bir prosesi bulunmamaktadır. Fakat;

  

> docker run ubuntu sleep 2

  

gibi bir komut verdiğinizde bu arkadaş 2 saniye bekler. Peki neden? Eğer DockerHub üzerinden ubuntunun image'ine giderseniz orada `CMD ["/bin/bash"]` yazdığını göreceksiniz.`docker run imageName` ifadesinden sonra yazdığımız bir argüman bizim Image içerisinde kullandığımız CMD komutunu override eder. Yani `docker run imageName [CMD]`olarak düşünebilirsiniz bunu.

  

Burada CMD komutun içeriğini komple değiştirir yani. Fakat siz parametreyi bizim durumumuzda `sleep 2` yani 2 değerini çalışma anında göndermek istiyorsanız işte işler burada değişiyor.

  

Bunun için ENTRYPOINT kullanabilirsiniz. ENTRYPOINT'in yapmış olduğu işlem; container ayağa kalktığında kendi içerisinde tanımlanmış olan executable bir uygulamaya sizin gönderdiğiniz parametreyi eklemek. Yani;

  

Image içerisinde şöyle bir yapımız olsun;

```dockerfile

FROM ubuntu

ENTRYPOINT ["sleep"]

```

bu image'den bir instance alarak container ayağa kaldırmak istediğinizde;

  

> docker run imageName 10

  

ifadesi gibi bir ifade ile çalıştırırsınız. Bu durumda ENTRYPOINT **10** argümanını alır ve `sleep` in sonuna ekler yani `sleep 10` olur.

  

Temel olarak farkı budur. **CMD** komple değiştirilir, **ENTRYPOINT** ekleme yapar.

  

Eğer ENTRYPOINT için default bir değer vermek istiyorsak

```Dockerfile

FROM ubuntu

ENTRYPOINT ["sleep"]

CMD ["10"]

```

  

#### CMD ve ENTRYPOINT Yazım Şekilleri

> CMD ["executable", "param1", "param2", "param3"]

şeklinde JSON formunda bunu yazabildiğiniz gibi shell formunda da yazabilirsiniz.  

> CMD executable param1 param2 param3 param4

Aynı yapı **ENTRYPOINT** için de geçerlidir.

> ENTRYPOINT ["executable"]

şeklinde JSON formunda bunu yazabildiğiniz gibi shell formunda da yazabilirsiniz.

> ENTRYPOINT executable


### Docker Compose

Compose multi-container docker uygulamaları tanımlamak ve çalıştırmak için kullanılan bir araçtır. Compose ile, YAML dosyası kullanarak uygulama servislerini konfigure edebiliriz. Daha sonra bir komut ile yaptığımız konfigürasyonları bütün servisleri oluşturarak başlatabiliriz.

`docker-compose.yml` dosyası oluşturulur ve `docker-compose up` komutu ile build edip çalıştırılır. 
`docker-compose build` ile sadece build edilebilir

`docker-compose down` ilede çalışan docker-compose containerları kapatılabilir.
crtl+c ile kill atma düzgünce kapat :D

##### docker-compose.yml

Örnek yml içeriği;

```yml
version: "3.8" # specify docker-compose version

services:

	todo-app: # name of the first service
		container_name: Talha-Todo-App
		build: . # specify the directory of the Dockerfile bu dockerfile da hangi base image nasıl çalıştırılacak belirtilmiş
		ports: # specify port forewarding
			- "3000:3000"

	mongodb: # name of the second service => container allias name
		image: mongo # specify image to build container from dockerfile olmadan düz bir image kullanmak için
		ports:
			- "27017:27017"
```

docker-compose çalıştırırken volume mapping yapmak;

```yml
version: "3.8"

services:
	todo-app:
		container_name: Talha-Todo-App
		build: .
		ports:
			- "3000:3000"

	mongodb:
		image: mongo
		ports:
			- "27017:27017"
		volumes: # volume mapping mongo için yapılacak
			- host-path-to-data:/data/db # /data/db, MongoDB'nin verilerini varsayılan olarak sakladığı dizin

volumes:
	host-path-to-data: # burada ana makinada veriler nerde tutulacak bilmiyorum :D
```

yml dosyasında bir container çalışmak için başka bir containera gerek duyuyorsa aşağıdaki gibi belirtilmeli;
```yml
depends_on:
	- db
```


### Production

1. Linux sunucuyu al
2. Sunucuya docker engine yükle
3. Cloudflare üzerinden Domain Yönlendirmesi
4. Nginx kurulumu
5. 

#### reverse proxy

Nginx kurulumu => `sudo apt install nginx`
