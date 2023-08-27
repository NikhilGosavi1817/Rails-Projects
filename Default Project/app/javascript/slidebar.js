var side = document.querySelector(".opennav")

side.addEventListener("onclick", openNav())

function openNav() { document.getElementById("mySidenav").style.width = "250px"; }

side.addEventListener("onclick", closeNav())

function closeNav() { document.getElementById("mySidenav").style.width = "0"; }