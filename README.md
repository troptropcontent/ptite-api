![](https://github.com/troptropcontent/ptite-front-react/blob/master/src/logo.svg)

# Ptite?

Une application pour l'organisation de repas entre amis ou pour se rassembler, tout simplement. 

L'idée ? En quelques clics, je peux inviter des d'amis :

1. En créant différents groupes d'amis dans l'application;

2. En créant de nouveaux événements très rapidement:

    * **Quoi ?** Ptit boeuf bourguignon ? Ptit brunch ?
    * **Quand ?** Demain
    * **Où ?** Chez moi
    * **Qui ?** Anciens du lycée

Toutes les personnes du groupe concerné ("Anciens du lycée") reçoivent une invitation sous forme de notification ! 

Il leur suffit alors de répondre Oui || Peut-etre || Non, d'un seul click.


S'ils acceptent, l'évènement s'ajoute à leur agenda.

# Fonctionnement de l'application

L'application est séparée en deux : 

* Une application SPA en React ([repo consultable ici](https://github.com/troptropcontent/ptite-front-react)) pour le **front-end**
* Une application API en Ruby On Rails (ce même repo) pour le **back-end** qui génère tout le JSON dont le **front-end** a besoin.

L'Authentification des utilisateurs se fait par transmission de JSON Web Token entre les deux Application. 
Pour ce faire j'utilise les Gems **'bcrypt'** et **'jwt'**

