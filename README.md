## Containerization and Cloud 

👥 Ahmad IBRAHIM et Antigone PAKLOGLOU 👥

## 🐋 Construction des conteneurs 🐋
#### PostgreSQL
Nous utiliserons une image de docker hub
```bash
$ docker pull postgres
```
#### Odoo
Nous avons créé un Dockerfile pour construire l'image Odoo. 
Pour la construction de cette image on se basera sur l'image Debian.
On installera les dépendances nécessaires à Odoo.
Comme nous devons accéder à des dépôts avec HTTPS nous avons rajouter apt-transport-https.
Notre port d'écoute sera le 8069.
Après l'installation on videra le cache et on supprimera les éléments générer par apt au moment de la mise à jours.

On construit notre image avec la commande
```bash
$ docker build -t odoo:latest .
```
On vérifie la création de notre image
```bash
$ docker images
```
On lance notre conteneur 
```bash
$ docker run -p 43000:8069 odoo:v1
```

#### On publie notre image sur Docker Hub en public
On se connecte à notre compte
```bash
$ docker login
```
On publie l'image "odoo" dans le repository 
```bash
$ docker tag odoo ahmad0/odoo-erp
$ docker push ahmad0/odoo-erp
```


## ☸️ Déploiement avec Kubernetes ☸️
Pour utiliser le culster Kubernetes mis à disposition on placera le fichier de configuration en remplacement du fichier $HOME/.kube/config
```bash
$ cp g2-kubeconfig.yml ../.kube/config
```

#### Utilisation du cluster
On utilise le cluser mis à disposition
```bash 
$ kubectl config use-context g2
```

#### Manifest odoo-erp.yaml
On créer le manifest odoo-erp.yaml dans lequel on précise les 2 images que nous souhaitons lancer en simultanées.
```bash
$ kubectl create -f manifests/odoo-erp.yaml
```
On lance la commande pour nous  permettre de nous connecter à notre serveur Odoo
```bash
$ kubectl proxy
```

On est supposé pouvoir y accéder 
```bash
$ 127.0.0.1:8001
```

#### Manifest odoo-service.yaml
On crée un service qui va nous premettre d'accéder à nos pods qui sont des resssources éphemeres en permettant un accès durable.
```bash
 $ kubectl create -f manifests/odoo-service.yaml
```


On rencontre des difficultés pour se connecter à notre url. 
Lorsqu'on regarde notre pod avec la commande ci dessous il est affiché en erreur.
```bash
$ kubectl get pod 
```
Nous avons créer un service mais ca ne semble pas non plus etre focntionnel.
On a tenter de lancer la commande ci dessous pour générer un service 
```bash
$ kubectl expose deployment odoo-erp --name=odoo-service --type=LoadBalancer --port 80 --target-port 8069
```

