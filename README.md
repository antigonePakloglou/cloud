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

#### Manifest odoo-erp.yaml
On créer le manifest odoo-erp.yaml das lequel on précise les 2 images que nous souhaitons lancer en simultanées
