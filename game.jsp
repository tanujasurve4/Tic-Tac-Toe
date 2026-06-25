<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    min-height:100vh;
    display:flex;
    flex-direction:column;
    transition:0.4s;
}

.light { background: linear-gradient(135deg,#1d2b64,#f8cdda); color:white; }
.dark { background:#121212; color:white; }

/* HEADER */
.header {
    display:flex;
    justify-content:space-between;
    padding:15px;
    background: rgba(0,0,0,0.4);
}

/* MAIN */
.main {
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* GAME BOX */
.game-box {
    padding:25px;
    border-radius:20px;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    text-align:center;
    width:100%;
    max-width:350px;
    animation:fadeIn 0.8s ease;
}

@keyframes fadeIn {
    from {opacity:0; transform:scale(0.9);}
    to {opacity:1; transform:scale(1);}
}

/* GRID */
.grid {
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:10px;
}

/* CELLS */
.cell {
    aspect-ratio:1;
    font-size:2.5rem;
    border:none;
    border-radius:15px;
    background:rgba(255,255,255,0.2);
    transition:0.3s;
}

.cell:hover {
    transform:scale(1.1);
    box-shadow:0 0 15px cyan;
}

/* STATUS */
.status {
    margin:10px;
    font-weight:bold;
}

/* BUTTON */
.restart-btn {
    margin-top:15px;
    transition:0.3s;
}

.restart-btn:hover {
    transform:scale(1.05);
}

/* FOOTER */
.footer {
    text-align:center;
    padding:10px;
    background: rgba(0,0,0,0.4);
}
</style>

<script>
let turn="X", gameOver=false;

function toggleTheme(){
    document.body.classList.toggle("dark");
    document.body.classList.toggle("light");
}

/* SHOW WHO IS X AND O */
function updateTurn(){
    let p1 = "<%=request.getParameter("p1")%>";
    let p2 = "<%=request.getParameter("p2")%>";
    let mode = "<%=request.getParameter("mode")%>";

    let playerName = (turn=="X") ? p1 : (mode=="ai" ? "Computer" : p2);

    document.getElementById("turnText").innerHTML =
        "Turn: <span style='color:"+(turn=="X"?"cyan":"pink")+"'>" 
        + playerName + " (" + turn + ")</span>";
}

function play(btn){
if(btn.textContent=="" && !gameOver){
btn.textContent=turn;
btn.style.color=(turn=="X")?"cyan":"pink";

if(checkWinner(turn)){
gameOver=true;

let p1 = "<%=request.getParameter("p1")%>";
let p2 = "<%=request.getParameter("p2")%>";
let mode = "<%=request.getParameter("mode")%>";

let winnerName = (turn=="X") ? p1 : (mode=="ai" ? "Computer" : p2);

setTimeout(()=>{
window.location.href="result.jsp?winner="+winnerName+
"&p1="+p1+"&p2="+p2;
},1000);

}else if(checkDraw()){
gameOver=true;
setTimeout(()=>{
window.location.href="result.jsp?winner=Draw"+
"&p1=<%=request.getParameter("p1")%>&p2=<%=request.getParameter("p2")%>";
},1000);
}else{
turn=(turn=="X")?"O":"X";
updateTurn();
}
}
}

function checkWinner(s){
let b=document.querySelectorAll(".cell");
let w=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
return w.some(c=>c.every(i=>b[i].textContent==s));
}

function checkDraw(){
return [...document.querySelectorAll(".cell")].every(b=>b.textContent!="");
}

/* RESET GAME */
function resetGame(){
    document.querySelectorAll(".cell").forEach(cell=>{
        cell.textContent="";
        cell.style.color="";
    });
    turn="X";
    gameOver=false;
    updateTurn();
}

window.onload=updateTurn;
</script>

</head>

<body class="light">

<!-- HEADER -->
<div class="header">
<h5>🎮 Tic Tac Toe</h5>
<div style="cursor:pointer" onclick="toggleTheme()">🌙</div>
</div>

<!-- MAIN -->
<div class="main">
<div class="game-box">

<!-- PLAYER DISPLAY -->
<h6>
<span style="color:cyan;"><%=request.getParameter("p1")%> (X)</span>
vs
<span style="color:pink;">
<%=("ai".equals(request.getParameter("mode"))?"Computer":request.getParameter("p2"))%> (O)
</span>
</h6>

<!-- TURN -->
<div id="turnText" class="status"></div>

<!-- GRID -->
<div class="grid">
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
<button class="cell" onclick="play(this)"></button>
</div>

<!-- RESTART -->
<button class="btn btn-warning w-100 restart-btn" onclick="resetGame()">🔄 Restart Game</button>

</div>
</div>

<!-- FOOTER -->
<div class="footer">
<p>Mini Project | Tic Tac Toe 🎮</p>
</div>

</body>
</html>