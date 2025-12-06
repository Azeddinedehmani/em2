<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="metier.Etudiant" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un étudiant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Fond avec dégradé animé */
        body {
            background: linear-gradient(45deg, #4e73df, #1cc88a, #36b9cc);
            background-size: 300% 300%;
            animation: gradientAnimation 8s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Style du conteneur */
        .form-container {
            background: #fff;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            position: relative;
        }

        /* Design du titre */
        .form-title {
            font-size: 28px;
            font-weight: bold;
            color: #4e73df;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Lignes décoratives */
        .divider {
            height: 2px;
            background: linear-gradient(to right, #4e73df, #1cc88a);
            border: none;
            margin: 20px 0;
        }

        /* Style des champs */
        .form-control {
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 10px 15px;
            font-size: 16px;
        }

        /* Style des boutons */
        .btn-primary {
            background-color: #4e73df;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
        }

        .btn-secondary {
            border-radius: 10px;
            font-size: 16px;
            padding: 10px 20px;
            color: #fff;
            background-color: #36b9cc;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #17a2b8;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Modifier un étudiant</h2>
        <hr class="divider">
        
        <% Etudiant etudiant = (Etudiant) request.getAttribute("etudiant"); %>
        
        <form action="Etudiants" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= etudiant.getID() %>">
            
            <!-- Nom -->
            <div class="mb-4">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" value="<%= etudiant.getNom() %>" required>
                <div class="invalid-feedback">Veuillez entrer un nom valide.</div>
            </div>

            <!-- Prénom -->
            <div class="mb-4">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="prenom" name="prenom" value="<%= etudiant.getPrenom() %>" required>
                <div class="invalid-feedback">Veuillez entrer un prénom valide.</div>
            </div>

            <!-- Email -->
            <div class="mb-4">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= etudiant.getEmail() %>" required>
                <div class="invalid-feedback">Veuillez entrer une adresse email valide.</div>
            </div>

            <!-- Filière -->
            <div class="mb-4">
                <label for="filiere" class="form-label">Filière</label>
                <input type="text" class="form-control" id="filiere" name="filiere" value="<%= etudiant.getFiliere() %>" required>
                <div class="invalid-feedback">Veuillez entrer une filière valide.</div>
            </div>

            <!-- Boutons -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Mettre à jour</button>
                <a href="Etudiants" class="btn btn-secondary">Retour</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validation Bootstrap
        (function () {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
