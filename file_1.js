//Example of DOM open redirect vulnerability (http://vulnerable/page.html#https://www.attacker.com/):
document.location = document.location.hash.slice(1);