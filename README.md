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

## ☸️ Déploiement avec Kubernetes ☸️
Pour utiliser le culster Kubernetes mis à disposition on placera le fichier de configuration en remplacement du fichier $HOME/.kube/config
```bash
$ cp g2-kubeconfig.yml ../.kube/config
```

#### Création d'un namespace
Bien que nous ayons un cluster pour chaque groupe on isolera nos groupe de ressources au sein de celui-ci.
On commence par lancer minikube
```bash 
$ minikube start
```

On créer un namespace
```bash
$ kubectl create namespace ahmad-antigone
```
On fait en sorte qu'il soit utilisé
```bash
$ kubectl config set-context --current --namespace=ahmad-antigone
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


