local messages = {
	"Encontrou algum bug? Reporte imediatamente, o jogador que for pego abusando de bug, ter� sua conta banida!",
	"N�o informe sua senha para ningu�m, em caso de roubos a equipe n�o se responsabilizar�.",
	"Seja um jogador premium account, ganhe benef�cios exclusivos e 50% a mais de experi�ncia.",
	"Utilize sempre blessings para evitar a perda de itens.",
	"Os reward chests para pegar seu loot ficam nos depots das cidades.",
	"Visite nosso site: www.middleearth-server.com",
	"Morreu? Voc� poder� comprar as blessings nas igrejas de Eriador e Enedwaith. (Utilize AOL para n�o perder itens at� adquirir a bless.",
	"Aten��o: evitem usar senhas de outros servidores, a equipe n�o se responsabilizar� por qualquer ato de hacked.",

}

function onThink(interval)
	local msg = messages[math.random(#messages)]
	Game.broadcastMessage(msg, MESSAGE_EVENT_ADVANCE)
	return true
end