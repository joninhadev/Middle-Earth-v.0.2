local messages = {
	"Encontrou algum bug? Reporte imediatamente, o jogador que for pego abusando de bug, terá sua conta banida!",
	"Não informe sua senha para ninguém, em caso de roubos a equipe não se responsabilizará.",
	"Seja um jogador premium account, ganhe benefícios exclusivos e 50% a mais de experiência.",
	"Utilize sempre blessings para evitar a perda de itens.",
	"Os reward chests para pegar seu loot ficam nos depots das cidades.",
	"Visite nosso site: www.middleearth-server.com",
	"Morreu? Você poderá comprar as blessings nas igrejas de Eriador e Enedwaith. (Utilize AOL para não perder itens até adquirir a bless.",
	"Atenção: evitem usar senhas de outros servidores, a equipe não se responsabilizará por qualquer ato de hacked.",

}

function onThink(interval)
	local msg = messages[math.random(#messages)]
	Game.broadcastMessage(msg, MESSAGE_EVENT_ADVANCE)
	return true
end