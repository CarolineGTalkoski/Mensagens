<%-- 
    Document   : index
    Created on : 25 de jul. de 2024, 15:26:32
    Author     : Aluno
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mensagens.Mensagens"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="Mensagens">
        <h1>Mensagens!</h1>
        
        <form action="index.jsp" method="post">
            
            <label for="titulo">Título da conversa: </label>
            <input type="text" id="titulo" name="titulo" value="" required="">
            </label><br><br>
            <label for="autor">Nome do autor: </label>
                <input type="text" id="autor" name="autor" value="" required="">
            </label><br><br>
            <label for="mensagem">Mensagem: </label>
                <input type="text" id="mensagem" name="mensagem" value="" required="" >
            </label><br><br>
            <input type="submit" value="Enviar">
            
        </form>
        </div>
        <%
        ArrayList<Mensagens> mensagens = (ArrayList<Mensagens>) session.getAttribute("mensagem");
        if (mensagens == null) {
            mensagens = new ArrayList<>();
            session.setAttribute("mensagem", mensagens);
        }
            
            String titulo = request.getParameter("titulo");         
            String autor = request.getParameter("autor");
            String mensagem = request.getParameter("mensagem");
        

        if (titulo != null && autor != null && mensagem != null && !titulo.isEmpty() && !autor.isEmpty() && !mensagem.isEmpty()) {
            mensagens.add(new Mensagens(titulo,autor,mensagem));
            }
            
        %>
            
        <%
         out.print("<h6>Mensagens enviadas:</h6>");
    for (Mensagens m : mensagens) {
        %>
        
        
        <div>
            <h3><%= m.getTitulo() %></h3>
            <p><strong>Autor:</strong> <%= m.getAutor() %></p>
            <p><strong>Mensagem:</strong> <%= m.getMensagem() %></p>
        </div>
        
        
        <%
            }
        %>
        
        
    </body>
</html>
