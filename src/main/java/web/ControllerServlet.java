package web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Etudiant;

@WebServlet(name = "Etudiants", urlPatterns = {"/", "/Etudiants"})
public class ControllerServlet extends HttpServlet {
    private EtudiantModele modele;

    @Override
    public void init() throws ServletException {
        modele = new EtudiantModele();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action != null) {
            switch (action) {
                case "add":
                    request.getRequestDispatcher("ajouter.jsp").forward(request, response);
                    return;
                    
                case "edit":
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        Etudiant etudiant = modele.getEtudiant(id);
                        if (etudiant != null) {
                            request.setAttribute("etudiant", etudiant);
                            request.getRequestDispatcher("modifier.jsp").forward(request, response);
                            return;
                        }
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                    break;
                    
                case "delete":
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        modele.supprimerEtudiant(id);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                    break;
                    
                case "search":
                    String type = request.getParameter("type");
                    String valeur = request.getParameter("valeur");

                    if (type != null && !type.trim().isEmpty() && valeur != null && !valeur.trim().isEmpty()) {
                        try {
                            request.setAttribute("etudiants", modele.getEtudiantsPar(type, valeur));
                            request.getRequestDispatcher("liste.jsp").forward(request, response);
                            return;
                        } catch (Exception e) {
                            e.printStackTrace();
                            request.setAttribute("error", "Une erreur s'est produite lors de la recherche.");
                        }
                    } else {
                        request.setAttribute("error", "Les paramètres de recherche sont invalides.");
                    }
                    
                    break;

            }
        }
        
        request.setAttribute("etudiants", modele.getEtudiants());
        request.getRequestDispatcher("liste.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String filiere = request.getParameter("filiere");
        
        if (action != null) {
            switch (action) {
                case "add":
                    modele.addEtudiant(nom, prenom, email, filiere);
                    break;
                    
                case "update":
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        modele.modEtudiant(id, nom, prenom, email, filiere);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                    break;
            }
        }
        
        response.sendRedirect("Etudiants");
    }
}
