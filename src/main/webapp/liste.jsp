<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="metier.Etudiant" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Fond avec dégradé animé */
        body {
            background: linear-gradient(45deg, #4e73df, #1cc88a, #36b9cc);
            background-size: 300% 300%;
            animation: gradientAnimation 8s ease infinite;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin: 0;
            font-family: 'Arial', sans-serif;
            overflow-x: hidden;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Style du conteneur principal */
        .container {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 1200px;
            height: auto;
            min-height: 80vh; /* Minimum height for the container */
            display: flex;
            flex-direction: column;
        }

        h2 {
            font-size: 30px;
            font-weight: bold;
            color: #4e73df;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Style du tableau */
        .table-wrapper {
            max-height: 400px;
            overflow-y: auto;
            margin-bottom: 20px;
        }

        .table thead {
            background-color: #4e73df;
            color: #ffffff;
        }

        .btn {
            border-radius: 10px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #4e73df;
            border: none;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
        }

        .btn-danger {
            background-color: #e74a3b;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn-warning {
            background-color: #f6c23e;
            border: none;
        }

        .btn-warning:hover {
            background-color: #e0a500;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .form-control, .form-select {
            border-radius: 10px;
        }

        /* Pagination */
        .pagination {
            justify-content: center;
            margin-top: 20px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        /* Add some padding for the form fields */
        .form-select, .form-control {
            padding: 10px;
        }

        .table th, .table td {
            padding: 15px;
        }

        /* Add margin for the add student button */
        .d-flex.justify-content-end {
            margin-top: 20px;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Gestion des Étudiants</h2>

        <!-- Barre de recherche -->
        <div class="row mb-4">
            <div class="col-md-8 mx-auto">
                <form action="Etudiants" method="get" class="d-flex">
                    <input type="hidden" name="action" value="search">
                    <select name="type" class="form-select me-2">
                        <option value="nom">Nom</option>
                     
                        <option value="email">Email</option>
                        
                    </select>
                    <input type="text" name="valeur" class="form-control me-2" placeholder="Rechercher..." required>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i> Rechercher
                    </button>
                </form>
            </div>
        </div>

        <!-- Tableau des étudiants -->
        <div class="table-wrapper">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Filière</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Etudiant> etudiants = (List<Etudiant>) request.getAttribute("etudiants");
                    if (etudiants != null && !etudiants.isEmpty()) {
                        for (Etudiant e : etudiants) {
                    %>
                    <tr>
                        <td><%= e.getID() %></td>
                        <td><%= e.getNom() %></td>
                        <td><%= e.getPrenom() %></td>
                        <td><%= e.getEmail() %></td>
                        <td><%= e.getFiliere() %></td>
                        <td>
                            <a href="Etudiants?action=edit&id=<%= e.getID() %>" class="btn btn-warning btn-sm">
                                <i class="fas fa-edit"></i> Modifier
                            </a>
                            <a href="Etudiants?action=delete&id=<%= e.getID() %>" class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet étudiant ?')">
                                <i class="fas fa-trash-alt"></i> Supprimer
                            </a>
                        </td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">Aucun étudiant trouvé</td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
        </div>

       

        <!-- Bouton ajouter un étudiant -->
        <div class="d-flex justify-content-end">
            <a href="Etudiants?action=add" class="btn btn-success">
                <i class="fas fa-user-plus"></i> Ajouter un étudiant
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
