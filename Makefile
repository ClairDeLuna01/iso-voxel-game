CC = g++
CPPFLAGS = -Wall -g
SDLFLAGS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_gpu -Ofast
OBJ = obj/main.o obj/game.o obj/texture.o obj/render_engine.o obj/render_engine_2.o obj/world.o obj/multithreaded_event_handler.o obj/Shader.o obj/projection_grid.o obj/UI_text.o obj/UI_tile.o obj/UI_engine.o obj/meteo.o
INCLUDE = -Iinclude 
EXEC = iso.exe
DEL_win = del /Q /F
DEL = rm -f # linux

default: $(EXEC)

run :
	$(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC) $(SDLFLAGS)

install : $(EXEC)

obj/main.o : main.cpp
	$(CC) -c $(CPPFLAGS) $(SDLFLAGS) $(INCLUDE) $< -o $@ 

obj/%.o : src/%.cpp
	$(CC) -c $(CPPFLAGS) $(SDLFLAGS) $(INCLUDE) $< -o $@ 

.PHONY : clean cleanwin install clear-undo run default

clean : 
	$(DEL) $(EXEC) obj/*.o

cleanwin : 
	$(DEL_win) $(EXEC) obj\*.o

clear-undo :
	find saves -name '*.bak' -print0 | xargs -0 rm