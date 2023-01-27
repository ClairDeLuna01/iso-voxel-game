CC = g++
CPPFLAGS = -Wall
SDLFLAGS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_gpu -O3
OBJ = obj/main.o obj/game.o obj/texture.o obj/render_engine.o  obj/world.o obj/multithreaded_event_handler.o obj/Shader.o obj/projection_grid.o  obj/UI_engine.o obj/render_engine_2.o obj/UI_tile.o
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

obj/render_engine_2.o: src/render_engine_2.cpp
	$(CC) -c $(CPPFLAGS) $(SDLFLAGS) $(INCLUDE) $< -o $@

obj/UI_tile.o: src/UI_tile.cpp
	$(CC) -c $(CPPFLAGS) $(SDLFLAGS) $(INCLUDE) $< -o $@

obj/%.o : src/%.cpp include/%.hpp
	$(CC) -c $(CPPFLAGS) $(SDLFLAGS) $(INCLUDE) $< -o $@ 

PHONY : clean

clean-linux : 
	$(DEL) $(EXEC) obj/*.o

clean : 
	$(DEL_win) $(EXEC) obj\*.o