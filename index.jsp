<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tic Tac Toe</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    min-height: 100vh;
    display:flex;
    flex-direction:column;
    transition:0.4s;
}

/* THEMES */
.light { background: linear-gradient(135deg,#667eea,#764ba2); color:white; }
.dark { background:#121212; color:white; }

/* HEADER */
.header {
    padding:15px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background: rgba(0,0,0,0.3);
}

/* TOGGLE */
.toggle {
    cursor:pointer;
    font-size:18px;
}

/* MAIN */
.main {
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* CARD */
.card {
    padding:25px;
    border-radius:20px;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    width:100%;
    max-width:350px;
    animation:fadeIn 0.8s ease;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}

/* HOVER */
button:hover {
    transform:scale(1.05);
    transition:0.3s;
}

/* FOOTER */
.footer {
    text-align:center;
    padding:10px;
    background: rgba(0,0,0,0.3);
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

<div class="header">
<h5>🎮 Tic Tac Toe</h5>
<div class="toggle" onclick="toggleTheme()">🌙</div>
</div>

<div class="main">
<div class="card text-center shadow">

<form action="game.jsp">
<input class="form-control mb-3" name="p1" placeholder="Player 1" required>
<input class="form-control mb-3" name="p2" placeholder="Player 2">

<select class="form-control mb-3" name="mode">
<option value="pvp">Player vs Player</option>
</select>

<button class="btn btn-primary w-100">Start 🚀</button>
</form>

</div>
</div>

<div class="footer">
<p>Mini Project | Tic Tac Toe 🎮</p>
</div>

</body>
</html>