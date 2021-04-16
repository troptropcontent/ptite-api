![](https://github.com/troptropcontent/ptite-front-react/blob/master/src/logo.svg)

# Ptite?

Simple application pour l'organisation de repas entre amis ou pour se rassembler tout simplement. 

L'idée est simple, en quelques clics je peux inviter des groupes d'amis en renseignant : 

1. **Quoi ?** Ptit boeuf bourguignon ? Ptite biere ?
2. **Quand ?** Demain
3. **Où ?** Chez moi
4. **Qui ?** Les Bronzés

Et toutes personnes du groupe reçoivent une invitation où il leur suffit de répondre Oui || Peut-etre || Non

# Fonctionnement de l'application

L'application est séparée en deux : 

* Une application SPA en React ([repo consultable ici](https://github.com/troptropcontent/ptite-front-react)) pour le **front-end**
* Une application API en Ruby On Rails (ce même repo) pour le **back-end** qui génère tout le JSON dont le **front-end** a besoin.

L'Authentification des utilisateurs se fait par transmission de JSON Web Token entre les deux Application. 
Pour ce faire j'utilise les Gems **'bcrypt'** et **'jwt'**

