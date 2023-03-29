## Containerization and Cloud 

👥 Ahmad IBRAHIM et Antigone PAKLOGLOU

a. Comment utiliser votre travail, quelles sont les commandes importantes
(construction des images, déploiement sur Kubernetes)
b. Les difficultés rencontrées
c. Les choix techniques que vous avez fait
d. Tout ce qui vous semblera utile



## Construction des conteneurs <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><rect fill="#fff" height="512" rx="15%" width="512"/><path d="m296 226h42m-92 0h42m-91 0h42m-91 0h41m-91 0h42m8-46h41m8 0h42m7 0h42m-42-46h42" stroke="#066da5" stroke-width="38"/><path d="m472 228s-18-17-55-11c-4-29-35-46-35-46s-29 35-8 74c-6 3-16 7-31 7h-275c-5 19-5 145 133 145 99 0 173-46 208-130 52 4 63-39 63-39" fill="#066da5"/></svg>
Nous avons créer deux Dockerfile pour construire les deux images demandées : 
Odoo et PostgreSQL.

Pour construire les images utiliser la commande 
```bash
$ docker build 
```

## Déploiement avec Kubernetes ☸️
