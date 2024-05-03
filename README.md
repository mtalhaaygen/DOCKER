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

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```


test;
` sudo docker run hello-world `

### Container nedir?

  

Kendilerine ait process services ve networkleri olan aynı işletim sistemi (ya da VM) üzerinde olup birbirinden izole çalışan ortamlardır.

VM ye çok benziyor lakin vm tamamen izole edilmiş sistemlerken

Tüm containerlar ortak olarak yüklü oldukları işletim sisteminin kernelini kullanır. Process sona erdiğinde çıkış yapar.

Container türleri

1. <mark>**LXC (Linux Containers)**,</mark> Linux çekirdeği içerme özelliklerine yönelik bir kullanıcı arayüzüdür¹. Güçlü bir API ve basit araçlarla, Linux kullanıcılarının kolayca sistem veya uygulama konteynerleri oluşturmasını ve yönetmesini sağlar¹. LXC, bir chroot ve tam teşekküllü bir sanal makine arasında bir şey olarak düşünülür¹.
	- LXC, Linux çekirdeği içerme özelliklerine yönelik bir kullanıcı arayüzüdür¹.
	- LXC, bir chroot ve tam teşekküllü bir sanal makine arasında bir şey olarak düşünülür¹.
	- LXC, çoklu süreçler gerektirir ve bu nedenle esnek değildir².
	- LXC, anlık görüntü (snapshot) ve canlı taşıma (live migration) gibi özellikleri desteklemez².
	- LXC, ölçeklenebilirlik sağlamaz ve yönetim yetenekleri zayıftır².
	- LXC, C API kullanır².

2. <mark>**LXD (Linux Daemon)**</mark>, modern, güvenli ve güçlü bir sistem konteyneri ve sanal makine yöneticisidir⁹. Tam Linux sistemlerini konteynerler veya sanal makineler içinde çalıştırma ve yönetme için birleşik bir deneyim sağlar⁹. LXD, birçok Linux dağıtımı için resimleri destekler ve çok güçlü, ancak oldukça basit, bir REST API etrafında inşa edilmiştir⁹.
	- LXD, LXC'nin bir uzantısıdır ve LXC'ye yeni özellikler ve yetenekler sağlar¹².
	- LXD, çoklu konteynerler için tek bir süreç sağlar, bu da onu daha esnek hale getirir².
	- LXD, anlık görüntü ve canlı taşıma gibi özellikleri destekler².
	- LXD, LXC'de ölçeklenebilirliği sağlar².
	- LXD, daha iyi yönetim yetenekleri sunar, örneğin depolama havuzlama².
	- LXD, kullanıcı dostu bir arayüz sağlar².
	- LXD, veri işleme sonrası veri almayı sağlar².
	- LXD, REST API kullanır².

3. <mark>**LXCFS**</mark>, Linux konteynerlerinin daha çok bir sanal makine gibi hissetmesi amacıyla yazılmış küçük bir FUSE dosya sistemidir⁴. LXCFS, /proc dosyalarının bazılarının üzerine bağlanabilir ve CGroup farkındalığına sahip değerler sağlar⁵. Ayrıca, konteynerin kendi cgroup'larının altındaki cgroup'lara yalnızca erişim sağladığından emin olur⁴.
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

#### Docker exec
Bu komut çalışan bir kontainerlerimizin üzerinde bir komut çalıştırmak ve işlem yapmak için
kullandığımız parametredir.

```
Örnekler;
docker exec -it container_name bash
docker exec container_name apt update
```

#### Docker top
komutu ile container içerisinde çalışan processleri listeleyebiliriz.
`docker top “container id”`

#### Docker stats
Docker stats komutu ile containerimizin kaynak(cpu, memory) kullanımını görebiliriz
`docker stats “container id”`

##### Diğer docker komutları
`docker container prune` stop edilen tüm containerları siler

```
docker run -d redis // detach mod

docker attach [container id] // attach mod

docker container logs [container id] // detach modda çalışan dockerın arka plandayken oluşan loglarını görmek için

  

dcoker inspect [id] // imageler yada containerlar hakkında detaylı bilgi

docker image inspect “imaj” (imaj detaylarına listeler)

docker run -it –rm –name myubuntu ubuntu // -rm ile çıkış yaptığımızda container otomatik olarak silinir 

```

```
docker image login / logout (docker hostumuzda dockerhub hesabımıza oturum açmak için kullanılır, oturum sonrasında imajlarımızı push edebiliriz.) Cıkış yapmak için docker logut komutunu kullanabiliriz.
```

![Pasted image 20240503132552](https://github.com/mtalhaaygen/DOCKER/assets/63591196/7ba8f877-799e-45d2-9d74-58c9d06d767f)


```
docker image push (dockerhub hesabımıza imaj gönderir orn;
docker image push maygen/myweb “container id”)

docker image commit (containerilerimizi imaj haline dönüştürmek için kullanılır kullanımı “

docker image commit “container adı” ”repostiyory adı/imajı adı” )

Docker image history (imajların katman detaylarının cıktısını verir)

docker login (dockerhub user / password)

docker images // docker hub kütüphanesinden docker sunucumuza indirdiğimiz imajları listelemek için kullanırız.

docker rm containerID/containerName

docker rm $(docker ps --all -q) // daha önce ayağa kaldırdığımız container bilgilerini siler

docker rmi imageID/imageName // image i daha önce kullandıysak silmeyebilir

docker rmi imageID/imageName --force // şeklinde zorlayarak silinebilir


docker image prune (local indirilen tüm imajları siler)

docker ps

docker ps -a

docker container list

vb. çeşitli komutlar


**_docker inspect containerId/imageId_** ile image yada container hakkında detaylı bilgi alabiliyoruz.
```
  


  

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

**_her imagei farklı dış portlarda ayağa kaldırabiliriz_**

  

### Volume Mapping

  

Docker host üzerinde containerlar <mark>stateless</mark> olarak çalışırlar(Volume Mapping yapılmadığında). Herhangi bir bilgi içerisinde kayıt edilmediği için container durdurulduğunda yaptığımız değişiklikler kaybolacak. Geçici olarak saklanılan container durdurulduğunda kaybolan bu verilerin path yolu docker host üzerinde linux “var/lib/Docker/..” Windows “C:\Programdata\Docker\..” yolundadır.

Bunu engellemek için <mark>volume</mark> kullanılır. Docker üzerine 2 farklı volume türü bulunmakta
1. Data Volume: Docker host üzerinde volume oluşturulduktan sonra containera baglama
işlemidir, Docker hostlar üzerinde oluşturulmaktadır. Oluşturulan data volumeler
/var/lib/docker/volumes üzerinde saklanmaktadır.
`docker volume create data` (create parametresi ile volume oluşturuyoruz, Volume
oluşturmadan container run ederken -v parametresi ile volume belirtirsek, kendisi arka planda
volume oluşturacaktır.)

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


![[image.png]]
  
Default olarak docker ile gelen 3 network driver modeli

bulunmaktadır.

- bridge network :

normal şekilde containerları ayağa kaldırdığımızda default olarak docker host üzerinde bir networke sahip oluyor bu networkün türü bridge network.

- none network

containerın herhangi bir şekilde erişilebilir olmasını istemiyorsak container türünü none yaparız

- host network

kendi cihazınızda yada ağınızda çalışan bir uygulama gibi çalışmasını istiyorsak bu network türünü kullanıyoruz. Docker hostun üzerinden sadece port bilgisi alarak docker host üzerinden containerı ayağa kaldırılmış oluyoruz

Diğerleri; #overlay #MACVlan

![Pasted image 20240503122647](https://github.com/mtalhaaygen/DOCKER/assets/63591196/9170bde9-54d1-4b24-a69b-4033b5b983d9)  

Bir diğer network türü kullanıcı tanımlı networklerdir,

`docker network create --driver bridge --subnet 182.18.0.0/24 --gateway 182.18.0.1 my-network`

gibi oluşturulur.

  
  

`docker network ls` ile var olan network türlerini görebiliriz.

  ![[image2.png]]


Aynı network üzerindeki containerlar birbirine bağlamak

![[image3.png]]

  
  

### Dockerfile (Kendi image mizi oluşturmak)

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

#### Diğer Dockerfile ifadeleri

[dockerfile reference](https://docs.docker.com/reference/dockerfile/)

```dockerfile

#Container içerisine dışarıdan yani dockerhost üzerinden yada internet üzerinde data aktarmak için kullanılır (ADD kaynak dosya container hedef dosya)
ADD http://www.program/programlar/xx.exe /var/xx.exe 

# container içerisinde volume olarak ayarlanacak alanı belirlemek için
VOLUME /data

LABEL org.opencontainers.image.authors="SvenDowideit@home.org.au"
```
  

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
4. Nginx kurulumu `sudo apt install nginx`
5. reverse proxy

##### Yapılacaklar

1. [x] Makefile ile docker başlatmak
2. [x] .env file ne işe yarayacakl
3. [x] burada ne diyor chate yorumlat  "Docker konteyneri bir sanal makine değildir. Bu nedenle, onu çalıştırmaya çalışırken 'tail -f' vb. tabanlı herhangi bir hack yaması kullanmanız önerilmez. Daemonların nasıl çalıştığını ve bunları kullanmanın iyi bir fikir olup olmadığını okuyun."
5. [x] PID 1 ve Docker dosyaları yazmak için en iyi uygulamalar hakkında bilgi edinin.
6. [x]       device: /$HOME/maygen/data/wordpress satırlarını değiştir " /home/login/data olmalı"
7. [x] .env dosyasını .gitignore ile yoksayılmalı mı?
8. teker teker tüm dosyaları chat e yorumlata oku
9. [x] debian hangi sürümünü kullandıgını sistemden nasıl göstereceksin cat /etc/os-release
10. [x] ssl sertifikası

### Grafik Arayüz ile Docker Yönetim Toolları

1. **KITEMATIC** 
2. **PORTAINER**
3. **Rancher**: çoklu Docker ortamlarını yönetmek için kullanılan bir platformdur. Konteynerleri izleyebilir, güncelleyebilir ve ölçeklendirebilirsiniz.
4. **Swarm Visualizer**: Swarm Visualizer, Docker Swarm kümesini görsel olarak görüntülemek için kullanılır.
5. **Cockpit**: Linux sunucularını yönetmek için kullanılan bir araçtır. Docker konteynerlerini de yönetebilirsiniz.

### container'a dosya aktarma

Containe’larımıza data transfer etmenin 3 yolu bulunmakta bunlar;
1-docker container cp (copy)
2-Mount Volume
3-İnternet (get, sftp)

Bir Docker container'ına dosya aktarımı için birkaç farklı yöntem kullanabilirsiniz. İşte bunlardan bazıları:

1. **Docker Cp Komutu:**

`docker cp` komutu, Docker host makinenizden bir dosyayı veya dizini bir Docker container'ına kopyalamak için kullanılır. Örnek olarak, `docker cp` komutunu kullanarak bir dosyayı host makinenizden bir Docker container'ına kopyalayabilirsiniz:

```bash
# host_machine'de /path/to/host/file.txt dosyasını container:/path/to/container/ yoluna kopyalar
docker cp /path/to/host/file.txt container_id:/path/to/container/
```

2. **Docker Volume ile:**

Docker volume'leri, host makinenizdeki dosya sisteminden Docker container'ına dosya aktarımı yapmanın bir başka yoludur. Öncelikle bir volume oluşturmalısınız ve ardından bu volume'ü container'ınıza monte etmelisiniz. Örnek:

```bash
# Docker volume oluştur
docker volume create my_volume

# Container'ı bu volume ile çalıştır
docker run -d -v my_volume:/path/to/container/directory container_image

# Host makinesinde dosyayı volume'a kopyala
docker cp /path/to/host/file.txt my_volume:/path/to/container/directory/file.txt
```

3. **SFTP, FTP veya SCP Kullanımı:**

Bir başka seçenek olarak, FTP veya SCP gibi protokollerle dosya aktarımı yapabilirsiniz. Örneğin, bir FTP sunucusu kurarak veya SCP ile dosyaları aktararak Docker container'ına dosya aktarımı yapabilirsiniz.

```dockerfile
FROM alpine:latest
RUN apk --update add openssh-client
```

```bash
# Dockerfile'ı kullanarak özel imajı oluştur
docker build -t my-ssh-client .

# Docker container'ını başlat
docker run -it --name my-ssh-container my-ssh-client /bin/sh

# Container içinde SCP kullanarak dosya transferi yapma
scp username@remote_host:/path/to/remote_file.txt /path/to/local/directory/
```

Bu yöntemler arasında tercih yaparken, kullanım kolaylığı, güvenlik gereksinimleri ve dosya boyutu gibi faktörleri göz önünde bulundurabilirsiniz. Örneğin, `docker cp` komutu basit ve hızlıdır ancak dosya boyutları büyükse performansı etkileyebilir. Öte yandan, Docker volume'leri daha esnek bir çözüm sunar ancak yönetimi biraz daha karmaşıktır.


### Docker Swarm (Kubernetes alternatifi)

Docker bize 2 mod olarak gelmektedir, Bunlar single mode ve swarm mode’dur. Single mod şimdiye kadar kullandığımız, Swarm mode ise docker host üzerinde inactive şekilde yüklü gelmektedir.

Docker swarm docker’ın geliştirdiği bir orkestrasyon aracıdır. Yani birden fazla docker hostlu
ortamımızda, çalışan docker hostları, servisleri ve containerları yönetmek, cluster(kümeleme) yönetimini sağlamak için kullanılan bir orkestrasyon aracıdır
Dockerswarm, containerlarımız için yüksek seviyeli bir araçtır. Bir docker hostumuzun crash olması durumunda fiziksel yada yazılımsal bir sorun olması halinde üzerinde bulunan tüm containerlar etkilenecek buda bizim için kriz yaratacaktır.
Docker Swarm ile, hostlarımızın arasında bir cluster yapısı oluşturabilir, Kesintisiz hizmet için bu
yapıyı kurabiliriz

Single mode olarak gelen tüm servisleri, bir swarm yapısı oluşturmak için swarm servisini aktif
etmeliyiz, böylece bir cluster yapısı oluşturacak, tüm donanım kaynakları havuz halinde
toplanacaktır.
Swarm içerisindeki bir docker node üzerinde meydana gelen bir sorunda üzerinde bulunan
containerları farklı node’lar üzerine aktarılacaktır.

Farklı orkestrasyon araçlarına değinecek olursak bunlar
1. Swarmkit, üzerinde çalıştığımız
2. Kubernetes, en popülerlerinden
3. Amazon ECS
4. Azure Container Service gibi tooları sayabiliriz.

![Pasted image 20240503162656](https://github.com/mtalhaaygen/DOCKER/assets/63591196/c640b3d0-608f-42a6-853e-293aed320f3c)

Swarmkit üzerinde 2 node yapılandırması mevcuttur bunlar manager ve worker node’lardır.
Manager node swarmkit’in ve diğer workerların yönetiminden sorumludur. Ve swarmkit
üzerinde serfitikasyon yönetimi yapmaktadır, Worker ise clusterin nodelarındandır. Swarmkit
üzerinde birden fazla manager node olabilir. Bir swarmkit yapısında birden fazla manager node var ise bu node lar 2 ye ayrılmaktadır. 
- Leader manager node
- Follower Manager node.
Leader manager node, swarmkit’in kurulumunu yapan node’dur. Tüm yapı leader node
üzerinden yönetilir. Eğer leader manager node üzerinde bir hata alınırsa ortamdaki follower
manager nodlardan birtanesi leader manager node’un yerini alır.
Çoklu node’lu bir ortamda, leader node üzerinde yapılan bir aksiyon yada değişiklik follower
node’lar üzerinde onay alınmaktadır. Bu onay işleminin ardından cluster üzerinde işler
yürümektedir.
Worker Node’ları ise leader ve follower node’ların talimatlarını dinlemekte aynı zamanda workerlar arasında bağlantı sağlamaktadır.

#### Docker Swarm Komutları

![Pasted image 20240503164206](https://github.com/mtalhaaygen/DOCKER/assets/63591196/fb3dac6f-c138-4e60-854f-7d6caab37dcd)
![Pasted image 20240503164400](https://github.com/mtalhaaygen/DOCKER/assets/63591196/93fd1bfe-53c1-4d41-b76a-ddfd4c8c3ea7)

```bash
talha@atomdeveloper:~$ docker node ls
ID                            HOSTNAME         STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
4w8fy4d4z4zri6xkck6m54paz *   docker-desktop   Ready     Active         Leader           25.0.3
talha@atomdeveloper:~$ docker swarm join-token worker 
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-32x55g9uxzexldawhbvvysqrj6v7z62ckxz2axv5k8uxllrhb0-ba964m8a4ua3bgv2gb1b5zz1k 192.168.65.9:2377

talha@atomdeveloper:~$ docker swarm join-token manager
To add a manager to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-32x55g9uxzexldawhbvvysqrj6v7z62ckxz2axv5k8uxllrhb0-16v32uwaeddmj6gss04ngtnur 192.168.65.9:2377

talha@atomdeveloper:~$ docker swarm join --token SWMTKN-1-32x55g9uxzexldawhbvvysqrj6v7z62ckxz2axv5k8uxllrhb0-ba964m8a4ua3bgv2gb1b5zz1k 192.168.65.9:2377
Error response from daemon: This node is already part of a swarm. Use "docker swarm leave" to leave this swarm and join another one.
```


Docker Swarm, tek bir cihaz üzerinde bile “tek node’lu bir Swarm” olarak çalıştırılabilir, ancak gerçek bir üretim ortamında kullanmak için birden fazla cihaz kullanmak daha uygun olacaktır. 🐳
[play with docker](https://labs.play-with-docker.com/) dan daha güzel deneyimleyebilirsin,
 

### Docker Stack 

comming soon

### Docker Secret

comming soon



Halil Göksel
Kablosuz Kedi



