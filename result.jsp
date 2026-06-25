<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    min-height:100vh;
    display:flex;
    flex-direction:column;
    transition:0.4s;
    font-family: Arial;
}

/* THEMES */
.light { background: linear-gradient(135deg,#ff9a9e,#fad0c4); color:#333; }
.dark { background:#121212; color:white; }

/* HEADER */
.header {
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 20px;
    background: rgba(0,0,0,0.4);
    color:white;
    backdrop-filter: blur(10px);
}

/* MAIN CENTER */
.main {
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

/* RESULT BOX */
.box {
    padding:35px;
    border-radius:20px;
    background: rgba(255,255,255,0.25);
    backdrop-filter: blur(12px);
    text-align:center;
    width:100%;
    max-width:400px;
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    animation:fadeIn 0.8s ease;
}

/* ANIMATION */
@keyframes fadeIn {
    from {opacity:0; transform:scale(0.8);}
    to {opacity:1; transform:scale(1);}
}

/* BUTTON HOVER */
.btn-primary:hover {
    transform:scale(1.05);
    transition:0.3s;
}

/* FOOTER */
.footer {
    text-align:center;
    padding:12px;
    background: rgba(0,0,0,0.4);
    color:white;
}
</style>

<script>
function toggleTheme(){
    document.body.classList.toggle("dark");
    document.body.classList.toggle("light");
}
</script>

</head>

<body class="light">

<!-- HEADER -->
<div class="header">
<h5 class="mb-0">🎮 Tic Tac Toe | Result</h5>
<div onclick="toggleTheme()" style="cursor:pointer;font-size:18px;">🌙</div>
</div>

<!-- MAIN -->
<div class="main">

<div class="box">

<%
String winner = request.getParameter("winner");
String p1 = request.getParameter("p1");
String p2 = request.getParameter("p2");

// safety
if(p1 == null) p1 = "Player 1";
if(p2 == null) p2 = "Player 2";
%>

<h2 class="mb-3">
<%
if("Draw".equals(winner)){
    out.print("🤝 It's a Draw!");
} else {
    out.print("🏆 " + winner + " Wins!");
}
%>
</h2>

<p class="mb-3">🎮 <%=p1%> vs <%=p2%></p>

<a href="index.jsp">
<button class="btn btn-primary w-100">🔄 Play Again</button>
</a>

</div>

</div>

<!-- FOOTER -->
<div class="footer">
<p class="mb-0">Mini Project | Tic Tac Toe 🎮</p>
</div>

</body>
</html>