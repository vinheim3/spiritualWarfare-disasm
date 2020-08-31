main:
	wla-gb -o game.o game.s
	wlalink -S linkfile spiritualWarfare.gb
	rm game.o
