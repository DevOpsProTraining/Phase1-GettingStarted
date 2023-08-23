#!/bin/bash

# Récupérer les secrets depuis les secrets GitHub
USERNAME=$WORDPRESS_USERNAME
PASSWORD=$WORDPRESS_PASSWORD
SITE_URL="https://votresite.wordpress.com"  # Remplacez par l'URL de votre site WordPress

# Obtenir un token d'authentification en utilisant les identifiants de l'utilisateur
TOKEN=$(curl -X POST -d "username=$USERNAME&password=$PASSWORD" "$SITE_URL/wp-json/jwt-auth/v1/token" | jq -r .token)

# Contenu HTML généré à partir de votre Markdown (remplacez cette ligne)
HTML_CONTENT="<p>Contenu HTML généré</p>"

# Créer un nouvel article sur WordPress en utilisant l'API REST
curl -X POST "$SITE_URL/wp-json/wp/v2/posts" -H "Authorization: Bearer $TOKEN" -d "{\"title\":\"Titre de l'article\",\"content\":\"$HTML_CONTENT\",\"status\":\"draft\"}"
